package com.mind.project.DTO;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class MindTalkDTO {
	private Integer talkNum;
    private String talkCon;
    private LocalDateTime talkDate;
    private Integer talkCnt;
    private String talkImg;
}
