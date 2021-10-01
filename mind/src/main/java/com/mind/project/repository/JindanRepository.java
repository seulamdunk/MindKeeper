package com.mind.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.Jindan;
import com.mind.project.model.entity.Jindan.JindanBuilder;

public interface JindanRepository extends JpaRepository<Jindan, Long> {

	List<Jindan> findBySecretNumAndJindanNum(Long secretNum, Long jindanNum);
	
	Optional<Jindan> findByJindanDate(String jindanDate);

	

	
	
}
