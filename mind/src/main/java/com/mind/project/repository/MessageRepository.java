package com.mind.project.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {

	
	//public Page<chatRoomCusNum> findAllByMessageNumLessThanAndChatRoomRoomNumberEqualsOrderByMessageNumDesc(int lastNum,int roomNumber,Pageable pageable);
	
	//public Page<chatRoomCusNum> findByChatRoomRoomNumberAndMessageNumLessThan(int roomNumber,int MessageNum,Pageable pageable);							
	//public Page<chatRoomCusNum> findDistinctByChatRoomAndMessageNumLessThan(ChatRoom chatRoom,int lastNum,Pageable pageable);	
	//public Page<chatRoomCusNum> getPageMessage(int roomNumber,int MessageNum,Pageable pageable);
	public Page<Message> findDistinctByChatRoomRoomNumberAndMessageNumLessThan(int chatRoom,int lastNum,Pageable pageable);
	
	public List<Message> findTop10ByChatRoomRoomNumberAndMessageNumLessThanOrderByMessageDateDesc(int chatRoom,int lastNum);
}
