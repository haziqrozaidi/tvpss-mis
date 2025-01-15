package com.example.tvpssmis.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tvpssmis.entity.Crew;
import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.service.StudioService;
import com.example.tvpssmis.service.CrewService;
import com.example.tvpssmis.service.EquipmentService;
import com.example.tvpssmis.service.ProgramService;

import com.example.tvpssmis.entity.User;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    private final EquipmentService equipmentService;
    private final CrewService crewService;
    private final ProgramService programService;
    private final StudioService studioService;  
    @Autowired
    public DashboardController(EquipmentService equipmentService, CrewService crewService, ProgramService programService,StudioService studioService) {
        this.equipmentService = equipmentService;
        this.crewService = crewService;
        this.programService = programService;
        this.studioService = studioService;
    }
    @GetMapping("/user")
    public String getDashboard(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }

        String role = loggedInUser.getRole().getRoleName();
        model.addAttribute("user", loggedInUser);

        if ("Teacher".equalsIgnoreCase(role)) {
            model.addAttribute("totalStudios", studioService.getStudioCount());
            model.addAttribute("totalEquipment", equipmentService.getEquipmentCount());
            model.addAttribute("totalPrograms", programService.getProgramCount());
            model.addAttribute("totalCrew", crewService.getCrewCount());
            model.addAttribute("programs", programService.getProgramsBySchoolId(loggedInUser.getSchool().getSchoolId()));
            model.addAttribute("crewList", crewService.getCrewBySchoolId(loggedInUser.getSchool().getSchoolId()));
        } else if ("Student".equalsIgnoreCase(role)) {
            model.addAttribute("programs", programService.getProgramsBySchoolId(loggedInUser.getSchool().getSchoolId()));
            //model.addAttribute("applications", applicationService.getApplicationsByStudentId(loggedInUser.getUserId()));
        }

        return "Dashboard/Dashboard";
    }
}

