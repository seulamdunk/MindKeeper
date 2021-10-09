package com.mind.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	// 키워드 검색
	@ResponseBody
	@RequestMapping(value="/parkSearch")
	public List<ParkEntity> search() {
		List<ParkEntity> parkSearchList = parkService.getParkList();
		List<ParkEntity> parkSearchData = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: parkSearchList) {
			ParkEntity target =new ParkEntity(); 
			BeanUtils.copyProperties(source,target); 
			parkSearchData.add(target);
		}
		return parkSearchData;
	}

	// 전체버튼 클릭했을 때
	@ResponseBody
	@RequestMapping(value="/totalBtn")
	public List<ParkEntity> total() {
		List<ParkEntity> totalBtn = parkService.getParkList();
		List<ParkEntity> total = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: totalBtn) {
			ParkEntity target =new ParkEntity(); 
			BeanUtils.copyProperties(source,target); 
			total.add(target);
		}
		return total;
	}
	
	// 지역버튼 클릭했을 때
	@ResponseBody
	@RequestMapping(value="/areaBtn")
	public List<ParkEntity> area() {
		List<ParkEntity> areaBtn = parkService.getParkList();
		List<ParkEntity> area = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: areaBtn) {
			ParkEntity target =new ParkEntity(); 
			BeanUtils.copyProperties(source,target); 
			area.add(target);
		}
		return area;
	}

}
