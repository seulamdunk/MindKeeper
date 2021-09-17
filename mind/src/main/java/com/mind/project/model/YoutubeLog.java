package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
	
	  
	 @ManyToOne
	 @JoinColumn(name="youtube_num") 
	 private Youtube youtube;
	
}
