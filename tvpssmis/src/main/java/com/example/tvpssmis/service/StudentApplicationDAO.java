package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.StudentApplication;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class StudentApplicationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public List<StudentApplication> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from StudentApplication", StudentApplication.class).getResultList();
    }

    @Transactional
    public StudentApplication findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(StudentApplication.class, id);
    }

    @Transactional
    public void updateStatus(int application_Id, String status) {
        Session session = sessionFactory.getCurrentSession();
        StudentApplication application = session.get(StudentApplication.class, application_Id);
        if (application != null) {
            application.setStatus(status);
            session.update(application);
        }
    }
    
    @Transactional
    public void save(StudentApplication application) {
    	Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(application);
    }
    
    @Transactional
    public List<StudentApplication> findByUserId(int userId) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from StudentApplication where user.userId = :userId", StudentApplication.class)
                     .setParameter("userId", userId)
                     .getResultList();
    }
    
    @Transactional
    public void delete(int id) {
    	Session currentSession = sessionFactory.getCurrentSession();
    	StudentApplication applicationToDelete = currentSession.get(StudentApplication.class, id);
    	if (applicationToDelete != null) {
    		currentSession.delete(applicationToDelete);
    	}
    }

}
