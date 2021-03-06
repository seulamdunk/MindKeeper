
package com.mind.project.service;
  
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.TalkImgDTO;
import com.mind.project.common.FileUtils;
import com.mind.project.model.ChatRoom;
import com.mind.project.model.ChatRoomEntry;
import com.mind.project.model.Customer;
import com.mind.project.model.EntryInfo;
import com.mind.project.model.LikeTalk;
import com.mind.project.model.LikeTalkReview;
import com.mind.project.model.Message;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkImg;
import com.mind.project.model.TalkReview;
import com.mind.project.repository.ChatRoomEntryRepository;
import com.mind.project.repository.ChatRoomRepository;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.repository.LikeTalkRepsitory;
import com.mind.project.repository.LikeTalkReviewRepository;
import com.mind.project.repository.MessageRepository;
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
	  
	  @Autowired
	  private CustomerRepository customerRep;
	  
	  @Autowired
	  private LikeTalkReviewRepository likeTalkReviewRep;
	  
	  @Autowired
	  private ChatRoomRepository chatRoomRep;
	  
	  @Autowired
	  private ChatRoomEntryRepository chatRoomEntryRep;
	  
	  @Autowired
	  private MessageRepository msgRep;
	  
	  
	  public Page<MindTalk> getTalksList(Pageable pageable){
		 Page<MindTalk> talkList =talkRep.findAllByOrderByTalkDateDesc(pageable);
	
		  return talkList; 
		  
	  }
	  public Page<MindTalk> getTalksListA(int lastNum){
			
			 Pageable pageable = PageRequest.of(0,5, Sort.by("talkNum").descending());
			 Page<MindTalk> talkList =talkRep.findByTalkNumLessThanOrderByTalkDateDesc(pageable,lastNum);
			  return talkList; 
			  
		  }
	  public void insertTalk(MindTalk talk,MultipartHttpServletRequest MHSR)throws Exception{
		  MindTalk a=talkRep.save(talk);
		  System.out.println("insert ??????" + a.getTalkNum());
		  List<TalkImgDTO> list = fileUtils.parseFileInfo(talk.getTalkNum(), MHSR);
		  if(org.springframework.util.CollectionUtils.isEmpty(list)==false) {
			  for(TalkImgDTO talkImgDTO : list) {
			
				 
				  
				  
				 
				  TalkImg talkImg = TalkImg.builder().filePath(talkImgDTO.getFilePath())
						  .origFileName(talkImgDTO.getOrigFileName())
							 .fileSize(talkImgDTO.getFileSize())
							 .build(); 
						  
				  talkImg.setMindTalk(a);	  
				  System.out.println("?????????"+ talkImg.getOrigFileName());
				  System.out.println("??????" + talkImg.getFilePath());
				  System.out.println("??????" + talkImg.getFileSize());
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

	  //???????????????
	@Override
	public void mindTalkDelete(int num) {
		talkRep.deleteById(num);
	}

	//?????? ??????
	@Override
	public List<TalkReview> getTalksReviewsList() {
		
		//return talkReviewRep.findAll(Sort.by("talkReviewNum").and(Sort.by("groupNum").and(Sort.by("TkClass"))));
		return talkReviewRep.findAll(Sort.by("groupNum").and(Sort.by("TkClass").and(Sort.by("talkReviewNum"))));
		
	}
  
	//?????? ??????
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

	//?????? ??????
	public void deleteTalkReview(int talkReviewNum) {

		talkReviewRep.deleteByTalkReviewNum(talkReviewNum);
	}

	//????????? ??????
	public void deleteTalk(int talkNum) {
		talkRep.deleteByTalkNum(talkNum);
		
	}

    //talk ??? ?????? ????????????
	public Page<TalkReview> getTalkReviewById(MindTalk talk,Pageable pageable){
		return talkReviewRep.findByTalk( talk,pageable);
	}

	
	//talkNum?????? talk????????????
	@Override
	public MindTalk findByTalkNum(int talkNum) {
		
		return talkRep.findByTalkNum(talkNum );
	}

	//?????????
	@Override
	public void saveTalkLike(LikeTalk likeTalk) {
	
		 likeTalkRep.save(likeTalk);
		return;
	}
	//????????? ??????
	@Override
	public void deleteTalkLike(int talkNum, int customerNum) {
		likeTalkRep.deleteByTalkTalkNumAndCustomerCustomerNum(talkNum, customerNum);
		
	}
	//????????? ??????
	@Override
	public int countTalkLike(int talkNum, int customerNum) {
	
		return likeTalkRep.countByTalkTalkNumAndCustomerCustomerNum(talkNum, customerNum);
	}

	//????????? ?????? ??????
	@Override
	public int countSumTalkLike(int sunCnt) {
		
		return likeTalkRep.countByTalkTalkNum(sunCnt);
	}

	
	//?????? ????????? ??????
	@Override
	public void insertLikeTalkReview(int customerNum, int talkReviewNum) {
		
		
		likeTalkReviewRep.save(LikeTalkReview.builder().
				customer(customerRep.getById(customerNum)).
				talkReview(talkReviewRep.getById(talkReviewNum)).build());
	}
	//?????? ????????? ??????
	@Override
	public void deleteLikeTalkReview(int customerNum,int talkReviewNum) {
		likeTalkReviewRep.deleteByCustomerCustomerNumAndTalkReviewTalkReviewNum(customerNum,talkReviewNum);
		
	}
	//?????? ????????? ??????
	@Override
	public int checkLikeTalkReview(int customerNum, int talkReviewNum) {
		
		return likeTalkReviewRep.countByCustomerCustomerNumAndTalkReviewTalkReviewNum(customerNum, talkReviewNum);
	}
	//?????? ????????? ??????
	@Override
	public int checkLikeTalkReview(int talkReviewNum) {
		
		return likeTalkReviewRep.countByTalkReviewTalkReviewNum(talkReviewNum);
	}
	//chatRoom ??????
	@Override
	public ChatRoom createChatRoom(ChatRoom chatRoom) {
		return chatRoomRep.save(chatRoom);
		
	}

	@Override//????????? ?????????
	public  List<EntryInfo> getAllChatRoom(Customer customer) {
		
		return chatRoomEntryRep.findByCustomerOrderByChatRoomRoomLastDate(customer);
		
	}
	//????????? ??????
	@Override
	public void insertRoomEntry(ChatRoom chatRoom, Customer customer) {
		
		chatRoomEntryRep.save(ChatRoomEntry.builder().chatRoom(chatRoom).customer(customer).build());
	}
	//????????? ????????????
	@Override
	public ChatRoom getChatRoom(int chatRoomNum) {
		
		return chatRoomRep.getById(chatRoomNum);
	}
	//????????????
	@Override
	public void saveMessage(Message msg) {
		msgRep.save(msg);
		
		
	}
	//?????? ?????? ?????? ????????????
	@Override
	public Page<Message> getMsgList(int lastNum,int size,int roomNumber) {
		//System.out.println("lastNum==="+lastNum+" ,size==="+size +"roomNumber==="+roomNumber);
//		PageRequest pageRequest= PageRequest.of(0,size);
		//Pageable pageable = Pageable.ofSize(size);
		Pageable pageable = PageRequest.of(0,size, Sort.by("messageNum").descending());
		return msgRep.findDistinctByChatRoomRoomNumberAndMessageNumLessThan( roomNumber,lastNum,pageable);
	}
	//?????? ?????? ??????
	public List<Message> getMsgListFirst(int lastNum,int size,int roomNumber) {
		//System.out.println("lastNum==="+lastNum+" ,size==="+size +"roomNumber==="+roomNumber);
//		PageRequest pageRequest= PageRequest.of(0,size);
		//Pageable pageable = Pageable.ofSize(size);
		
		return msgRep.findTop10ByChatRoomRoomNumberAndMessageNumLessThanOrderByMessageDateDesc( roomNumber,lastNum);
	}

	@Override
	public Page<MindTalk> searchUser(int customerNum, Pageable pageable) {
		return 	talkRep.findAllByCustomerCustomerNumOrderByTalkDateDesc(customerNum, pageable);
		
	}
	@Override
	public Page<MindTalk> searchTag(String tag, Pageable pageable) {
		return 	talkRep.findByTagContainingOrderByTalkDateDesc(tag, pageable);
		
	}
	@Override
	public void deleteRoom(int roomNumber) {
		chatRoomRep.deleteByRoomNumber(roomNumber);
	}
	
	

  
  
  
  }
 
