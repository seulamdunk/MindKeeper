package com.mind.project.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoom {
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	 @Column(name="roomName_NUM")
	 private int roomNumber;
	 
	 
	private String roomName;
	private LocalDateTime roomDate;
	private LocalDateTime roomLastDate;
	
	@JsonManagedReference
	@OneToMany(mappedBy ="chatRoom",fetch = FetchType.LAZY,cascade = CascadeType.ALL  )
	private List<ChatRoomEntry> chatRoomEntry = new ArrayList();
	
	@JsonManagedReference
    @OneToMany(mappedBy ="chatRoom",fetch = FetchType.LAZY,cascade = CascadeType.ALL )
    private List<Message> message = new ArrayList();
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}
	
	
	public void setRoomLastDate() {
		this.roomLastDate = LocalDateTime.now();
	}


	@Builder
	public ChatRoom(int roomNum,String roomName) {
		this.roomNumber =roomNum;
		this.roomName = roomName;
		this.roomDate = LocalDateTime.now();
		this.roomLastDate = LocalDateTime.now();

		
	}
	
	
}
