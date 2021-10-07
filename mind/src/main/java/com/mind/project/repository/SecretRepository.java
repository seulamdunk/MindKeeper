package com.mind.project.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.SecretModel;
import com.mind.project.model.entity.Secret;

public interface SecretRepository extends JpaRepository<Secret, Long> {
	
	List<Secret> findByCustomerNum(Long customerNum, Pageable pageable);
	
	Optional<Secret> findBySecretDate(LocalDateTime secretDate);

	SecretModel save(SecretModel secretModel);
	

	
	
}
