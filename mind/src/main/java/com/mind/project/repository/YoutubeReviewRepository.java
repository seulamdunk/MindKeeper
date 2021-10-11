package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.YoutubeReview;

public interface YoutubeReviewRepository extends JpaRepository<YoutubeReview, Integer> {

	public List<YoutubeReview> findByYoutubeYoutubeNumOrderByYoutubeReviewDate(int youtubeNum);
}
