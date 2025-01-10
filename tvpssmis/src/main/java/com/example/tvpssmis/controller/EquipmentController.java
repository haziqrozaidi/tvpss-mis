// EquipmentController.java
package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.Equipment;
import com.example.tvpssmis.service.equipment.EquipmentDAO;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    @Autowired
    private EquipmentDAO equipmentDAO;

    @PostMapping("/update")
    public String updateEquipment(
        @RequestParam("equipmentId") int equipmentId,
        @RequestParam("equipmentName") String equipmentName,
        @RequestParam("equipmentType") String equipmentType,
        @RequestParam("quantity") int quantity,
        @RequestParam("status") String status,
        @RequestParam("purchaseDate") String purchaseDate
    ) {
        Equipment equipment = equipmentDAO.findById(equipmentId);
        equipment.setEquipmentName(equipmentName);
        equipment.setEquipmentType(equipmentType);
        equipment.setQuantity(quantity);
        equipment.setStatus(status);
        equipment.setPurchaseDate(Date.valueOf(purchaseDate));

        equipmentDAO.update(equipmentId, equipment);

        return "redirect:/equipment/inventory?studioId=" + equipment.getStudio().getStudioId();
    }
    
    @PostMapping("/delete")
    public String deleteEquipment(@RequestParam("equipmentId") int equipmentId) {
        Equipment equipment = equipmentDAO.findById(equipmentId);
        int studioId = equipment.getStudio().getStudioId();
        equipmentDAO.delete(equipmentId);

        return "redirect:/equipment/inventory?studioId=" + studioId;
    }
    
    @PostMapping("/add")
    public String addEquipment(
        @RequestParam("studioId") int studioId,
        @RequestParam("equipmentName") String equipmentName,
        @RequestParam("equipmentType") String equipmentType,
        @RequestParam("quantity") int quantity,
        @RequestParam("status") String status,
        @RequestParam("purchaseDate") String purchaseDate
    ) {
        Equipment equipment = new Equipment();
        equipment.setStudio(equipmentDAO.findStudioById(studioId));
        equipment.setEquipmentName(equipmentName);
        equipment.setEquipmentType(equipmentType);
        equipment.setQuantity(quantity);
        equipment.setStatus(status);
        equipment.setPurchaseDate(Date.valueOf(purchaseDate));

        equipmentDAO.save(equipment);

        return "redirect:/equipment/inventory?studioId=" + studioId;
    }
}