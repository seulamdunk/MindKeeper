package com.mind.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mind.project.model.entity.ParkEntity;
import com.mind.project.service.ParkService;

@Controller
public class ParkController {

	@Autowired
	private ParkService parkService; 
	
	// 공원 마커 찍기
	@ResponseBody
	@RequestMapping(value="/parkRequest", method = RequestMethod.POST)
	public List<ParkEntity> ajax(){
		List<ParkEntity> parkList = parkService.getParkList(); 
		List<ParkEntity> parkData = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: parkList) {
			ParkEntity target =new ParkEntity(); 
								// 원본객체, 복사대상 객체
			BeanUtils.copyProperties(source,target); 
			parkData.add(target);
		}
		
		return parkData;
	}	
	
	// 키워드 검색 후 마커
	@ResponseBody
	@RequestMapping(value="/parkSearch")
	public List<ParkEntity> search() {
		List<ParkEntity> parkSearchList = parkService.getParkList();
		List<ParkEntity> parkSearchData = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: parkSearchList) {
			ParkEntity target =new ParkEntity(); 
								// 원본객체, 복사대상 객체
			BeanUtils.copyProperties(source,target); 
			parkSearchData.add(target);
		}
		return parkSearchData;
	}
	
}
