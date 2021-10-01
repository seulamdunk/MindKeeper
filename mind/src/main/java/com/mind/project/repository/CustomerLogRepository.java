package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.CustomerLog;

public interface CustomerLogRepository extends JpaRepository<CustomerLog, Integer> {
    
	@Query(value="select count(distinct customer_num) "
			+ "from customer_log "
			+ "where login is not null and date(login)=date(now())",nativeQuery=true)
	Integer countTodayCustomer();
	
}
