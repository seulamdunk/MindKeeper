package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.Youtube;

public interface YoutubeRepository extends JpaRepository<Youtube, Integer> {
	
	List<Youtube> findAllByOrderByYoutubeTagDesc();

	Youtube findByYoutubeNum(int youtubeNum);
	
	
	public List<Youtube> findByYoutubeNumIn(List<Integer> recommendList);

}
