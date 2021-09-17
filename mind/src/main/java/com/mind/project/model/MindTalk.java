package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@Entity
@AllArgsConstructor
@Builder
@NoArgsConstructor
@Table(name="mindtalk")
public class MindTalk {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer talkNum;
    private String talkCon;
    private LocalDateTime talkDate;
    private Integer talkCnt;
    private String talkImg;
    
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_NUM")
    private Customer customer;
    


    

    

    	
    	/*
    	 * @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    	 * 
    	 * @JoinColumn(name="talk_num") private List<TalkReview> talkReviewList;
    	 */

	
    
    
    
}