package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.StudentApplication;
import com.example.tvpssmis.service.StudentApplicationDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class StudentApplicationService {

    private final StudentApplicationDAO studentApplicationDAO;

    @Autowired
    public StudentApplicationService(StudentApplicationDAO studentApplicationDAO) {
        this.studentApplicationDAO = studentApplicationDAO;
    }

    @Transactional
    public List<StudentApplication> getAllApplications() {
        return studentApplicationDAO.findAll();
    }
    
    @Transactional
    public void registerApplication(StudentApplication application) {
    	studentApplicationDAO.save(application);
    }

    @Transactional
    public void updateApplicationStatus(int application_Id, String status) {
        studentApplicationDAO.updateStatus(application_Id, status);
    }
    
    @Transactional
    public List<StudentApplication> getApplicationsByUserId(int userId) {
        return studentApplicationDAO.findByUserId(userId);
    }
    
    @Transactional
    public StudentApplication getApplicationById(int applicationId) {
    	return studentApplicationDAO.findById(applicationId);
    }
    
    @Transactional
    public void deleteApplication(int applicationId) {
    	StudentApplication application = studentApplicationDAO.findById(applicationId);
    	if(application != null) {
    		studentApplicationDAO.delete(application.getApplication_Id());
    	}
    }

}
