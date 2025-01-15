package com.example.tvpssmis.service.equipment;

import com.example.tvpssmis.entity.Studio;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class StudioDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Studio findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Studio.class, id);
    }

    @Transactional
    public void save(Studio studio) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(studio);
    }

    @Transactional
    public void detach(Studio studio) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(studio);
    }

    @Transactional
    public void update(int id, Studio studio) {
        Session currentSession = sessionFactory.getCurrentSession();
        Studio existingStudio = currentSession.get(Studio.class, id);
        
        if (existingStudio != null) {
            existingStudio.setStudioName(studio.getStudioName());
            existingStudio.setStudioLevel(studio.getStudioLevel());
            existingStudio.setLocation(studio.getLocation());
            existingStudio.setSize(studio.getSize());
            existingStudio.setStatus(studio.getStatus());
            existingStudio.setProgram(studio.getProgram());
            currentSession.merge(existingStudio);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Studio studioToDelete = currentSession.get(Studio.class, id);
        
        if (studioToDelete != null) {
            currentSession.delete(studioToDelete);
        }
    }

    @Transactional
    public List<Studio> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Studio", Studio.class).getResultList();
    }

    @Transactional
    public List<Studio> findByProgramId(int programId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Studio where program.id = :programId", Studio.class)
                .setParameter("programId", programId)
                .getResultList();
    }

    @Transactional
    public List<Studio> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Studio where status = :status", Studio.class)
                .setParameter("status", status)
                .getResultList();
    }

    @Transactional
    public Studio findByName(String studioName) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Studio where studioName = :name", Studio.class)
                .setParameter("name", studioName)
                .uniqueResult();
    }

    @Transactional
    public List<Studio> findByStudioLevel(String studioLevel) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Studio where studioLevel = :level", Studio.class)
                .setParameter("level", studioLevel)
                .getResultList();
    }
    
    @Transactional
    public List<Studio> findBySchoolId(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "select s from Studio s join s.program p where p.school.schoolId = :schoolId", Studio.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }
    @Transactional
    public long countStudios() {
        Session currentSession = sessionFactory.getCurrentSession();
        return (long) currentSession.createQuery("select count(s) from Studio s").uniqueResult();
    }

}
