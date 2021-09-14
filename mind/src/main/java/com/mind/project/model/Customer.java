package com.mind.project.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer customerNum;
    private String customerID;
    private String customerPW;
    private String customerName;
    private String identityNum;
    private String phoneNum;
    private Integer idClass;
    private String profileImg;
    private String profileCon;
    private String CustomerNick;
    @Column(name="create_Date")
    private LocalDateTime createDate;
    private LocalDateTime deleteDate;
    
    public Customer() {
    	idClass=0;
    	createDate= LocalDateTime.now();
    	
    }
	
    
    
    
}