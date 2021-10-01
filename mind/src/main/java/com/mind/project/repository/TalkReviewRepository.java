package com.mind.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkReview;

public interface TalkReviewRepository extends JpaRepository<TalkReview, Integer> {
	//리스트
	List<TalkReview> findAllByOrderByTalkReviewDateDesc();
	  
	//삭제
	@Transactional
	void deleteByTalkReviewNum(int talkReviewNum);
	
	
	
	// talk 단일
	
	Page<TalkReview> findByTalk(MindTalk talk,Pageable pageable);
	
}
