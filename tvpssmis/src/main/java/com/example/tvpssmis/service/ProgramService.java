package com.example.tvpssmis.service;

import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.service.equipment.ProgramDAO;
import com.example.tvpssmis.service.equipment.StudioDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ProgramService {

    private final ProgramDAO programDAO;
    private final StudioDAO studioDAO;
    @Autowired
    public ProgramService(ProgramDAO programDAO,StudioDAO studioDAO) {
        this.programDAO = programDAO;
        this.studioDAO = studioDAO;
    }

    @Transactional
    public List<Program> getProgramsBySchoolId(int schoolId) {
        return programDAO.findBySchoolId(schoolId);
    }

    @Transactional
    public Program getProgramById(int programId) {
        return programDAO.findById(programId);
    }

    @Transactional
    public void saveProgram(Program program) {
        programDAO.save(program);
    }

    @Transactional
    public void deleteProgram(int programId) {
        Program program = programDAO.findById(programId);
        if (program == null) {
            throw new IllegalArgumentException("Program not found");
        }

        // Delete related studios
        List<Studio> studios = studioDAO.findByProgramId(programId);
        for (Studio studio : studios) {
            studioDAO.delete(studio.getStudioId());
        }

        // Now delete the program
        programDAO.delete(programId);
    }
    @Transactional
    public long getProgramCount() {
        return programDAO.countPrograms();
    }


}
