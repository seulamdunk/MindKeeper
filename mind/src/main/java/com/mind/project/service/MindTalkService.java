package com.mind.project.service;

import java.util.List;

import com.mind.project.model.MindTalk;

public interface MindTalkService {

	//게시글 목록
	public List<MindTalk> getTalksList();
	
	public MindTalk insertTalk(MindTalk talk);
	
	//게시글 삭제
	public void mindTalkDelete(int num);
}
