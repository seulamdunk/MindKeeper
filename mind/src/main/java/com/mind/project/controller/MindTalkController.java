package com.mind.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.service.MindTalkService;
@Controller
public class MindTalkController {
	


	@Autowired
	private MindTalkService mindTalk;
	
	
	@GetMapping(value="/guest/mindTalk")
	public String test(Model m){
		m.addAttribute("customers", mindTalk.getCustomerList());
		System.out.println(m.getAttribute("customers")+"============================");
		return "guest/mindTalk";
		     
	}
	
	
	
	

}


