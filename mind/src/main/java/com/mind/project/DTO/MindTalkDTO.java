package com.mind.project.DTO;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class MindTalkDTO {
	
    private String talkCon;

    private String tag;
    private List<MultipartFile> talkImg;
}
