package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Crew;
import com.example.tvpssmis.entity.Equipment;
import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.CrewService;
import com.example.tvpssmis.service.StudioService;
import com.example.tvpssmis.service.equipment.ProgramDAO;
import com.example.tvpssmis.service.equipment.UserDAO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/studios")
public class StudioController {

    private final StudioService studioService;
    private final ProgramDAO programDAO;
    private final UserDAO userDAO;
    private final CrewService crewService;
    
    @Autowired
    public StudioController(StudioService studioService, ProgramDAO programDAO, UserDAO userDAO,CrewService crewService) {
        this.studioService = studioService;
        this.programDAO = programDAO;
        this.userDAO = userDAO;
        this.crewService = crewService;
    }

    @GetMapping
    public String getStudios(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        int roleId = loggedInUser.getRole().getRoleId();
        List<Studio> studios;
        boolean hasStudiosForSchool=false;
        if (roleId == 4 || roleId == 5) { // JPNJ or PPD
            studios = studioService.getAllStudios();
            hasStudiosForSchool = true;
            System.out.println("This stage pass");
        } else { // Teachers and students
            studios = studioService.getStudiosBySchoolId(loggedInUser.getSchool().getSchoolId());
            hasStudiosForSchool = studios.stream()
            .anyMatch(studio -> studio.getProgram().getSchool().getSchoolId() == loggedInUser.getSchool().getSchoolId());
        }
        // Compute whether the user has studios for their school
        
        System.out.println("This stage pass");
        model.addAttribute("studios", studios);
        model.addAttribute("user", loggedInUser);
        model.addAttribute("hasStudiosForSchool", hasStudiosForSchool); // Pass the flag


        return "studio/studios";
    }

    @GetMapping("/register")
    public String showRegisterStudioForm(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) { // Only teachers
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }
     // Fetch students and teachers from the same school
        List<User> users = userDAO.findBySchoolId(loggedInUser.getSchool().getSchoolId());
        model.addAttribute("users", users);
        model.addAttribute("user", loggedInUser);
        return "studio/register-studio";
    }

    @PostMapping("/register")
    public String registerStudio(HttpServletRequest request, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Extract Studio Details
        Studio studio = new Studio();
        studio.setStudioName(request.getParameter("studioName"));
        studio.setLocation(request.getParameter("location"));
        studio.setSize(new BigDecimal(request.getParameter("size")));
        studio.setStatus("Pending");
        // Extract Studio Level
        studio.setStudioLevel(request.getParameter("studioLevel"));
        // Assign Program to Studio
        List<Program> programs = programDAO.findBySchoolId(loggedInUser.getSchool().getSchoolId());
        if (programs.isEmpty()) {
            model.addAttribute("error", "No program found for the user's school.");
            return "error";
        }
        studio.setProgram(programs.get(0));

        // Extract Crew Data
        List<Crew> crews = new ArrayList<>(); // Initialize the list to store crew members

        String[] crewUserIds = request.getParameterValues("crewName[]");
        String[] crewRoles = request.getParameterValues("crewRole[]");

        for (int i = 0; i < crewUserIds.length; i++) {
            Crew crew = new Crew(); // Create a new Crew object
            User crewUser = new User(); // Create a new User object with ID only
            crewUser.setUserId(Integer.parseInt(crewUserIds[i])); // Set the userId from the form
            crew.setUser(crewUser); // Associate the user with the crew
            crew.setRole(crewRoles[i]); // Set the crew role
            crew.setJoinDate(new Date(System.currentTimeMillis())); // Default join date to today
            crew.setStudio(studio); // Associate the crew with the studio
            crew.setStatus("Active"); // Set default status
            crews.add(crew); // Add the crew member to the list
        }
     // Extract Equipment Data
        String[] equipmentNames = request.getParameterValues("equipmentName[]");
        String[] equipmentTypes = request.getParameterValues("equipmentType[]");
        String[] quantities = request.getParameterValues("quantity[]");
        String[] purchaseDates = request.getParameterValues("purchaseDate[]"); // Get purchase dates

        List<Equipment> equipmentList = new ArrayList<>();
        for (int i = 0; i < equipmentNames.length; i++) {
            Equipment equipment = new Equipment();
            equipment.setEquipmentName(equipmentNames[i]);
            equipment.setEquipmentType(equipmentTypes[i]);
            equipment.setQuantity(Integer.parseInt(quantities[i]));
            equipment.setStatus("Good");

            try {
                // Parse and set the purchase date
                equipment.setPurchaseDate(Date.valueOf(purchaseDates[i]));
            } catch (IllegalArgumentException | NullPointerException e) {
                // Handle invalid or null dates gracefully
                equipment.setPurchaseDate(null);
            }

            equipment.setStudio(studio); // Associate with Studio
            equipmentList.add(equipment);
        }


        // Save Studio, Crew, and Equipment
        studioService.registerStudio(studio, crews, equipmentList);

        return "redirect:/studios";
    }
    @GetMapping("/approvals")
    public String showApprovalPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || (loggedInUser.getRole().getRoleId() != 4 && loggedInUser.getRole().getRoleId() != 5)) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Fetch studios pending approval
        List<Studio> pendingStudios = studioService.getPendingStudios();
        model.addAttribute("studios", pendingStudios);
        model.addAttribute("user", loggedInUser);

        return "studio/approvals";
    }

    @PostMapping("/approve")
    public String approveStudio(HttpServletRequest request, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || (loggedInUser.getRole().getRoleId() != 4 && loggedInUser.getRole().getRoleId() != 5)) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        int studioId = Integer.parseInt(request.getParameter("studioId"));
        String action = request.getParameter("action"); // "approve" or "reject"

        if ("approve".equals(action)) {
            studioService.updateStudioStatus(studioId, "Operational");
        } else if ("reject".equals(action)) {
            studioService.updateStudioStatus(studioId, "Rejected");
        }

        return "redirect:/studios/approvals";
    }
    @PostMapping("/updateStatus")
    public String updateStudioStatus(HttpServletRequest request, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || (loggedInUser.getRole().getRoleId() != 4 && loggedInUser.getRole().getRoleId() != 5)) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        int studioId = Integer.parseInt(request.getParameter("studioId"));
        String status = request.getParameter("status");

        studioService.updateStudioStatus(studioId, status);

        return "redirect:/studios"; // Redirect to the Studio Information page
    }
    @PostMapping("/delete")
    public String deleteStudio(HttpServletRequest request, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || (loggedInUser.getRole().getRoleId() != 4 && loggedInUser.getRole().getRoleId() != 5)) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        int studioId = Integer.parseInt(request.getParameter("studioId"));

        Studio studio = studioService.getStudioById(studioId);
        if (studio == null) {
            model.addAttribute("error", "Studio not found.");
            return "error";
        }

        // Allow deletion only for Discontinued, Rejected, or Pending studios
        if ("Discontinued".equals(studio.getStatus()) || "Rejected".equals(studio.getStatus()) || "Pending".equals(studio.getStatus())) {
            studioService.deleteStudio(studioId);
        } else {
            model.addAttribute("error", "Only Discontinued, Rejected, or Pending studios can be deleted.");
            return "error";
        }

        return "redirect:/studios";
    }
    @GetMapping("/{studioId}/details")
    public String getStudioDetails(@PathVariable int studioId, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Fetch studio information
        Studio studio = studioService.getStudioById(studioId);
        if (studio == null) {
            model.addAttribute("error", "Studio not found.");
            return "error";
        }

        // Fetch related information
        Program program = studio.getProgram();

        // Fetch crew and equipment information only for non-students
        List<Crew> crewList = new ArrayList<>();
        List<Equipment> equipmentList = new ArrayList<>();
        if (!"Student".equalsIgnoreCase(loggedInUser.getRole().getRoleName())) {
            crewList = crewService.getCrewByStudioId(studioId);
            equipmentList = studioService.getEquipmentByStudioId(studioId);
        }

        // Add attributes to the model
        model.addAttribute("studio", studio);
        model.addAttribute("program", program);
        model.addAttribute("crewList", crewList);
        model.addAttribute("equipmentList", equipmentList);
        model.addAttribute("userRole", loggedInUser.getRole().getRoleName());

        return "studio/studio-detail";
    }
}
