package com.example.tvpssmis.controller;

import com.example.tvpssmis.entity.EquipmentRequest;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.equipment.EquipmentRequestDAO;
import com.example.tvpssmis.service.equipment.SchoolDAO;
import com.example.tvpssmis.service.equipment.StudioDAO;
import com.example.tvpssmis.service.equipment.UserDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/equipment/requests")
public class EquipmentRequestController {

    @Autowired
    private EquipmentRequestDAO equipmentRequestDAO;

    @Autowired
    private SchoolDAO schoolDAO;

    @Autowired
    private StudioDAO studioDAO;

    @Autowired
    private UserDAO userDAO;

    // Display all requests
    @GetMapping
    public String showRequests(Model model) {
        List<EquipmentRequest> requests = equipmentRequestDAO.findAll();
        model.addAttribute("equipmentRequests", requests);
        model.addAttribute("schools", schoolDAO.findAll());
        return "equipment/requests";
    }

    // Show requests for a specific school
    @GetMapping("/school/{schoolId}")
    public String showSchoolRequests(@PathVariable int schoolId, Model model) {
        List<EquipmentRequest> requests = equipmentRequestDAO.findBySchoolId(schoolId);
        model.addAttribute("equipmentRequests", requests);
        model.addAttribute("schools", schoolDAO.findAll());
        model.addAttribute("selectedSchool", schoolDAO.findById(schoolId));
        return "equipment/requests";
    }

    // Create new request
    @PostMapping("/create")
    public String createRequest(@ModelAttribute EquipmentRequest request, 
                              @RequestParam("studioId") int studioId,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        try {
            Studio studio = studioDAO.findById(studioId);
            request.setStudio(studio);
            request.setStatus("Pending");
            request.setRequestDate(new Date());
            
            equipmentRequestDAO.save(request);
            redirectAttributes.addFlashAttribute("successMessage", "Equipment request created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error creating equipment request: " + e.getMessage());
        }
        return "redirect:/equipment/requests";
    }

    // Update existing request
    @PostMapping("/update/{id}")
    public String updateRequest(@PathVariable int id,
                              @ModelAttribute EquipmentRequest request,
                              RedirectAttributes redirectAttributes) {
        try {
            equipmentRequestDAO.update(id, request);
            redirectAttributes.addFlashAttribute("successMessage", "Equipment request updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating equipment request: " + e.getMessage());
        }
        return "redirect:/equipment/requests";
    }

    // Approve request
    @PostMapping("/approve/{id}")
    @ResponseBody
    public ResponseEntity<?> approveRequest(@PathVariable int id,
                                          @RequestParam("remarks") String remarks,
                                          HttpSession session) {
        try {
            EquipmentRequest request = equipmentRequestDAO.findById(id);
            if (request != null) {
                // Get current user from session
                Integer currentUserId = (Integer) session.getAttribute("userId");
                User approver = userDAO.findById(currentUserId);
                
                request.setStatus("Approved");
                request.setApprovalDate(new Date());
                request.setApprovedBy(approver);
                request.setRemarks(remarks);
                
                equipmentRequestDAO.update(id, request);
                
                Map<String, Object> response = new HashMap<>();
                response.put("success", true);
                response.put("message", "Request approved successfully");
                return ResponseEntity.ok(response);
            }
            return ResponseEntity.badRequest().body("Request not found");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error approving request: " + e.getMessage());
        }
    }

    // Reject request
    @PostMapping("/reject/{id}")
    @ResponseBody
    public ResponseEntity<?> rejectRequest(@PathVariable int id,
                                         @RequestParam("remarks") String remarks,
                                         HttpSession session) {
        try {
            EquipmentRequest request = equipmentRequestDAO.findById(id);
            if (request != null) {
                // Get current user from session
                Integer currentUserId = (Integer) session.getAttribute("userId");
                User approver = userDAO.findById(currentUserId);
                
                request.setStatus("Rejected");
                request.setApprovalDate(new Date());
                request.setApprovedBy(approver);
                request.setRemarks(remarks);
                
                equipmentRequestDAO.update(id, request);
                
                Map<String, Object> response = new HashMap<>();
                response.put("success", true);
                response.put("message", "Request rejected successfully");
                return ResponseEntity.ok(response);
            }
            return ResponseEntity.badRequest().body("Request not found");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error rejecting request: " + e.getMessage());
        }
    }

    // Get studios for a school (for dynamic dropdown in forms)
    @GetMapping("/studios/{schoolId}")
    @ResponseBody
    public ResponseEntity<?> getSchoolStudios(@PathVariable int schoolId) {
        try {
            List<Studio> studios = studioDAO.findBySchoolId(schoolId);
            return ResponseEntity.ok(studios);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error fetching studios: " + e.getMessage());
        }
    }

    // Filter requests
    @GetMapping("/filter")
    @ResponseBody
    public ResponseEntity<?> filterRequests(@RequestParam(required = false) String status,
                                          @RequestParam(required = false) Integer schoolId,
                                          @RequestParam(required = false) String startDate,
                                          @RequestParam(required = false) String endDate) {
        try {
            List<EquipmentRequest> filteredRequests;
            
            if (status != null && !status.isEmpty()) {
                filteredRequests = equipmentRequestDAO.findByStatus(status);
            } else if (schoolId != null) {
                filteredRequests = equipmentRequestDAO.findBySchoolId(schoolId);
            } else {
                filteredRequests = equipmentRequestDAO.findAll();
            }
            
            return ResponseEntity.ok(filteredRequests);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error filtering requests: " + e.getMessage());
        }
    }
}