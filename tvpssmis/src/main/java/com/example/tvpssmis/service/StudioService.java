package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.Crew;
import com.example.tvpssmis.entity.Equipment;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.service.studio.CrewDAO;
import com.example.tvpssmis.service.equipment.EquipmentDAO;
import com.example.tvpssmis.service.equipment.StudioDAO;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
public class StudioService {

	private final StudioDAO studioDAO;
	private final CrewDAO crewDAO;
	private final EquipmentDAO equipmentDAO;

	public StudioService(StudioDAO studioDAO, CrewDAO crewDAO, EquipmentDAO equipmentDAO) {
		this.studioDAO = studioDAO;
		this.crewDAO = crewDAO;
		this.equipmentDAO = equipmentDAO;
	}

	// Retrieve all studios
	public List<Studio> getAllStudios() {
		return studioDAO.findAll();
	}

	// Retrieve studios by school ID
	public List<Studio> getStudiosBySchoolId(int schoolId) {
		return studioDAO.findBySchoolId(schoolId);
	}

	// Register a new studio with optional crew and equipment
	@Transactional
	public void registerStudio(Studio studio, List<Crew> crews, List<Equipment> equipmentList) {
		// Save the studio
		studioDAO.save(studio);

		// Save crew members, if provided
		if (crews != null) {
			for (Crew crew : crews) {
				crew.setStudio(studio); // Associate the crew with the studio
				crewDAO.save(crew);
			}
		}

		// Save equipment, if provided
		if (equipmentList != null) {
			for (Equipment equipment : equipmentList) {
				equipment.setStudio(studio); // Associate the equipment with the studio
				equipmentDAO.save(equipment);
			}
		}
	}

	// Fetch studios pending approval
	public List<Studio> getPendingStudios() {
		return studioDAO.findByStatus("Pending");
	}
	@Transactional
	public Studio getStudioById(int studioId) {
	    return studioDAO.findById(studioId);
	}

	// Update studio status
	@Transactional
	public void updateStudioStatus(int studioId, String status) {
		Studio studio = studioDAO.findById(studioId);
		if (studio != null) {
			studio.setStatus(status);
			studioDAO.save(studio);
		}
	}
	@Transactional
	public long getStudioCount() {
	    return studioDAO.countStudios();
	}
	@Transactional
	public void deleteStudio(int studioId) {
	    Studio studio = studioDAO.findById(studioId);
	    if (studio != null) {
	        studioDAO.delete(studio.getStudioId());
	    }
	}
	@Transactional
	public List<Equipment> getEquipmentByStudioId(int studioId) {
	    return equipmentDAO.findByStudioId(studioId);
	}

}
