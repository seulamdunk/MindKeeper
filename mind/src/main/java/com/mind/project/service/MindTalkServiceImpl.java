
package com.mind.project.service;
  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mind.project.model.MindTalk;
import com.mind.project.repository.MindTalkRepository;
  
  @Service("MindTalkService") 
  public class MindTalkServiceImpl implements MindTalkService {
	  @Autowired
	  MindTalkRepository talkRep;
	  
	  
	  
	  public List<MindTalk> getTalksList(){
		  List<MindTalk> talkList =talkRep.findAllByOrderByTalkDateDesc();
		  return talkList; 
		  
	  }

	  public MindTalk insertTalk(MindTalk talk) {
		  return talkRep.save(talk);
	  }
  

  




  
  
  
  }
 