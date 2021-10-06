package com.mind.project.model.entity;
  
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
  
@Getter
@Builder
@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name="park")
@EqualsAndHashCode(of = "parkNum")

public class ParkEntity {  

	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long parkNum;			// 공원 번호
	 
	@Column (name = "park_name")
	private String parkName;		// 공원 이름
	 
	@Column (name = "park_score")
	private float parkScore;		// 공원 평점
	
	@Column (name = "park_scorecnt")
	private String parkScoreCnt;	// 공원 후기건수
	
	@Column (name = "park_scorelink")
	private String parkScoreLink;	// 공원 후기링크
	
	@Column (name = "park_review")
	private int parkReview; 		// 공원 리뷰
	
	@Column (name = "park_reviewlink")
	private String parkReviewLink; 	// 공원 리뷰링크
	
	@Column (name = "park_link")
	private String parkLink;		// 공원 상세보기링크
	 
	@Column (name = "park_addr")
	private String parkAddr;		// 공원 주소
	  
	@Column (name = "park_lat")
	private float parkLat;			// 공원 위도
	  
	@Column (name = "park_lng")
	private float parkLng;			// 공원 경도
	
	  
	@Builder 
	public ParkEntity(Long parkNum, String parkName, float parkScore, String parkScoreCnt, String parkScoreLink, int parkReview, String parkReviewLink, String parkLink, String parkAddr, float parkLat, float parkLng) {
			this.parkNum = parkNum;
			this.parkName = parkName;
			this.parkScore = parkScore;
			this.parkScoreCnt = parkScoreCnt;
			this.parkScoreLink = parkScoreLink;
			this.parkReview = parkReview;
			this.parkReviewLink = parkReviewLink;
			this.parkLink = parkLink;
			this.parkAddr = parkAddr;
			this.parkLat = parkLat;
			this.parkLng = parkLng; 
	}



 }
