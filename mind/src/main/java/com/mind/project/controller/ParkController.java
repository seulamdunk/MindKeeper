package com.mind.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mind.project.model.entity.ParkEntity;
import com.mind.project.repository.ParkRepository;

@Controller
public class ParkController {
	
	@Autowired
	private ParkRepository parkRepository;

	// 공원 마커 찍기
	@ResponseBody
	@RequestMapping(value="/guest/parkRequest", method = RequestMethod.POST)
	public List<ParkEntity> ajax(){
		List<ParkEntity> list = parkRepository.findAll(); 
		List<ParkEntity> parkData = new ArrayList<ParkEntity>();
		
		for (ParkEntity source: list) {
			ParkEntity target =new ParkEntity(); 
								// 원본객체, 복사대상 객체
			BeanUtils.copyProperties(source,target); 
			parkData.add(target);
		}
		return parkData;
	}	
	
	
	


	

}
