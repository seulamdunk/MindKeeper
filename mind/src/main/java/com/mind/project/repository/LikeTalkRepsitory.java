package com.mind.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.LikeTalk;

public interface LikeTalkRepsitory extends JpaRepository<LikeTalk, Integer> {

	public int countByTalkTalkNumAndCustomerCustomerNum(int talkNum, int customerNum);
	
	public int countByTalkTalkNum(int talkNum);
	
	@Transactional
	public void deleteByTalkTalkNumAndCustomerCustomerNum(int talkNum, int customerNum);
	
	
	
}
