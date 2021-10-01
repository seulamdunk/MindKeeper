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

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Builder;
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
	private int tkClass;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="TR_Order")
	private int TROrder;
	private int groupNum;
	private int talkReviewCnt;
	private LocalDateTime talkReviewDate;
	
	
	@ManyToOne
	@JoinColumn(name="customer_num")
	private Customer customer;
	
	@JsonBackReference
	@ManyToOne
    @JoinColumn(name="talk_Num")
    private MindTalk talk;

	@Builder
	public TalkReview(String talkReviewCon, int tkClass, int groupNum, Customer customer, MindTalk talk) {
		
		this.talkReviewCon = talkReviewCon;
		this.tkClass = tkClass;
		this.groupNum = groupNum;
		this.customer = customer;
		this.talk = talk;
		this.talkReviewDate= LocalDateTime.now();
	}
	
	
	
	
}
