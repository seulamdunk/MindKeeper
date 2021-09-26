package com.mind.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mind.project.model.Park;
import com.mind.project.model.entity.ParkEntity;
import com.mind.project.repository.ParkRepository;

@Controller
public class ParkController {
	
	@Autowired
	private ParkRepository parkRepository;

	@ResponseBody
	@RequestMapping(value="/guest/parkSearch" ,method = RequestMethod.POST)
	public List<Park> ajaxtest(){
		List<ParkEntity> list = parkRepository.findAll(); 
		List<Park> parkData = new ArrayList<Park>();
		
		for (ParkEntity source: list) {
			Park target =new Park(); 
			BeanUtils.copyProperties(source,target); 
			parkData.add(target);
		}
		return  parkData;
	}

	

}
