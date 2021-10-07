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
public class Secret extends TimeEntity {

    @Id
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long secretNum;
    
    @Column (name = "customer_num")
    private Long customerNum;
    
    @Column(name = "secret_title")
    private String secretTitle;
    
    @Column(name = "secret_con")
    private String secretCon;
    
    @Column(name="secret_img")
    private String secretImg;
    
    @Column(name="secret_date")
    private LocalDateTime secretDate;
    
    @Column(name="jindan_Con")
    private String jindanCon;
    
    @Column(name="jindan_conNum")
    private Long jindanConNum;
    
    @Builder
	public Secret(Long customerNum, String secretTitle, String secretCon, String secretImg, String jindanCon, Long jindanConNum) {
		this.customerNum = customerNum;
		this.secretTitle = secretTitle;
		this.secretCon = secretCon;
		this.secretImg = secretImg;
		this.jindanCon = jindanCon;
		this.jindanConNum = jindanConNum;
	}
    
    @PrePersist
    public void secretDate() {
    	LocalDateTime now = LocalDateTime.now();
    	this.secretDate = LocalDateTime.of(now.getYear(),now.getMonth(), now.getDayOfMonth(), 0,0,0);
    }
    
    
   
    
    
}
