package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class CustomerLog {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer logNum;
    private LocalDateTime login;
    private LocalDateTime logout;
	
	@ManyToOne
    @JoinColumn(name = "CUSTOMER_NUM")
    private Customer customer;    
}