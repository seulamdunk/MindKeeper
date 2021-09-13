package com.mind.project.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MindController {
	
	@RequestMapping(value="/{url}")
    public String viewPage(@PathVariable String url) {
        return "/"+url;
    }
	
    @RequestMapping(value="/")
    public String index() {
        return "/guest/index";
    }
    
    
}