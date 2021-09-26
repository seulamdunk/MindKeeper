package com.mind.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Park {
	
	private int parkNum;		// 공원번호
	private String parkName;	// 공원이름
	private float parkScore;	// 공원평점
	private int parkReview;		// 공원리뷰
	private String parkLink;	// 공원링크
	private String parkAddr;	// 공원주소
	private float parkLat;		// 공원위도
	private float parkLng;		// 공원경도
}
