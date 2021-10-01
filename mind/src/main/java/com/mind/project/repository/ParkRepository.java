package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.ParkEntity;

public interface ParkRepository extends JpaRepository<ParkEntity, Long>{

	//검색을 직접 호출하는 메서드
	List<ParkEntity> findAllByParkNameContaining(String keyword);
	
}
