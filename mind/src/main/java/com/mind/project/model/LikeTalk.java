package com.mind.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class LikeTalk {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int likeTalkNum;
	
	
	@ManyToOne(optional = false)
	@JoinColumn
	private MindTalk talk;
	
	
	@ManyToOne(optional = false)
	@JoinColumn
	private Customer customer;

	@Builder
	public LikeTalk(MindTalk talk, Customer customer) {
		
		this.talk = talk;
		this.customer = customer;
	}
	
	
	
	
}
