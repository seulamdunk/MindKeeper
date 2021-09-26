package com.mind.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.TalkReview;

public interface TalkReviewRepository extends JpaRepository<TalkReview, Integer> {

	List<TalkReview> findAllByOrderByTalkReviewDateDesc();
}
