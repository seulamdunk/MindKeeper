package com.mind.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.service.MindGrowService;

@Controller
public class MindGrowController {
	@Autowired
	MindGrowService mindGrowService;
	
	@GetMapping(value="/guest/mindGrow")
	public String getListYoutube(Model m) throws Exception {
		m.addAttribute("youtubeSet", mindGrowService.getListYoutube());
		return "/guest/mindGrow";
	}
	
	
	
	@GetMapping(value="/mindGrowDetail")
	public String viewYoutube(String youtubeUrl, Model m) {
		String url =youtubeUrl.replace("watch?v=","embed/");
		m.addAttribute("youtubeUrl", url);
		return "/guest/mindGrowDetail";
	}
	
	
}
