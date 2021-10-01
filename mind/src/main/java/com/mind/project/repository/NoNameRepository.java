package com.mind.project.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.NoName;

public interface NoNameRepository extends JpaRepository<NoName, Long> {

	List<NoName> findByNoNameTitleContainingIgnoreCase(String keyword);
	
//	@Modifying
//	@Query("update NoName set noNameCount = noNameCount + 1 where noNameNum = :noNameNum")
//	int updateCount(Long noNameNum);

	
	
}