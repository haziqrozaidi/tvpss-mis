package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.Content;
import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.service.equipment.ProgramDAO; // Make sure you import your ProgramDAO
import com.example.tvpssmis.service.content.ContentDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ContentService {

	private final ContentDAO contentDAO;
	private final ProgramDAO programDAO; // Inject the ProgramDAO

	public ContentService(ContentDAO contentDAO, ProgramDAO programDAO) {
		this.contentDAO = contentDAO;
		this.programDAO = programDAO;
	}

	// Retrieve all content
	@Transactional(readOnly = true)
	public List<Content> getAllContent() {
		return contentDAO.findAll();
	}

	@Transactional
	public Optional<Content> getContentById(int content_id) {
		return contentDAO.findById(content_id);
	}

	@Transactional
	public void saveContentWithProgram(Content content, int programId) {
		// Retrieve the Program entity using ProgramDAO
		Program program = programDAO.findById(programId);

		// Ensure that the program exists
		if (program == null) {
			throw new RuntimeException("Program not found with ID: " + programId);
		}

		// Associate the Program with the Content
		content.setProgram(program);

		// Save the Content entity (either create or update)
		contentDAO.save(content);
	}

	// Save or update content
	@Transactional
	public void saveContent(Content content) {
		contentDAO.save(content);
	}

	@Transactional
	public void uploadNewContent(int programId, String title, String description, String videoUrl, Date uploadDate,
			String category) {
		// Retrieve the Program entity using ProgramDAO
		Program program = programDAO.findById(programId);

		// Ensure that the program exists
		if (program == null) {
			throw new RuntimeException("Program not found with ID: " + programId);
		}

		// Create a new Content object
		Content newContent = new Content();
		newContent.setProgram(program);
		newContent.setTitle(title);
		newContent.setDescription(description);
		newContent.setContentName(videoUrl);
		newContent.setDate(uploadDate);
		newContent.setCategory(category);

		// Save the new Content object to the database
		contentDAO.save(newContent);

	}

	// Delete content by ID
	@Transactional
	public void deleteContent(int content_Id) {
		contentDAO.delete(content_Id);
	}

	// Retrieve content by program ID
	public List<Content> getContentByProgramId(int programId) {
		return contentDAO.findByProgramId(programId);
	}

	// Retrieve content by category
	public List<Content> getContentByCategory(String category) {
		return contentDAO.findByCategory(category);
	}

	// Retrieve content by title
	@Transactional(readOnly = true)
	public Optional<Content> getContentByTitle(String title) {
		return contentDAO.findByTitle(title);
	}

	// Retrieve content uploaded on a specific date
	public List<Content> getContentByUploadDate(Date uploadDate) {
		return contentDAO.findByUploadDate(uploadDate);
	}

	// Count all content records
	@Transactional
	public long getContentCount() {
		return contentDAO.countContent();
	}
}
