package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "youtubelog")
@NoArgsConstructor
@Data
public class YoutubeLog {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int youtubeLogNum;
	private LocalDateTime youtubeLogDate = LocalDateTime.now();
	
	  
	 @ManyToOne(optional = false)
	 @JoinColumn(name="youtube_num") 
	 private Youtube youtube;
	
	 
	 @ManyToOne(optional = false)
	 @JoinColumn(name="customer_num") 
	 private Customer customer;

	 @Builder
	public YoutubeLog( Youtube youtube, Customer customer) {
		this.youtubeLogDate = LocalDateTime.now();
		this.youtube = youtube;
		this.customer = customer;
	}
	
	 
	 
}
