package com.example.tvpssmis.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tvpssmis.service.equipment.EquipmentDAO;

@Service
public class EquipmentService {
    @Autowired
    private EquipmentDAO equipmentDAO; // or repository interface

    public int getTotalEquipmentBySchoolId(int schoolId) {
        return equipmentDAO.findBySchoolId(schoolId).size();
    }
    @Transactional
    public long getEquipmentCount() {
        return equipmentDAO.countEquipment();
    }

}

