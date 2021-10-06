package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.ChatRoom;

public interface ChatRoomRepository extends JpaRepository<ChatRoom, Integer> {

	//public List<ChatRoom> findAllOrderByRoomLastDate();
			
}
