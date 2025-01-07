package com.example.tvpssmis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.tvpssmis.entity.Equipment;
import com.example.tvpssmis.entity.Program;
import com.example.tvpssmis.entity.School;
import com.example.tvpssmis.entity.Studio;
import com.example.tvpssmis.service.EquipmentDAO;
import com.example.tvpssmis.service.ProgramDAO;
import com.example.tvpssmis.service.SchoolDAO;
import com.example.tvpssmis.service.StudioDAO;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
    private SchoolDAO schoolDAO;
	
	@Autowired
	private ProgramDAO programDAO;
	
	@Autowired
    private StudioDAO studioDAO;
	
	@Autowired
    private EquipmentDAO equipmentDAO;
	
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
	@GetMapping("/resources/equipment")
	public ModelAndView equipment() {
		ModelAndView modelAndView = new ModelAndView("equipment");
		return modelAndView;
	}
	
	@GetMapping("/resources/performance")
	public ModelAndView peformance() {
		ModelAndView modelAndView = new ModelAndView("performance");
		return modelAndView;
	}
	
	@GetMapping("/resources/studio")
	public ModelAndView studio() {
		ModelAndView modelAndView = new ModelAndView("studio");
		return modelAndView;
	}
	
	@GetMapping("/resources/register-studio")
	public ModelAndView registerStudio() {
		ModelAndView modelAndView = new ModelAndView("register-studio");
		return modelAndView;
	}
	
	@GetMapping("/resources/uploadActivityContent")
	public ModelAndView uploadActivityContent() {
		ModelAndView modelAndView = new ModelAndView("uploadActivityContent");
		return modelAndView;
	}
	@GetMapping("/resources/upload")
	public ModelAndView uploadDocument() {
		ModelAndView modelAndView= new ModelAndView("uploadDocument");
		return modelAndView;
	}
	
	@GetMapping("/student/application")
	public ModelAndView studentApplication() {
		ModelAndView modelAndView = new ModelAndView("ManageApplication");
		return modelAndView;
	}
	
	@GetMapping("/student/form")
	public ModelAndView studentForm() {
		ModelAndView modelAndView = new ModelAndView("StudentForm");
		return modelAndView;
	}
	
	@GetMapping("/content/manage")
	public ModelAndView contentManage() {
		ModelAndView modelAndView = new ModelAndView("ManageContent");
		return modelAndView;
	}
	
	@GetMapping("/content/update")
	public ModelAndView contentUpdate() {
		ModelAndView modelAndView = new ModelAndView("UpdateContentInformation");
		return modelAndView;
	}
	
	// Resource Management Module
	@GetMapping("/equipment/dashboard")
    public ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView("equipment/dashboard");

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
        modelAndView.addObject("totalSchools", totalSchools);
        modelAndView.addObject("totalStudios", totalStudios);
        modelAndView.addObject("totalEquipment", totalEquipment);
        modelAndView.addObject("schoolOverview", schoolOverview);

        return modelAndView;
    }
	
	// Resource Management Module
	@GetMapping("/equipment/school")
	public ModelAndView equipmentSchool() {
	    ModelAndView modelAndView = new ModelAndView("equipment/school");
	    List<School> schools = schoolDAO.findAll();
	    
	    // Get programs for each school
	    Map<Integer, Program> schoolPrograms = new HashMap<>();
	    for (School school : schools) {
	        List<Program> programs = programDAO.findBySchoolId(school.getSchoolId());
	        if (!programs.isEmpty()) {
	            schoolPrograms.put(school.getSchoolId(), programs.get(0));
	        }
	    }
	    
	    modelAndView.addObject("schools", schools);
	    modelAndView.addObject("schoolPrograms", schoolPrograms);
	    return modelAndView;
	}
	
	// Resource Management Module
	@GetMapping("/equipment/studio")
    public ModelAndView equipmentStudio(@RequestParam("schoolId") int schoolId) {
        ModelAndView modelAndView = new ModelAndView("equipment/studio");
        
        // Get the school
        School school = schoolDAO.findById(schoolId);
        
        // Get all programs for this school
        List<Program> programs = programDAO.findBySchoolId(schoolId);
        
        // Get all studios for these programs
        List<Studio> studios = new ArrayList<>();
        for (Program program : programs) {
            studios.addAll(studioDAO.findByProgramId(program.getProgramId()));
        }
        
        modelAndView.addObject("school", school);
        modelAndView.addObject("studios", studios);
        return modelAndView;
    }
	
	// Resource Management Module
	@GetMapping("/equipment/inventory")
    public ModelAndView equipmentInventory(@RequestParam("studioId") int studioId) {
        ModelAndView modelAndView = new ModelAndView("equipment/inventory");
        
        Studio studio = studioDAO.findById(studioId);
        List<Equipment> equipmentList = equipmentDAO.findByStudioId(studioId);
        
        modelAndView.addObject("studio", studio);
        modelAndView.addObject("equipmentList", equipmentList);
        return modelAndView;
    }
	
	// Resource Management Module
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
