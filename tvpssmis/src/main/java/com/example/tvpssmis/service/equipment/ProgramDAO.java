package com.example.tvpssmis.service.equipment;

import com.example.tvpssmis.entity.Program;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ProgramDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Program findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Program.class, id);
    }

    @Transactional
    public void save(Program program) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(program);
    }

    @Transactional
    public void detach(Program program) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(program);
    }

    @Transactional
    public void update(int id, Program program) {
        Session currentSession = sessionFactory.getCurrentSession();
        Program existingProgram = currentSession.get(Program.class, id);
        
        if (existingProgram != null) {
            existingProgram.setSchool(program.getSchool());
            existingProgram.setYouTubeChannelLink(program.getYouTubeChannelLink());
            existingProgram.setEstablishmentDate(program.getEstablishmentDate());
            existingProgram.setStatus(program.getStatus());
            currentSession.merge(existingProgram);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Program programToDelete = currentSession.get(Program.class, id);
        
        if (programToDelete != null) {
            currentSession.delete(programToDelete);
        }
    }

    @Transactional
    public List<Program> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Program", Program.class).getResultList();
    }

    @Transactional
    public List<Program> findBySchoolId(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Program where school.schoolId = :schoolId", Program.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }

    @Transactional
    public List<Program> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Program where status = :status", Program.class)
                .setParameter("status", status)
                .getResultList();
    }
    @Transactional
    public long countPrograms() {
        Session currentSession = sessionFactory.getCurrentSession();
        return (long) currentSession.createQuery("select count(p) from Program p").uniqueResult();
    }

}
