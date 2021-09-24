package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
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
@Data
@NoArgsConstructor
@Table(name="talkreview")
public class TalkReview {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int talkReviewNum;

	private String talkReviewCon;
	
	@Column(name="TK_Class")
	private int TkClass;
	@Column(name="TR_Order")
	private int TROrder;
	private int groupNum;
	private int talkReviewCnt;
	private LocalDateTime talkReviewDate;
	
	
	@ManyToOne
	@JoinColumn(name="customer_num")
	private Customer customer;
	
	
	
	
	
}
