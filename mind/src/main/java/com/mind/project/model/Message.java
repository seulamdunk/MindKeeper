package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int messageNum;
	
	
	private String messageCon;
	private LocalDateTime messageDate;
	@ManyToOne(optional = false)
	@JoinColumn(name="customer")
	@JsonBackReference
	private Customer customer;
	@ManyToOne(optional = false)
	@JoinColumn(name= "chatRoom" )
	@JsonBackReference
	private ChatRoom chatRoom;
	
	@Builder
	public Message(String messageCon, Customer customer, ChatRoom chatRoom) {
		
		this.messageCon = messageCon;
		this.messageDate = LocalDateTime.now();
		this.customer = customer;
		this.chatRoom = chatRoom;
	}

	
	
}
