package com.example.tvpssmis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {
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
}
