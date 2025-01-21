package com.example.tvpssmis.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tvpssmis.entity.StudentApplication;
import com.example.tvpssmis.service.ApplicationService;

@Controller
@RequestMapping("/application")
public class ApplicationController {
    
    @Autowired
    private ApplicationService applicationDAO;
    
    @PostMapping("/update")
    public String updateApplication(
        @RequestParam("applicationId") int applicationId,
        @RequestParam("applyDate") String applyDate,
        @RequestParam("status") String status,
        @RequestParam("interest") String interest,
        @RequestParam("skills") String skills
    ) {
        StudentApplication application = applicationDAO.findById(applicationId);
        application.setApplicationID(applicationId);
        application.setApplyDate(Date.valueOf(applyDate));
        application.setStatus(status);
        application.setInterest(interest);
        application.setSkills(skills);
        
        return "redirect:/studentApplication/application" + application.getUser().getUserId();
    }
    
    @PostMapping("/delete")
    public String deleteApplication(@RequestParam("applicationId") int applicationId) {
        StudentApplication application = applicationDAO.findById(applicationId);
        int userId = application.getUser().getUserId();
        applicationDAO.delete(applicationId);
        
        return "redirect:/studentApplication/application" + userId;
    }

    @PostMapping("/save")
    public String saveApplication(@ModelAttribute StudentApplication studentApplication) {
        applicationDAO.save(studentApplication);
        return "redirect:/dashboard"; // Redirect to the dashboard after saving
    }
}
