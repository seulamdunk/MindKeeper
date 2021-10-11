package com.mind.project.controller;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MindController {
	
	String NATE_WEATHER_MAP_URL = "https://news.nate.com/weather";
	
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
    public String index(Model model) {
    	
    	 
		 Document doc= null;
		 
		 try {
	            doc = Jsoup.connect(NATE_WEATHER_MAP_URL).get();
	            Elements els = doc.select("#country_map");
	           // System.out.println(els);
	            model.addAttribute("test1", els);
	           
	        } catch(Exception e) {
	            
	        }
        return "/guest/index";
    }
    
    
    
}