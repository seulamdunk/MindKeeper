package com.mind.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mind.project.model.entity.ParkEntity;
import com.mind.project.service.ParkService;

@Controller
public class ParkSearchController {
	
	@Autowired
	private ParkService parkService; 
	
	//공원 목록 출력
	@GetMapping("/guest/park")
	public String list(Model model) {
		List<ParkEntity> parkList = parkService.getParkList();
		model.addAttribute("parkList", parkList);
		 
		 return "/guest/park";
	}

	
	// 키워드 검색
	@PostMapping("/guest/parkSearch")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
		//System.out.println("keyword: " + keyword);
		
		List<ParkEntity> parkSearchList = parkService.searchPark(keyword);
		model.addAttribute("parkSearchList", parkSearchList);
		
		//System.out.println(parkSearchList);
		
		return "/guest/parkSearch";
	}
}
