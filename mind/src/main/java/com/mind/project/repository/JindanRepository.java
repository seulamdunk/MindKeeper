package com.mind.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.Jindan;

public interface JindanRepository extends JpaRepository<Jindan, Long> {

	Optional<Jindan> findBySecretNum(Long secretNum);
	
	
}
