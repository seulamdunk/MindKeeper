package com.mind.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor()
@Table(name="talk_img")
@Entity
public class TalkImg {

	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name="talk_img_num")
	    private int talkImgNum;

	    @ManyToOne
	    @JoinColumn(name="talk_Num")
	    private MindTalk talk;

	    @Column(nullable = false)
	    private String origFileName;  // 파일 원본명

	    @Column(nullable = false)
	    private String filePath;  // 파일 저장 경로

	    private Long fileSize;
	    
	    @Builder 
	    public TalkImg(String origFileName, String filePath, Long fileSize){
	        this.origFileName = origFileName;
	        this.filePath = filePath;
	        this.fileSize = fileSize;
	        
	    }

	    // Board 정보 저장
	    public void setMindTalk(MindTalk talk){
	        this.talk= talk;

		// 게시글에 현재 파일이 존재하지 않는다면
	        if(!talk.getTalkImg().contains(this))
	            // 파일 추가
	            talk.getTalkImg().add(this);
	    }
	}