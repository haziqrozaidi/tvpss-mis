package com.example.tvpssmis.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tvpssmis.entity.StudentApplication;
import com.example.tvpssmis.service.ApplicationService;
@Controller
@RequestMapping("/application")
public class ApplicationDashboardController {
    
    @Autowired
    private ApplicationService applicationDAO;
    
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        long totalApplication = applicationDAO.countTotalApplications();
        long acceptedApplications = applicationDAO.countAcceptedApplications();
        long rejectedApplications = applicationDAO.countRejectedApplications();
        
        //Fetch overview data of each application
        List<StudentApplication> applications = applicationDAO.findAll();
        List<ApplicationOverview> applicationOverview = new ArrayList<>();
        for(StudentApplication application : applications) {
            int numByStatus = applicationDAO.findByStatus(application.getStatus()).size();
            
            applicationOverview.add(new ApplicationOverview(application.getApplicationID(), numByStatus));
        }
        
        model.addAttribute("totalApplications", totalApplication);
        model.addAttribute("acceptedApplications", acceptedApplications);
        model.addAttribute("rejectedApplications", rejectedApplications);
        model.addAttribute("applicationOverview", applicationOverview);
        
        return "studentApplication/dashboard";
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
