package com.mind.project.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MindController {
	
	@RequestMapping(value="/guest/{url}")
    public String guestPage(@PathVariable String url) {
        return "guest/"+url;
    }

	@RequestMapping(value="/admin/{url}")
	public String adminPage(@PathVariable String url) {
		return "admin/"+url;
	}
	
	@RequestMapping(value="/user/{url}")
	public String userPage(@PathVariable String url) {
		return "user/"+url;
	}
	
    @RequestMapping(value="/")
    public String index() {
        return "/guest/index";
    }
    
    
    
}