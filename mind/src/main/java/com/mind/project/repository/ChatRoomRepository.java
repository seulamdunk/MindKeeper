package com.mind.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.ChatRoom;

public interface ChatRoomRepository extends JpaRepository<ChatRoom, Integer> {

	//public List<ChatRoom> findAllOrderByRoomLastDate();
		
	@Transactional
	public void deleteByRoomNumber(int roomNumber);
}
