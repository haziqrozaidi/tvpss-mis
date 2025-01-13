package com.example.tvpssmis.service.equipment;

import com.example.tvpssmis.entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class RoleDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Role findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Role.class, id);
    }

    @Transactional
    public void save(Role role) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(role);
    }

    @Transactional
    public void detach(Role role) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(role);
    }

    @Transactional
    public void update(int id, Role role) {
        Session currentSession = sessionFactory.getCurrentSession();
        Role existingRole = currentSession.get(Role.class, id);

        if (existingRole != null) {
            existingRole.setRoleName(role.getRoleName());
            existingRole.setDescription(role.getDescription());
            existingRole.setAccessLevel(role.getAccessLevel());
            existingRole.setStatus(role.getStatus());
            currentSession.merge(existingRole);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Role role = currentSession.byId(Role.class).load(id);
        if (role != null) {
            currentSession.delete(role);
        }
    }

    @Transactional
    public List<Role> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Role", Role.class).getResultList();
    }
}
