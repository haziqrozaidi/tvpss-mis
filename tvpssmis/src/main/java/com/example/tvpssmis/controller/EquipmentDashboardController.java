package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.School;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.service.SchoolDAO;
import com.example.tvpssmis.service.StudioDAO;
import com.example.tvpssmis.service.EquipmentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dashboard")
public class EquipmentDashboardController {

    @Autowired
    private SchoolDAO schoolDAO;

    @Autowired
    private StudioDAO studioDAO;

    @Autowired
    private EquipmentDAO equipmentDAO;

    @GetMapping
    public String showDashboard(Model model) {
        // Fetch total numbers
        int totalSchools = schoolDAO.findAll().size();
        int totalStudios = studioDAO.findAll().size();
        int totalEquipment = equipmentDAO.findAll().size();

        // Fetch overview data for each school
        List<School> schools = schoolDAO.findAll();
        List<SchoolOverview> schoolOverview = new ArrayList<>();
        for (School school : schools) {
            int numStudios = studioDAO.findBySchoolId(school.getSchoolId()).size();
            int numEquipment = 0;
            List<Studio> studios = studioDAO.findBySchoolId(school.getSchoolId());
            for (Studio studio : studios) {
                numEquipment += equipmentDAO.findByStudioId(studio.getStudioId()).size();
            }

            schoolOverview.add(new SchoolOverview(school.getSchoolName(), numStudios, numEquipment));
        }

        // Add data to model
        model.addAttribute("totalSchools", totalSchools);
        model.addAttribute("totalStudios", totalStudios);
        model.addAttribute("totalEquipment", totalEquipment);
        model.addAttribute("schoolOverview", schoolOverview);

        return "dashboard";
    }

    // Inner class to hold overview data
    public static class SchoolOverview {
        private String schoolName;
        private int numStudios;
        private int numEquipment;

        public SchoolOverview(String schoolName, int numStudios, int numEquipment) {
            this.schoolName = schoolName;
            this.numStudios = numStudios;
            this.numEquipment = numEquipment;
        }

        public String getSchoolName() {
            return schoolName;
        }

        public int getNumStudios() {
            return numStudios;
        }

        public int getNumEquipment() {
            return numEquipment;
        }
    }
}