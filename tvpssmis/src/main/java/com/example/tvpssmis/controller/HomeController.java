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
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		return modelAndView;
	}
	@GetMapping("/resources/uploadActivityContent")
	public ModelAndView uploadActivityContent() {
		ModelAndView modelAndView2 = new ModelAndView("uploadActivityContent");
		return modelAndView2;
	}
	@GetMapping("/resources/uploadDocument")
	public ModelAndView uploadDocument() {
		ModelAndView modelAndView3= new ModelAndView("uploadDocument");
		return modelAndView3;
	}
}
