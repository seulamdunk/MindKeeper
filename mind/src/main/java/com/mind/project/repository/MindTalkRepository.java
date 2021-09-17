package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.MindTalk;

public interface MindTalkRepository extends JpaRepository<MindTalk, Integer> {

	@Query(value="select customerid,talk_con,talk_date,talk_cnt from mindtalk "
			+ "left join customer on mindtalk.customer_num=customer.customer_num ",nativeQuery=true)
	public List<Object[]> findMindtalk();
}
