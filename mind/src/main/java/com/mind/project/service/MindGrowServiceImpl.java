package com.mind.project.service;

import java.util.ArrayList;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.Youtube;
import com.mind.project.model.YoutubeLog;
import com.mind.project.repository.YoutubeLogRepository;
import com.mind.project.repository.YoutubeRepository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("MindGrowService")
public class MindGrowServiceImpl implements MindGrowService {
	@Autowired
	YoutubeRepository youtubeRepository;
	
	@Autowired
	YoutubeLogRepository youtubeLogRep;

	@Override
	public List<List<Youtube>> getListYoutube() throws Exception {

		List<Youtube> youtubeList = youtubeRepository.findAllByOrderByYoutubeTagDesc();

	
		
		
		ArrayList<String> tagList =new ArrayList<>();
		List<List<Youtube>> resultList = new ArrayList<>();
		
		//태그(검색어)에 따라 정렬
	   for(Youtube youtube: youtubeList) {
		   if (!(tagList.contains(youtube.getYoutubeTag()))) {
			   tagList.add(youtube.getYoutubeTag());
		   }		   
	   }
	   for(String tag:tagList) {
		   List<Youtube> list=new ArrayList<>();
		   for(Youtube youtube: youtubeList) {
			   if(youtube.getYoutubeTag().equals(tag)) {
				   list.add(youtube);
			   }else {
				   continue;
			   }
		   }
		   //섞기
		   Collections.shuffle(list);
		   //20개 꺼내기
		   list=list.subList(0, 20);
		   resultList.add(list);
	   }
	   

		return resultList;
	}
	
	public void savaYoutuveLog(Youtube youtube, Customer customer) {
		
		youtubeLogRep.save(YoutubeLog.builder()
				.youtube(youtube)
				.customer(customer)
				.build()
				);
				
	}

	@Override
	public Youtube getYoutube(int youtubeNum) throws Exception {
		Youtube youtube =youtubeRepository.findByYoutubeNum(youtubeNum);
		return  youtube;
	}

}
