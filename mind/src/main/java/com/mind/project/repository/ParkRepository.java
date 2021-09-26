package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mind.project.model.entity.ParkEntity;

@Repository
public interface ParkRepository extends JpaRepository<ParkEntity, Integer>{

}
