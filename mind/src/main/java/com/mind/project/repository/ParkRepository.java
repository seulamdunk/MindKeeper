package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mind.project.model.Park;

@Repository
public interface ParkRepository extends JpaRepository<Park, Integer>{

}
