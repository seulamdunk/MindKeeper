
package com.mind.project.service;
  
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.TalkImgDTO;
import com.mind.project.common.FileUtils;
import com.mind.project.model.Customer;
import com.mind.project.model.LikeTalk;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkImg;
import com.mind.project.model.TalkReview;
import com.mind.project.repository.LikeTalkRepsitory;
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
	  
	  
	  @Autowired
	  private LikeTalkRepsitory likeTalkRep;
	  
	  public Page<MindTalk> getTalksList(Pageable pageable){
		 Page<MindTalk> talkList =talkRep.findAllByOrderByTalkDateDesc(pageable);
		
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

	//댓글 출력
	@Override
	public List<TalkReview> getTalksReviewsList() {
		
		//return talkReviewRep.findAll(Sort.by("talkReviewNum").and(Sort.by("groupNum").and(Sort.by("TkClass"))));
		return talkReviewRep.findAll(Sort.by("groupNum").and(Sort.by("TkClass").and(Sort.by("talkReviewNum"))));
		
	}
  
	//댓글 입력
	public void insertTalkReview(Map<String, String> m) {
		
		Customer customer = new Customer();
		customer.setCustomerNum(Integer.parseInt(m.get("customerNum")));
		MindTalk talk = new MindTalk();
		talk.setTalkNum(Integer.parseInt(m.get("talkNum")));
		if(m.get("groupNum").equals("-1")) {
		TalkReview	talkReview =
					talkReviewRep.save(TalkReview.builder().customer(customer)
					.talk(talk)
					.tkClass(Integer.parseInt(m.get("tkClass")))
					.talkReviewCon(m.get("talkReviewCon"))					
					.build());
		int groupNum= talkReview.getTalkReviewNum();
		talkReview.setGroupNum(groupNum);
		talkReviewRep.save(talkReview);
		
		}else {
			talkReviewRep.save(TalkReview.builder().customer(customer)
					.groupNum(Integer.parseInt(m.get("groupNum")))
					.talk(talk)
					.tkClass(Integer.parseInt(m.get("tkClass")))
					.talkReviewCon(m.get("talkReviewCon"))
					
					.build());
		}
		
		
		
	}

	//댓글 삭제
	public void deleteTalkReview(int talkReviewNum) {
		// TODO Auto-generated method stub
		talkReviewRep.deleteByTalkReviewNum(talkReviewNum);
	}

	//게시글 삭제
	public void deleteTalk(int talkNum) {
		talkRep.deleteByTalkNum(talkNum);
		
	}

    //talk 별 리뷰 가져오기
	public Page<TalkReview> getTalkReviewById(MindTalk talk,Pageable pageable){
		return talkReviewRep.findByTalk( talk,pageable);
	}

	
	//talkNum으로 talk가져오기
	@Override
	public MindTalk findByTalkNum(int talkNum) {
		
		return talkRep.findByTalkNum(talkNum );
	}

	//좋아요
	@Override
	public void saveTalkLike(LikeTalk likeTalk) {
		// TODO Auto-generated method stub
		 likeTalkRep.save(likeTalk);
		return;
	}
	//좋아요 취소
	@Override
	public void deleteTalkLike(int talkNum, int customerNum) {
		likeTalkRep.deleteByTalkTalkNumAndCustomerCustomerNum(talkNum, customerNum);
		
	}
	//좋아요 확인
	@Override
	public int countTalkLike(int talkNum, int customerNum) {
	
		return likeTalkRep.countByTalkTalkNumAndCustomerCustomerNum(talkNum, customerNum);
	}

	//좋아요 합계 확인
	@Override
	public int countSumTalkLike(int sunCnt) {
		// TODO Auto-generated method stub
		return likeTalkRep.countByTalkTalkNum(sunCnt);
	}
	


  
  
  
  }
 