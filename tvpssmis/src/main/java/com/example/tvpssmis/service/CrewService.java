package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.Crew;
import com.example.tvpssmis.service.studio.CrewDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CrewService {
    
	@Autowired
    private final CrewDAO crewDAO;

    public CrewService(CrewDAO crewDAO) {
        this.crewDAO = crewDAO;
    }

    /**
     * Fetch all crew members for a specific studio.
     * 
     * @param studioId the ID of the studio
     * @return List of crew members
     */
    @Transactional
    public List<Crew> getCrewByStudioId(int studioId) {
        return crewDAO.findByStudioId(studioId);
    }
    public List<Crew> getCrewBySchoolId(int schoolId) {
        return crewDAO.findBySchoolId(schoolId);
    }
    /**
     * Save a crew member to the database.
     * 
     * @param crew the crew member to save
     */
    @Transactional
    public void saveCrew(Crew crew) {
        crewDAO.save(crew);
    }

    /**
     * Save multiple crew members to the database.
     * 
     * @param crewList the list of crew members to save
     */
    @Transactional
    public void saveAllCrew(List<Crew> crewList) {
        for (Crew crew : crewList) {
            crewDAO.save(crew);
        }
    }

    /**
     * Update an existing crew member's details.
     * 
     * @param crewId the ID of the crew member to update
     * @param updatedCrew the updated crew details
     */
    @Transactional
    public void updateCrew(int crewId, Crew updatedCrew) {
        crewDAO.update(crewId, updatedCrew);
    }

    /**
     * Delete a specific crew member.
     * 
     * @param crewId the ID of the crew member to delete
     */
    @Transactional
    public void deleteCrew(int crewId) {
        crewDAO.delete(crewId);
    }

    /**
     * Delete all crew members associated with a specific studio.
     * 
     * @param studioId the ID of the studio
     */
    @Transactional
    public void deleteCrewByStudioId(int studioId) {
        List<Crew> crewList = getCrewByStudioId(studioId);
        for (Crew crew : crewList) {
            crewDAO.delete(crew.getCrewId());
        }
    }
    @Transactional
    public long getCrewCount() {
        return crewDAO.countCrew();
    }

}
