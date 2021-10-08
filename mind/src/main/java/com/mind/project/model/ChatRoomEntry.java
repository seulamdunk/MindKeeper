package com.mind.project.model;

import javax.persistence.CascadeType;
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
public class ChatRoomEntry {

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int chatRoomEnrtyNum;
	
	@ManyToOne(optional = false )
	@JoinColumn(name="customer")
	@JsonBackReference
	private Customer customer;
	
	@ManyToOne(optional = false )
	@JoinColumn(name= "chatRoom")
	@JsonBackReference
	private ChatRoom chatRoom;

	/*,cascade = CascadeType.ALL
		*/
	@Builder
	public ChatRoomEntry(Customer customer, ChatRoom chatRoom) {
		this.customer = customer;
		this.chatRoom = chatRoom;
	}
	
}
