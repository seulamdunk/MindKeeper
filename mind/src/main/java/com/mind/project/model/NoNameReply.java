package com.mind.project.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class NoNameReply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="no_name_reply_num")
	private int noNameReplyNum;
	
	@Column(name="no_name_reply_con")
	private String noNameReplyCon;
	
	@ManyToOne
	@JoinColumn(name="no_name_num")
	private NoName noName;
	
	@ManyToOne
	@JoinColumn(name="customer_num")
	private Customer customer;
	
	@CreationTimestamp
	@Column(name="no_name_reply_date")
	private LocalDateTime noNameReplyDate;
	
	
}
