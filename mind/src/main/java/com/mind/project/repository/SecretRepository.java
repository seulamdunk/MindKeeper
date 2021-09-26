package com.mind.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.entity.Jindan;
import com.mind.project.model.entity.Secret;

public interface SecretRepository extends JpaRepository<Secret, Long> {
	
	
}
