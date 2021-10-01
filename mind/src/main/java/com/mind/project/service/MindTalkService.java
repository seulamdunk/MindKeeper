package com.mind.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.model.LikeTalk;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkReview;

public interface MindTalkService {

	//게시글 목록
	public Page<MindTalk> getTalksList(Pageable pageable);
	
	//게시글 입력
	public void insertTalk(MindTalk talk,MultipartHttpServletRequest MHSR)throws Exception;
	//댓글 목로 가져오기
	public List<TalkReview> getTalksReviewsList();
	//댓글 작성
	public void insertTalkReview(Map<String, String> m); 
	//게시글 삭제
	public void mindTalkDelete(int num);
	
	//댓글 목록  talkNum으로 가져오기
	public Page<TalkReview> getTalkReviewById(MindTalk talk,Pageable pageable);
	//게시글 삭제 -사용자
	public void deleteTalkReview(int talkNum); 
	//댓글 삭제 -사용자
	public void deleteTalk(int talkReviewNum);
	//talkNum으로 talk 가져오기
	public  MindTalk findByTalkNum(int talkNum);
	
	//좋아요
	public void saveTalkLike(LikeTalk likeTalk);
	//좋아요 해제
	public void deleteTalkLike(int talkNum, int customerNum) ;
	
	//좋아요 확인
	public int countTalkLike(int talkNum, int customerNum);

	
	public int countSumTalkLike(int sunCnt);
}
