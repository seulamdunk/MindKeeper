package com.mind.project.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

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
    private Integer talkCnt=0;
  
    
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_NUM")
    private Customer customer;
    

    @OneToMany(
     	   mappedBy = "talk",
     	   cascade = {CascadeType.PERSIST, CascadeType.REMOVE},
     	   orphanRemoval = true
     )
     private List<TalkImg> talkImg= new ArrayList<>();
    
    
    @JsonManagedReference
    @OneToMany(
      	   mappedBy = "talk",
      	   cascade = {CascadeType.PERSIST, CascadeType.REMOVE},
      	   orphanRemoval = true
      )
      private List<TalkReview> talkReview= new ArrayList<>();
 
    
    

    
    public void addPhoto(TalkImg talkImg) {
        this.talkImg.add(talkImg);

	// 게시글에 파일이 저장되어있지 않은 경우
        if(talkImg.getTalk() != this)
            // 파일 저장
            talkImg.setMindTalk(this);
    }






    @Builder
	public MindTalk(String talkCon, Customer customer) {
		
		this.talkCon = talkCon;
		this.customer = customer;
	}

    
    
    
}