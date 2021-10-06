package com.mind.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.entity.Jindan;
import com.mind.project.model.entity.Jindan.JindanBuilder;

public interface JindanRepository extends JpaRepository<Jindan, Long> {

	List<Jindan> findBySecretNumAndJindanNum(Long secretNum, Long jindanNum);
	
	Optional<Jindan> findByJindanDate(String jindanDate);

	@Query(value="select count(case when jindan_con=:pos then 1 end)/count(*) from secret",nativeQuery=true)
	double customerPositive(String pos);
	

	
	
}
