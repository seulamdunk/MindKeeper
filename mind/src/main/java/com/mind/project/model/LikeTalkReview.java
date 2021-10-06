package com.mind.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class LikeTalkReview {

	
	 
	
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int likeTalkReviewNum;
	
	
	@ManyToOne(optional = false)
	@JoinColumn
	private TalkReview talkReview;
	
	
	@ManyToOne(optional = false)
	@JoinColumn
	private Customer customer;

	@Builder
	public LikeTalkReview(TalkReview talkReview, Customer customer) {
	
		this.talkReview = talkReview;
		this.customer = customer;
	}


	
}
