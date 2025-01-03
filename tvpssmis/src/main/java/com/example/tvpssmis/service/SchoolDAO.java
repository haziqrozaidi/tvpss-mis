package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.School;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class SchoolDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public School findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(School.class, id);
    }

    @Transactional
    public void save(School school) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(school);
    }

    @Transactional
    public void detach(School school) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(school);
    }

    @Transactional
    public void update(int id, School school) {
        Session currentSession = sessionFactory.getCurrentSession();
        School existingSchool = currentSession.get(School.class, id);
        
        if (existingSchool != null) {
            existingSchool.setSchoolName(school.getSchoolName());
            existingSchool.setSchoolAddress(school.getSchoolAddress());
            existingSchool.setContactNumber(school.getContactNumber());
            existingSchool.setEmail(school.getEmail());
            currentSession.merge(existingSchool);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        School schoolToDelete = currentSession.get(School.class, id);
        
        if (schoolToDelete != null) {
            currentSession.delete(schoolToDelete);
        }
    }

    @Transactional
    public List<School> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from School", School.class).getResultList();
    }

    @Transactional
    public School findByName(String schoolName) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from School where schoolName = :name", School.class)
                .setParameter("name", schoolName)
                .uniqueResult();
    }
}
