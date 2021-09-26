package com.mind.project.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkReview;

public interface MindTalkService {

	//게시글 목록
	public List<MindTalk> getTalksList();
	
	public void insertTalk(MindTalk talk,MultipartHttpServletRequest MHSR)throws Exception;
	public List<TalkReview> getTalksReviewsList();
	//게시글 삭제
	public void mindTalkDelete(int num);
}
