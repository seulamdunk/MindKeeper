package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.Secret;

public interface SecretRepository extends JpaRepository<Secret, Long> {
	
}
