package com.mind.project.service;

import java.util.List;

import com.mind.project.model.MindTalk;

public interface MindTalkService {

	public List<MindTalk> getTalksList();
	public MindTalk insertTalk(MindTalk talk);
}
