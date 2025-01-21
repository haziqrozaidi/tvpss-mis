package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.ProgramService;
import com.example.tvpssmis.service.StudioService;
import com.example.tvpssmis.service.equipment.ProgramDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/program")
public class ProgramController {

    private final ProgramService programService;
    private final StudioService studioService;
    private final ProgramDAO programDAO;
    @Autowired
    public ProgramController(ProgramService programService,StudioService studioService,ProgramDAO programDAO) {
        this.programService = programService;
        this.studioService = studioService;
        this.programDAO = programDAO;
    }

    @GetMapping("/manage")
    public ModelAndView managePrograms(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || !loggedInUser.getRole().getRoleName().equalsIgnoreCase("Teacher")) {
            ModelAndView errorView = new ModelAndView("error");
            errorView.addObject("error", "Unauthorized access.");
            return errorView;
        }
        int testSchoolId = 1; // Replace with a valid school ID from your database
        List<Program> programs = programDAO.findBySchoolId(testSchoolId);
        //List<Program> programs = programDAO.findBySchoolId(loggedInUser.getSchool().getSchoolId());

        if (programs.isEmpty()) {
            ModelAndView modelAndView = new ModelAndView("ProgramManagement");
            modelAndView.addObject("error", "No programs found for your school.");
            return modelAndView;
        }
        System.out.println("Logged-in User ID: " + loggedInUser.getUserId());
        System.out.println("Logged-in User School ID: " + loggedInUser.getSchool().getSchoolId());
        System.out.println("Role Name: " + loggedInUser.getRole().getRoleName());
        System.out.println(programs);

        ModelAndView modelAndView = new ModelAndView("Program/ProgramManagement");
        modelAndView.addObject("programs", programs);
        return modelAndView;
    }



    @PostMapping("/add")
    public String addProgram(
            @RequestParam("youTubeChannelLink") String youTubeChannelLink,
            @RequestParam("establishmentDate") @DateTimeFormat(pattern = "yyyy-MM-dd") java.util.Date establishmentDate,
            @RequestParam("status") String status,
            HttpSession session,
            Model model) {

        // Fetch the logged-in user
        User loggedInUser = (User) session.getAttribute("user");
        if (loggedInUser == null || !"Teacher".equalsIgnoreCase(loggedInUser.getRole().getRoleName())) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        // Create a new Program object
        Program program = new Program();
        program.setSchool(loggedInUser.getSchool()); // Automatically assign the school based on the logged-in user
        program.setYouTubeChannelLink(youTubeChannelLink);
        program.setEstablishmentDate(new java.sql.Date(establishmentDate.getTime())); // Convert util.Date to sql.Date
        program.setStatus(status);

        // Save the program using the service
        programService.saveProgram(program);

        return "redirect:/program/manage"; // Redirect back to the program management page
    }



    @PostMapping("/update")
    public String updateProgram(
    	    @RequestParam("programId") int programId,
    	    @RequestParam("youTubeChannelLink") String youTubeChannelLink,
    	    @RequestParam("establishmentDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) java.util.Date establishmentDate,
    	    @RequestParam("status") String status,
    	    Model model) {

    	    Program program = programService.getProgramById(programId);
    	    if (program == null) {
    	        model.addAttribute("error", "Program not found.");
    	        return "error";
    	    }

    	    program.setYouTubeChannelLink(youTubeChannelLink);
    	    program.setEstablishmentDate(new java.sql.Date(establishmentDate.getTime())); // Convert to java.sql.Date
    	    program.setStatus(status);
    	    programService.saveProgram(program);

    	    return "redirect:/program/manage";
    	}

    @PostMapping("/delete")
    public String deleteProgram(HttpSession session, @RequestParam int programId, Model model) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 2) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        Program program = programService.getProgramById(programId);
        if (program == null) {
            model.addAttribute("error", "Program not found.");
            return "error";
        }

        programService.deleteProgram(programId);

        return "redirect:/program/manage";
    }
}
