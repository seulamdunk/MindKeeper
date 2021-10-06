package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.ParkEntity;

public interface ParkRepository extends JpaRepository<ParkEntity, Long>{

	
}
