package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class YoutubeReview {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int youtubeReviewNum;

	private String youtubeReviewCon;
	


	private LocalDateTime youtubeReviewDate=LocalDateTime.now();
	
	
	@ManyToOne(optional = false)
	@JoinColumn(name="customer_num")
	private Customer customer;
	
	@JsonBackReference
	@ManyToOne(optional = false)
    @JoinColumn(name="youtube_Num")
    private Youtube youtube;

	@Builder
	public YoutubeReview(int youtubeReviewNum,String youtubeReviewCon, Customer customer, Youtube youtube) {
		this.youtubeReviewNum=youtubeReviewNum;
		this.youtubeReviewCon = youtubeReviewCon;
		this.customer = customer;
		this.youtube = youtube;
	}
	
	
	
}
