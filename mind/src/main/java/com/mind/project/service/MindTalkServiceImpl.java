
package com.mind.project.service;
  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.TalkImgDTO;
import com.mind.project.common.FileUtils;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkImg;
import com.mind.project.model.TalkReview;
import com.mind.project.repository.MindTalkImgRepository;
import com.mind.project.repository.MindTalkRepository;
import com.mind.project.repository.TalkReviewRepository;
  
  @Service("MindTalkService") 
  public class MindTalkServiceImpl implements MindTalkService {
	  @Autowired
	  MindTalkRepository talkRep;
	  
	  @Autowired
	  private FileUtils fileUtils;
	  
	  
	  @Autowired
	  private MindTalkImgRepository talkImgRep;
	  
	  
	  @Autowired
	  private TalkReviewRepository talkReviewRep;
	  
	  public List<MindTalk> getTalksList(){
		  List<MindTalk> talkList =talkRep.findAllByOrderByTalkDateDesc();
		  return talkList; 
		  
	  }

	  public void insertTalk(MindTalk talk,MultipartHttpServletRequest MHSR)throws Exception{
		  MindTalk a=talkRep.save(talk);
		  System.out.println("insert 반환" + a.getTalkNum());
		  List<TalkImgDTO> list = fileUtils.parseFileInfo(talk.getTalkNum(), MHSR);
		  if(org.springframework.util.CollectionUtils.isEmpty(list)==false) {
			  for(TalkImgDTO talkImgDTO : list) {
			
				 
				  
				  
				 
				  TalkImg talkImg = TalkImg.builder().filePath(talkImgDTO.getFilePath())
						  .origFileName(talkImgDTO.getOrigFileName())
							 .fileSize(talkImgDTO.getFileSize())
							 .build(); 
						  
				  talkImg.setMindTalk(a);	  
				  System.out.println("파일명"+ talkImg.getOrigFileName());
				  System.out.println("경로" + talkImg.getFilePath());
				  System.out.println("크기" + talkImg.getFileSize());
				  System.out.println("talkNum" + talkImg.getTalk().getTalkNum());
				  talkImgRep.save(talkImg);
			  }
		  }
		  
		  
		  
		  /*
		  if(ObjectUtils.isEmpty(MHSR)==false) {
			  Iterator<String> iterator= MHSR.getFileNames();
			  String name;
			  while(iterator.hasNext()) {
				  name=iterator.next();
				  List<MultipartFile> list = MHSR.getFiles(name);
				  for(MultipartFile multipartFile: list) {
					  System.out.println(multipartFile);
				  }
			  }
		  }
		  */
		  
	  }

	  //게시글삭제
	@Override
	public void mindTalkDelete(int num) {
		
	}

	
	@Override
	public List<TalkReview> getTalksReviewsList() {
		return talkReviewRep.findAllByOrderByTalkReviewDateDesc();
		
	}
  
	
  




  
  
  
  }
 