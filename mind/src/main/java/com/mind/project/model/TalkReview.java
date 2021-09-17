package com.mind.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@Table(name="talkreview")
public class TalkReview {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int talkReviewNum;

	
	
	
}
