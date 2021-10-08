package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.Customer;
import com.mind.project.model.YoutubeLog;

public interface YoutubeLogRepository extends JpaRepository<YoutubeLog, Integer> {
	
	
	YoutubeLog findTop1ByCustomerOrderByYoutubeLogDateDesc(Customer customer);
	
}
