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
public class WeatherController {
	

	@Autowired
	private SituationService situationService;
	
	 @GetMapping("/test")
	 public String test(Model model) throws IOException {
		 List<KoreaStats> koreaStatsList = situationService.getKoreaCovidDatas();
		 model.addAttribute("test", koreaStatsList);
		
		return "공백4";
	}
	 // 미완성
//	 @GetMapping("/test2")
//	 public String test2(Model model) throws IOException{
//		WeatherForecast weather = situationService.getWeatherForecastData(); 
//		model.addAttribute("test2", weather);
//		 return "공백2";
//	 }
	 //미완성이지만 모형만 나옴
	 @GetMapping("/test3")
	 public String test3(Model model) throws IOException{
		 List<WeatherMap> weather_map = situationService.getWeatherMap();
		 model.addAttribute("test3", weather_map);
		 return "공백3";
	 }

}
