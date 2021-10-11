package com.mind.project.controller;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.model.KoreaStats;
import com.mind.project.service.SituationService;



@Controller
public class StatusController {
	String NATE_WEATHER_MAP_URL = "https://news.nate.com/weather";
	
	@Autowired
	private SituationService situationService;
	
	 @GetMapping("/corona")
	 public String corona(Model model) throws IOException {
		 List<KoreaStats> koreaStatsList = situationService.getKoreaCovidDatas();
		 model.addAttribute("test", koreaStatsList);
		
		return "korea_corona";
	}
	 

	
	 @GetMapping("/weather")
	 public String weather(Model model) throws IOException{
		 
		 Document doc= null;
		 
		 try {
	            doc = Jsoup.connect(NATE_WEATHER_MAP_URL).get();
	            Elements els = doc.select("#country_map");
	           // System.out.println(els);
	            model.addAttribute("test1", els);
	           
	        } catch(Exception e) {
	            
	        }
	
		 return "weather";
 }

}
