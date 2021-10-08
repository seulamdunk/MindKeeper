package com.mind.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.model.ChatRoom;
import com.mind.project.model.Customer;
import com.mind.project.model.EntryInfo;
import com.mind.project.model.LikeTalk;
import com.mind.project.model.Message;
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

	//좋아요 합계
	public int countSumTalkLike(int sunCnt);
	
	//댓글좋아요 입력
	public void insertLikeTalkReview(int customerNum,int talkReviewNum);
	
	//댓글 좋아요 삭제
	public void deleteLikeTalkReview(int customerNum,int talkReviewNum);
	
	//좋아요 체크
	public int checkLikeTalkReview(int customerNum,int talkReviewNum);
	
	//좋아요 합계
	public int checkLikeTalkReview(int talkReviewNum);
	
	//채팅방 생성
	public ChatRoom createChatRoom(ChatRoom chatRoom);
	//채팅방 가져오기
	public  List<EntryInfo> getAllChatRoom(Customer customer);
	
	//채팅방참가목록 생성
	public void insertRoomEntry(ChatRoom chatRoom,Customer customer);
	
	
	//방번호로채팅방 번호 가져오기
	public ChatRoom getChatRoom(int chatRoomNum);
	
	//채팅 저장
	public void saveMessage(Message msg);
	
	//이전 채팅 목록
	public Page<Message> getMsgList(int lastNum,int size,int roomNumber);
	//이전 채팅 목록 초기 이동시
	public List<Message> getMsgListFirst(int lastNum,int size,int roomNumber);
	
	//고객 게시물 검색
	public Page<MindTalk> searchUser(int customerNum, Pageable pageable);
		
	public void deleteRoom(int roomNumber);
	
	
}
