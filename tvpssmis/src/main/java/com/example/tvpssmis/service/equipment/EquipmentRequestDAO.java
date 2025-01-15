package com.example.tvpssmis.service.equipment;

import com.example.tvpssmis.entity.EquipmentRequest;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public class EquipmentRequestDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public EquipmentRequest findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(EquipmentRequest.class, id);
    }

    @Transactional
    public void save(EquipmentRequest request) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(request);
    }

    @Transactional
    public void detach(EquipmentRequest request) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(request);
    }

    @Transactional
    public void update(int id, EquipmentRequest request) {
        Session currentSession = sessionFactory.getCurrentSession();
        EquipmentRequest existingRequest = currentSession.get(EquipmentRequest.class, id);
        
        if (existingRequest != null) {
            existingRequest.setStudio(request.getStudio());
            existingRequest.setEquipmentName(request.getEquipmentName());
            existingRequest.setEquipmentType(request.getEquipmentType());
            existingRequest.setQuantity(request.getQuantity());
            existingRequest.setPrice(request.getPrice());
            existingRequest.setLink(request.getLink());
            existingRequest.setRequestReason(request.getRequestReason());
            existingRequest.setStatus(request.getStatus());
            existingRequest.setRequestDate(request.getRequestDate());
            existingRequest.setApprovalDate(request.getApprovalDate());
            existingRequest.setApprovedBy(request.getApprovedBy());
            existingRequest.setRemarks(request.getRemarks());
            currentSession.merge(existingRequest);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        EquipmentRequest request = currentSession.get(EquipmentRequest.class, id);
        if (request != null) {
            currentSession.delete(request);
        }
    }

    @Transactional
    public List<EquipmentRequest> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from EquipmentRequest", EquipmentRequest.class)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findByStudio(int studioId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "from EquipmentRequest where studio.studioId = :studioId", 
                EquipmentRequest.class)
                .setParameter("studioId", studioId)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "from EquipmentRequest where status = :status", 
                EquipmentRequest.class)
                .setParameter("status", status)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findByDateRange(Date startDate, Date endDate) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "from EquipmentRequest where requestDate between :startDate and :endDate",
                EquipmentRequest.class)
                .setParameter("startDate", startDate)
                .setParameter("endDate", endDate)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findByApprovedBy(int userId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "from EquipmentRequest where approvedBy.userId = :userId",
                EquipmentRequest.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findPendingRequests() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "from EquipmentRequest where status = 'Pending'",
                EquipmentRequest.class)
                .getResultList();
    }

    @Transactional
    public List<EquipmentRequest> findBySchoolId(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery(
                "select er from EquipmentRequest er join er.studio s join s.program p where p.school.schoolId = :schoolId",
                EquipmentRequest.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }

    @Transactional
    public Studio findStudioById(int studioId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Studio.class, studioId);
    }

    @Transactional
    public User findUserById(int userId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(User.class, userId);
    }
}
