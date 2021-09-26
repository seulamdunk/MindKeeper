package com.mind.project.model.entity;
  
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
  
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="park")
public class ParkEntity {  

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int parkNum;
	 
	@Column (name = "park_Name")
	private String parkName;
	 
	@Column (name = "park_Score")
	private float parkScore;
	
	@Column (name = "park_Review")
	private int parkReview; 
	
	@Column (name = "park_Link")
	private String parkLink;
	 
	@Column (name = "park_Addr")
	private String parkAddr;
	  
	@Column (name = "park_Lat")
	private float parkLat;
	  
	@Column (name = "park_Lng")
	private float parkLng;
	  
	@Builder public ParkEntity(String parkName, float parkScore, int parkReview, String parkLink, String parkAddr, float parkLat, float parkLng) {
			this.parkName = parkName;
			this.parkScore = parkScore;
			this.parkReview = parkReview;
			this.parkLink = parkLink;
			this.parkAddr = parkAddr;
			this.parkLat = parkLat;
			this.parkLng = parkLng; 
	}



 }
