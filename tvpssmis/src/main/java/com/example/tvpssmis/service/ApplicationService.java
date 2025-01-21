package com.example.tvpssmis.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import com.example.tvpssmis.entity.StudentApplication;

@Service
public class ApplicationService {
    private SessionFactory sessionFactory;

    public ApplicationService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public StudentApplication findById(int id) {
        Session session = sessionFactory.openSession();
        StudentApplication application = null;

        try {
            application = session.get(StudentApplication.class, id);
        } finally {
            session.close();
        }
        return application;
    }

    public void delete(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            StudentApplication application = session.get(StudentApplication.class, id);
            if (application != null) {
                session.delete(application);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void save(StudentApplication application) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.save(application);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public int countTotalApplications() {
        Session session = sessionFactory.openSession();
        Long count = (Long) session.createQuery("SELECT COUNT(*) FROM StudentApplication").uniqueResult();
        session.close();
        return count != null ? count.intValue() : 0;
    }

    public int countAcceptedApplications() {
        Session session = sessionFactory.openSession();
        Long count = (Long) session.createQuery("SELECT COUNT(*) FROM StudentApplication WHERE status = 'Accepted'").uniqueResult();
        session.close();
        return count != null ? count.intValue() : 0;
    }

    public int countRejectedApplications() {
        Session session = sessionFactory.openSession();
        Long count = (Long) session.createQuery("SELECT COUNT(*) FROM StudentApplication WHERE status = 'Rejected'").uniqueResult();
        session.close();
        return count != null ? count.intValue() : 0;
    }

    public List<StudentApplication> findByStatus(String status) {
        Session session = sessionFactory.openSession();
        Query<StudentApplication> query = session.createQuery("FROM StudentApplication WHERE status = :status", StudentApplication.class);
        query.setParameter("status", status);
        List<StudentApplication> applications = query.list();
        session.close();
        return applications;
    }

    public List<StudentApplication> findAll() {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        List<StudentApplication> applications = null;

        try {
            transaction = session.beginTransaction();
            Query<StudentApplication> query = session.createQuery("FROM StudentApplication", StudentApplication.class);
            applications = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return applications;
    }

    public void updateStatus(Long id, String status) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            StudentApplication application = session.get(StudentApplication.class, id);
            if (application != null) {
                application.setStatus(status);
                session.update(application);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
