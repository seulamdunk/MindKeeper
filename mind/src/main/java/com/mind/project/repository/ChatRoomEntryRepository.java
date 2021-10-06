package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.ChatRoomEntry;
import com.mind.project.model.Customer;
import com.mind.project.model.EntryInfo;

public interface ChatRoomEntryRepository extends JpaRepository<ChatRoomEntry, Integer> {
	//public List<ChatRoomEntry> findByCustomerOrderByChatRoomRoomLastDate(Customer customer);
	
	public List<EntryInfo> findByCustomerOrderByChatRoomRoomLastDate(Customer customer);
}
