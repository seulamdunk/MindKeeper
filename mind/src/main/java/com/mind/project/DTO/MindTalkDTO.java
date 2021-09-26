package com.mind.project.DTO;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class MindTalkDTO {
	
    private String talkCon;


    private List<MultipartFile> talkImg;
}
