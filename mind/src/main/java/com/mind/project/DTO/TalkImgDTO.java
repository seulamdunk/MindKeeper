package com.mind.project.DTO;

import com.mind.project.model.MindTalk;

import lombok.Data;
@Data
public class TalkImgDTO {
	 private int talkImgNum;
	 private MindTalk talk;
	 private String origFileName;  // 파일 원본명
	 private String filePath;  // 파일 저장 경로
	 private Long fileSize;
}
