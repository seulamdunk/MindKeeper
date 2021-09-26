package com.mind.project.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.model.KoreaStats;
import com.mind.project.model.WeatherForecast;
import com.mind.project.model.WeatherMap;
import com.mind.project.service.SituationService;



@Controller
public class StatusController {
	

	@Autowired
	private SituationService situationService;
	
	 @GetMapping("/corona")
	 public String test(Model model) throws IOException {
		 List<KoreaStats> koreaStatsList = situationService.getKoreaCovidDatas();
		 model.addAttribute("test", koreaStatsList);
		
		return "korea_corona";
	}
	 

	
	 @GetMapping("/weather")
	 public String test2(Model model) throws IOException{
		WeatherForecast weather = situationService.getWeatherForecastData(); 
		model.addAttribute("test2", weather);
		List<String> weather_map = situationService.getWeatherMap();
		model.addAttribute("test3", weather_map);
		
		 return "weather";
 }

}
