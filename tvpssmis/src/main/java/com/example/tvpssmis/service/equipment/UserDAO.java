package com.example.tvpssmis.service.equipment;

import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.entity.Role;
import com.example.tvpssmis.entity.School;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public User findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(User.class, id);
    }

    @Transactional
    public void save(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(user);
    }

    @Transactional
    public void detach(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(user);
    }

    @Transactional
    public void update(int id, User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        User existingUser = currentSession.get(User.class, id);
        
        if (existingUser != null) {
            existingUser.setRole(user.getRole());
            existingUser.setSchool(user.getSchool());
            existingUser.setUsername(user.getUsername());
            existingUser.setPassword(user.getPassword());
            existingUser.setFullName(user.getFullName());
            existingUser.setDateOfBirth(user.getDateOfBirth());
            existingUser.setGender(user.getGender());
            existingUser.setContactNumber(user.getContactNumber());
            existingUser.setEmail(user.getEmail());
            existingUser.setAddress(user.getAddress());
            existingUser.setJoinDate(user.getJoinDate());
            existingUser.setStatus(user.getStatus());
            currentSession.merge(existingUser);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        User user = currentSession.byId(User.class).load(id);
        if (user != null) {
            currentSession.delete(user);
        }
    }

    @Transactional
    public List<User> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User", User.class).getResultList();
    }

    @Transactional
    public List<User> findByRoleId(int roleId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where role.roleId = :roleId", User.class)
                .setParameter("roleId", roleId)
                .getResultList();
    }

    @Transactional
    public List<User> findBySchoolId(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where school.schoolId = :schoolId", User.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }
    
    @Transactional
    public Role findRoleById(int roleId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Role.class, roleId);
    }

    @Transactional
    public School findSchoolById(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(School.class, schoolId);
    }
    
    @Transactional
    public User findByUsername(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where username = :username", User.class)
                .setParameter("username", username)
                .uniqueResult();
    }
}
