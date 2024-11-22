package com.example.tvpssmis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
	@GetMapping("/resources/dashboard")
	public ModelAndView dashboard() {
		ModelAndView modelAndView = new ModelAndView("dashboard");
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
}
