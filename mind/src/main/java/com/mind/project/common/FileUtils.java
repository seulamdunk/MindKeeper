package com.mind.project.common;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.TalkImgDTO;

@Component
public class FileUtils {

	public final static String rootPath = Paths.get("C:", "MindKeeper", "mind","src", "main", "resources","static","img").toString();

	public List<TalkImgDTO> parseFileInfo(int talkImgNum,MultipartHttpServletRequest 
			multipartHttpServletRequest )throws Exception{
		//이미지 없으면 Null 값 반환
		String dataPath="/img/talkImg";
		if(ObjectUtils.isEmpty(multipartHttpServletRequest)) {
			return null;
		}
		List<TalkImgDTO> fileList = new ArrayList<>();
		
		String savePath = Paths.get(rootPath, "talkImg").toString();
		System.out.println("root경로 = "+rootPath);
		//String savePath = "C:/MindKeeper/mind/src/main/resources/static/img/talkImg";
		File file =new File(savePath);
		if(file.exists()==false) {
			file.mkdir();
		}
		
		Iterator<String> iterator= multipartHttpServletRequest.getFileNames();
		String newFileName, originalFileExtension, contentType;
		while(iterator.hasNext()) {
			List<MultipartFile>  list = multipartHttpServletRequest.getFiles(iterator.next());
			for(MultipartFile multipartFile : list) {
				contentType= multipartFile.getContentType();
				if(ObjectUtils.isEmpty(contentType)) {
					break;
				}
				else {
					if(contentType.contains("image/jpeg")) {
						originalFileExtension =".jpg";
					}
					else if(contentType.contains("image/png")) {
						originalFileExtension =".png";
					}
					else if(contentType.contains("image/gif")) {
						originalFileExtension =".gif";
					}
					else {
						break;
					}
				}
				newFileName =Long.toString(System.nanoTime()) +  originalFileExtension;
				TalkImgDTO talkImg = new TalkImgDTO();
				talkImg.setTalkImgNum(talkImgNum);
				talkImg.setFileSize(multipartFile.getSize());
				talkImg.setOrigFileName(multipartFile.getOriginalFilename());
				talkImg.setFilePath(dataPath +"\\"+ newFileName);
				fileList.add(talkImg);
				
				file=new File(savePath + "\\" + newFileName);
				multipartFile.transferTo(file);
			}
		}
		return fileList;
	}
			
}
