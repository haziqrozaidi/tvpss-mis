package com.example.tvpssmis.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tvpssmis.entity.StudentApplication;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.ApplicationService;
import com.example.tvpssmis.service.StudentApplicationService;
@Controller
@RequestMapping("/application")
public class ApplicationDashboardController {
    
    @Autowired
    private ApplicationService applicationDAO;
    
    @Autowired
    private StudentApplicationService studentApplicationService;
    
    @GetMapping("/dashboard")
    public String showDashboard(Model model, HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            model.addAttribute("error", "Unauthorized access.");
            return "error";
        }
        
//        long totalApplication = applicationDAO.countTotalApplications();
//        long acceptedApplications = applicationDAO.countAcceptedApplications();
//        long rejectedApplications = applicationDAO.countRejectedApplications();
        
        
        int userId = loggedInUser.getUserId();
        int roleId = loggedInUser.getRole().getRoleId();
        
        List<StudentApplication> applications;
        boolean hasApplication = false;
        
        if(roleId == 4 || roleId == 5) {
        	applications = studentApplicationService.getAllApplications();
        	hasApplication = true;
        } else if (roleId == 3){
        	applications = studentApplicationService.getApplicationsByUserId(userId);
        	hasApplication = applications.stream().anyMatch(application ->application.getUser().getUserId() == loggedInUser.getUserId());
        }else {
        	return "error";
        }
        //Fetch overview data of each application
//        List<StudentApplication> applications = applicationDAO.findAll();      
        
//        List<ApplicationOverview> applicationOverview = new ArrayList<>();
//        for(StudentApplication application : applications) {
//            int numByStatus = applicationDAO.findByStatus(application.getStatus()).size();
//            
//            applicationOverview.add(new ApplicationOverview(application.getApplication_Id(), numByStatus));
//        }
        
        long totalApplication = applications.size();
        long acceptedApplications = applications.stream().filter(app -> "Accepted".equals(app.getStatus())).count();
        long rejectedApplications = applications.stream().filter(app -> "Rejected".equals(app.getStatus())).count();
        
        model.addAttribute("applications", applications);
        model.addAttribute("hasApplication", hasApplication);
        
        model.addAttribute("totalApplications", totalApplication);
        model.addAttribute("acceptedApplications", acceptedApplications);
        model.addAttribute("rejectedApplications", rejectedApplications);
//        model.addAttribute("applicationOverview", applicationOverview);
        
        return "studentApplication/dashboard";
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
        
        return "redirect:/application/dashboard";
	}
    
    public static class ApplicationOverview {
        private int applicationId;
        private int status;
        
        public ApplicationOverview(int applicationId, int status) {
            super();
            this.applicationId = applicationId;
            this.status = status;
        }

        public int getApplicationId() {
            return applicationId;
        }

        public int getStatus() {
            return status;
        }
    }
}
