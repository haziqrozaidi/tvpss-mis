package com.example.tvpssmis.service.studio;


import com.example.tvpssmis.entity.Crew;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CrewDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Crew findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Crew.class, id);
    }
    @Transactional
    public List<Crew> findBySchoolId(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Crew where studio.program.school.schoolId = :schoolId", Crew.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }

    @Transactional
    public void save(Crew crew) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(crew);
    }

    @Transactional
    public void detach(Crew crew) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(crew);
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Crew crewToDelete = currentSession.get(Crew.class, id);
        
        if (crewToDelete != null) {
            currentSession.delete(crewToDelete);
        }
    }
    
    @Transactional
    public void update(int crewId, Crew updatedCrew) {
        Session currentSession = sessionFactory.getCurrentSession();
        Crew existingCrew = currentSession.get(Crew.class, crewId);

        if (existingCrew != null) {
            existingCrew.setUser(updatedCrew.getUser());
            existingCrew.setRole(updatedCrew.getRole());
            existingCrew.setJoinDate(updatedCrew.getJoinDate());
            existingCrew.setStatus(updatedCrew.getStatus());
            currentSession.merge(existingCrew);
        }
    }

    @Transactional
    public List<Crew> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Crew", Crew.class).getResultList();
    }

    @Transactional
    public List<Crew> findByStudioId(int studioId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Crew where studio.studioId = :studioId", Crew.class)
                .setParameter("studioId", studioId)
                .getResultList();
    }
    @Transactional
    public long countCrew() {
        Session currentSession = sessionFactory.getCurrentSession();
        return (long) currentSession.createQuery("select count(c) from Crew c").uniqueResult();
    }

}
