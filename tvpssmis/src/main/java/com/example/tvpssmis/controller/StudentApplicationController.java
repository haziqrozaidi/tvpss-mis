package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.StudentApplication;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.ProgramService;
import com.example.tvpssmis.service.StudentApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/studentApplication")
public class StudentApplicationController {

    private final StudentApplicationService studentApplicationService;
    
    @Autowired
    private ProgramService programService;

    @Autowired
    public StudentApplicationController(StudentApplicationService studentApplicationService) {
        this.studentApplicationService = studentApplicationService;
    }

    @GetMapping("/manage")
    public String manageApplications(Model model) {
        List<StudentApplication> applications = studentApplicationService.getAllApplications();
        model.addAttribute("applications", applications);
        return "studentApplication/application";
    }
    
    @GetMapping("/register")
    public String getApplication(Model model, HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("user");

        // Check if the user is logged in and is a student
        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 3) { // Only students
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }
        
        int schoolId = loggedInUser.getSchool().getSchoolId();
        
        List<Program> programs = programService.getProgramsBySchoolId(schoolId);
        model.addAttribute("programs", programs);
        model.addAttribute("user", loggedInUser);
        
        return "studentApplication/StudentForm";
    }
    
    @PostMapping("/register")
    public String registerApplication(HttpServletRequest request, HttpSession session, Model model) {
    	User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null || loggedInUser.getRole().getRoleId() != 3) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }
        
        StudentApplication application = new StudentApplication();
        application.setSkills(request.getParameter("skills"));
        application.setInterest(request.getParameter("interests"));
        application.setApplyDate(new Date());
        application.setUser(loggedInUser);
        
        int programId = Integer.parseInt(request.getParameter("programId"));
        Program program = programService.getProgramById(programId);
        if (program == null) {
            model.addAttribute("error", "Selected program not found.");
            return "error";
        }
        application.setProgramID(program);
        application.setStatus("Pending");
        
        studentApplicationService.registerApplication(application);
        
        return "redirect:/dashboard";
    }

    @PostMapping("/accept")
    public String acceptApplication(@RequestParam("application_Id") int application_Id) {
        studentApplicationService.updateApplicationStatus(application_Id, "Accepted");
        return "redirect:/application/dashboard";
    }

    @PostMapping("/reject")
    public String rejectApplication(@RequestParam("application_Id") int application_Id) {
        studentApplicationService.updateApplicationStatus(application_Id, "Rejected");
        return "redirect:/application/dashboard";
    }
    
    @PostMapping("/delete")
    	public String deleteApplication(HttpServletRequest request, HttpSession session, Model model) {
    		User loggedInUser = (User) session.getAttribute("user");

            if (loggedInUser == null || (loggedInUser.getRole().getRoleId() != 4 && loggedInUser.getRole().getRoleId() != 5)) {
                model.addAttribute("error", "Unauthorized access.");
                return "error";
            }
            
            int applicationId = Integer.parseInt(request.getParameter("application_Id"));
            
            StudentApplication application = studentApplicationService.getApplicationById(applicationId);
            if(application == null) {
            	model.addAttribute("error", "Application not found.");
            	return "error";
            }
            
            if("Pending".equals(application.getStatus()) || "Rejected".equals(application.getStatus())) {
            	studentApplicationService.deleteApplication(applicationId);
            } else {
            	model.addAttribute("Error", "Only Pending and Rejected applications can be deleted.");
            	return "error";
            }
            
            return "redirect:/dashboard";
    	}
}
