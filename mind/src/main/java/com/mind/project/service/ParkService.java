package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import
org.springframework.transaction.annotation.Transactional;

import
com.mind.project.model.entity.ParkEntity;
import
com.mind.project.repository.ParkRepository;

import lombok.RequiredArgsConstructor;
 
@Service
@RequiredArgsConstructor 
public class ParkService {
	
	@Autowired
	private ParkRepository parkRepository;
	
	// 공원 리스트 출력
	@Transactional
	public List<ParkEntity> getParkList(){
		List<ParkEntity> parks = parkRepository.findAll();
		List<ParkEntity> parkList = new ArrayList<>();
	
	for(ParkEntity park : parks) {
		ParkEntity parkdatalist = ParkEntity.builder()
				.parkNum(park.getParkNum())
				.parkName(park.getParkName())
				.parkScore(park.getParkScore())
				.parkScoreCnt(park.getParkScoreCnt())
				.parkScoreLink(park.getParkScoreLink())
				.parkReview(park.getParkReview())
				.parkReviewLink(park.getParkReviewLink())
				.parkLink(park.getParkLink())
				.parkAddr(park.getParkAddr())
				.parkLat(park.getParkLat())
				.parkLng(park.getParkLng())
				.build();
			
			parkList.add(parkdatalist);
		}
		return parkList;
	}
	
}

