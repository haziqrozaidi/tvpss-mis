package com.example.tvpssmis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.CrewService;
import com.example.tvpssmis.service.EquipmentService;
import com.example.tvpssmis.service.ProgramService;
import com.example.tvpssmis.service.StudioService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    private final EquipmentService equipmentService;
    private final CrewService crewService;
    private final ProgramService programService;
    private final StudioService studioService;

    @Autowired
    public DashboardController(
            EquipmentService equipmentService,
            CrewService crewService,
            ProgramService programService,
            StudioService studioService) {
        this.equipmentService = equipmentService;
        this.crewService = crewService;
        this.programService = programService;
        this.studioService = studioService;
    }

    @GetMapping("/user")
    public String getDashboard(Model model, HttpSession session) {
        // Retrieve the logged-in user from the session
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Add the logged-in user to the model
        model.addAttribute("user", loggedInUser);

        // Ensure the user is a teacher
        if (!"Teacher".equalsIgnoreCase(loggedInUser.getRole().getRoleName())) {
            model.addAttribute("error", "Access denied. This dashboard is only for teachers.");
            return "error";
        }

        // Fetch and add teacher-specific data
        int schoolId = loggedInUser.getSchool().getSchoolId();

        model.addAttribute("totalStudios", studioService.getStudiosBySchoolId(schoolId).size());
        model.addAttribute("totalEquipment", equipmentService.getTotalEquipmentBySchoolId(schoolId));
        model.addAttribute("totalPrograms", programService.getProgramsBySchoolId(schoolId).size());
        model.addAttribute("totalCrew", crewService.getCrewBySchoolId(schoolId).size());
        model.addAttribute("programs", programService.getProgramsBySchoolId(schoolId));
        model.addAttribute("crewList", crewService.getCrewBySchoolId(schoolId));

        // Return the teacher dashboard view
        return "Dashboard/Dashboard";
    }
}
