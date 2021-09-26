package com.mind.project.model.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Jindan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long jindanNum;
    
    @Column (name="secret_Num")
    private Long secretNum;
    
    @Column(name="jindan_Date")
    private LocalDateTime jindanDate;
    
    @Column(name="jindan_Con")
    private String jindanCon;
    
    @Column(name="jindan_connum")
    private Long jindanConNum;
    
    
    @Builder
	public Jindan(Long jindanNum, Long secretNum, String jindanCon, Long jindanConNum) {
		this.jindanNum = jindanNum;
		this.secretNum = secretNum;
		this.jindanCon = jindanCon;
		this.jindanConNum = jindanConNum;
	}
    
    @PrePersist
    public void jindanDate() {
    	this.jindanDate = LocalDateTime.now();
    }
    
    
 
    
}
