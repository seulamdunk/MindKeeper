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
				.build();
			
			parkList.add(parkdatalist);
		}
		return parkList;
	}
	

	// 키워드 검색
	@Transactional
	public List<ParkEntity> searchPark(String keyword){
		//System.out.println("keyword:" + keyword);
		List<ParkEntity> parkEntities = parkRepository.findAllByParkNameContaining(keyword);
		//System.out.println("parkEntities: " + parkEntities);
		List<ParkEntity> parkSearchList = new ArrayList<>();
	
		if(parkEntities.isEmpty()) return parkSearchList;
		
		for(ParkEntity parkEntity : parkEntities) {
			parkSearchList.add(this.convertEntityToDto(parkEntity));
		}
		//System.out.println(parkSearchList);
		return parkSearchList;
	}
	
	private ParkEntity convertEntityToDto(ParkEntity parkEntity) {
		return ParkEntity.builder()
			.parkName(parkEntity.getParkName())
			.parkScore(parkEntity.getParkScore())
			.parkScoreCnt(parkEntity.getParkScoreCnt())
			.parkScoreLink(parkEntity.getParkScoreLink())
			.parkReview(parkEntity.getParkReview())
			.parkReviewLink(parkEntity.getParkReviewLink())
			.parkLink(parkEntity.getParkLink())
			.parkAddr(parkEntity.getParkAddr())
			.build();
	}
}

