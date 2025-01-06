package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.Equipment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class EquipmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Equipment findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Equipment.class, id);
    }

    @Transactional
    public void save(Equipment equipment) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(equipment);
    }

    @Transactional
    public void detach(Equipment equipment) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(equipment);
    }

    @Transactional
    public void update(int id, Equipment equipment) {
        Session currentSession = sessionFactory.getCurrentSession();
        Equipment existingEquipment = currentSession.get(Equipment.class, id);
        
        if (existingEquipment != null) {
            existingEquipment.setEquipmentName(equipment.getEquipmentName());
            existingEquipment.setEquipmentType(equipment.getEquipmentType());
            existingEquipment.setQuantity(equipment.getQuantity());
            existingEquipment.setStatus(equipment.getStatus());
            existingEquipment.setPurchaseDate(equipment.getPurchaseDate());
            currentSession.merge(existingEquipment);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Equipment equipment = currentSession.byId(Equipment.class).load(id);
        if (equipment != null) {
            currentSession.delete(equipment);
        }
    }

    @Transactional
    public List<Equipment> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Equipment", Equipment.class).getResultList();
    }

    @Transactional
    public List<Equipment> findByStudioId(int studioId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Equipment where studio.studioId = :studioId", Equipment.class)
                .setParameter("studioId", studioId)
                .getResultList();
    }
}
