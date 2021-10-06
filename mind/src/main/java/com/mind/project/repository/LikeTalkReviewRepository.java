package com.mind.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.LikeTalkReview;

public interface LikeTalkReviewRepository extends JpaRepository<LikeTalkReview, Integer> {

	
	
	
	public int countByCustomerCustomerNumAndTalkReviewTalkReviewNum(int customerNum, int talkReviewNum);
	
	
	int countByTalkReviewTalkReviewNum(int talkReviewNum);
	
	
	//좋아요해제
	@Transactional
	void deleteByCustomerCustomerNumAndTalkReviewTalkReviewNum(int customerNum, int talkReviewNum);
}
