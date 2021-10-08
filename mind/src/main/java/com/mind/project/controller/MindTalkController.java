package com.mind.project.controller;


import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mind.project.DTO.MindTalkDTO;
import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.ChatRoom;
import com.mind.project.model.Customer;
import com.mind.project.model.EntryInfo;
import com.mind.project.model.LikeTalk;
import com.mind.project.model.Message;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkReview;

import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.CommonService;
import com.mind.project.service.MindTalkService;
@Controller
public class MindTalkController {
	

	
	@Autowired
	private MindTalkService mindTalk;
	
	@Autowired
	JwtTokenProvider jwtTokenProvider;
	
	@Autowired
	CustomerRepository customerRep;
	
	@Autowired
	CommonService commonService;

	int chattingSize = 10;
	
	//톡 화면 가져오기
	@GetMapping(value="/guest/mindTalk")
	public String getTalkList(Model m, HttpServletRequest request, @PageableDefault(size=5,sort="talkNum",direction = Sort.Direction.DESC)
	Pageable pageable){
		
		//m.addAttribute("talkReviewList", mindTalk.getTalksReviewsList());
		m.addAttribute("talkList", mindTalk.getTalksList(pageable));
		//토큰에 저장된 이름을 바로 가져오는 코드, token 유효성검사 과정이 없어 보임
	
		System.out.println("security check" + SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer =commonService.tokenCustomer(request);
		System.out.println("고객"+ customer.getCustomerNum());
		m.addAttribute("tokenNum",Integer.valueOf(commonService.tokenImfo(m, request)));
		
		m.addAttribute("user",customer);
		return "guest/mindTalk";
		     
	}
	
	//리뷰 가져오기
	@ResponseBody
	@RequestMapping(value="/guest/talkReview")
	public Page<TalkReview> refreshTalk(@RequestBody String talkNum, HttpServletRequest request,
			@PageableDefault(size=5) @SortDefault.SortDefaults({
				@SortDefault(sort ="groupNum",direction = Sort.Direction.ASC),
				@SortDefault(sort ="TkClass",direction = Sort.Direction.ASC),
				@SortDefault(sort ="talkReviewNum",direction = Sort.Direction.ASC),
			}) Pageable pageable
	) {
		int talkNum2=Integer.parseInt(talkNum.substring(1,talkNum.length()-1));
		//System.out.println("talkNum 222=" +talkNum2);
	
		 MindTalk talk = mindTalk.findByTalkNum(talkNum2);
		//System.out.println( mindTalk.getTalkReviewById(talk));
		return  mindTalk.getTalkReviewById(talk,pageable) ;
		
	}
	

	//게시글 입력
	@RequestMapping(value="/insertTalk")
	public String insertTalk(MindTalkDTO talkDTO,MultipartHttpServletRequest MHSR,HttpServletRequest request
			)

	{
	String tag ="";
	for(String i : talkDTO.getTag().split("#")) {
	
		if(!i.trim().equals("")) {
			tag = tag+"#"+i.trim();
		}
		
	}
	System.out.println("호출");
	//System.out.println("왜 안돼\n\n\n\n"+talkDTO.getTalkCon());
	MindTalk talk= new MindTalk();
	talk.setTalkCon(talkDTO.getTalkCon());
	talk.setTalkDate(LocalDateTime.now());
	talk.setTag(tag);
	System.out.println("호출2");
	//쿠키 가져오기
	Cookie[] cookies = request.getCookies();
		//쿠키 값이 null이 아니면
		if(cookies != null) {
			for(Cookie c : cookies) {
				//토큰을 찾아서
				if(c.getName().equals("token") ) {
					//토큰에서 id 받어서 고객 NUM을 찾고 고객 NUM으로 로우 호출
					String token = c.getValue();
					if(jwtTokenProvider.validateToken(token)) {
						String userID=jwtTokenProvider.getUserPk(token);
						//System.out.println("고객ID= "+userID);
						Customer customerData =customerRep.findByCustomerID(userID).get();
						//System.out.println("고객번호 = "+customerData.getCustomerNum());
						talk.setCustomer(customerData);
						try {
							mindTalk.insertTalk(talk,MHSR);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
				}
			}
		}
		
	
		
		return "/guest/mindTalk";
	}
	
	
	//댓글 쓰기
	@ResponseBody
	@PostMapping("/insertTalkReview")
	public void insertTalkReview(@RequestBody Map<String,String> m) {
		mindTalk.insertTalkReview(m);
		
	}
	//게시글 삭제

	@ResponseBody
	@PostMapping("/deleteTalk")
	public void deleteTalk(@RequestBody String talkNum) {
		//System.out.println("확인 \n\n\n\n\n\n\n"+Integer.parseInt(talkNum.substring(1,talkNum.length()-1)));
		mindTalk.deleteTalk(Integer.parseInt(talkNum.substring(1,talkNum.length()-1)));
		
	}
	
	
	//리뷰삭제
	@ResponseBody
	@PostMapping("/deleteTalkReview")
	public void deleteTalkReview(@RequestBody String talkReviewNum) {
		//System.out.println("확인 \n\n\n\n\n\n\n"+talkReviewNum);
		mindTalk.deleteTalkReview(Integer.parseInt(talkReviewNum.substring(1,talkReviewNum.length()-1)));
		
	}
	//게시물 좋아요 입력
	@ResponseBody
	@PostMapping("/saveLiketalk")
	public void saveLiketalk(@RequestBody Map<String, String> m) {
		//System.out.println(m);
		int talkNum = Integer.parseInt(m.get("talkNum"));
		int customerNum = Integer.parseInt(m.get("customerNum"));
		mindTalk.saveTalkLike(LikeTalk.builder().talk(mindTalk.findByTalkNum(talkNum)).customer(customerRep.getById(customerNum)).build());
		
		
	}
	//게시물 좋아요 해제
	@ResponseBody
	@PostMapping("/deleteLikeTalk")
	public void deleteLikeTalk(@RequestBody Map<String, String> m) {
		int talkNum = Integer.parseInt(m.get("talkNum"));
		int customerNum = Integer.parseInt(m.get("customerNum"));
		mindTalk.deleteTalkLike(talkNum, customerNum);
	}
	
	
	//게시물 좋아요 확인
	@ResponseBody
	@RequestMapping(value="/countLiketalk")
	public Map<String,String> countLikeTalk(@RequestBody Map<String, String> map) {
			int talkNum = Integer.parseInt(map.get("talkNum"));
			int customerNum = Integer.parseInt(map.get("customerNum"));		
			//System.out.println("talkNum = " + map.get("talkNum"));
			//System.out.println("customerNum = " + map.get("customerNum"));
		
			Map<String,String> result = new HashMap<>();
			
			result.put("cnt", String.valueOf(mindTalk.countTalkLike(talkNum, customerNum)));
			result.put("cntSum", String.valueOf(mindTalk.countSumTalkLike(talkNum)));
			
		return result;
		
	}
	//댓글 좋아요 입력
	@ResponseBody
	@RequestMapping(value="/insertLikeReview")
	public void insertLikeReview(@RequestBody Map<String,String> map){
	//	System.out.println(map);
		mindTalk.insertLikeTalkReview(Integer.parseInt(map.get("customerNum")),Integer.parseInt( map.get("talkReviewNum")));
	}

	//댓글 좋아요 출력
	@ResponseBody
	@RequestMapping(value="/viewLikeReview")
	public Map<String,String> viewLikeReview(@RequestBody Map<String,String> map){
	System.out.println(map);
	int cnt =mindTalk.checkLikeTalkReview(Integer.parseInt(map.get("customerNum")),Integer.parseInt( map.get("talkReviewNum")));
	int cntSum =mindTalk.checkLikeTalkReview(Integer.parseInt(map.get("customerNum")),Integer.parseInt( map.get("talkReviewNum")));
	
	Map<String,String> result = new HashMap<String,String>();
	result.put("cnt",String.valueOf(cnt));
	result.put("cntSum", String.valueOf(cntSum));
	return result;
	}
	

	//댓글 좋아요 해제
		@ResponseBody
		@RequestMapping(value="/deleteLikeReview")
		public void deleteLikeReview(@RequestBody Map<String,String> map){
		
			mindTalk.deleteLikeTalkReview(Integer.parseInt(map.get("customerNum")),Integer.parseInt( map.get("talkReviewNum")));
		}
	
		
	//chat 이동
		@RequestMapping("/chat")
		public String chat() {
			System.out.println("챗이동");
			return "/guest/chat";
		}
		
		
				
	/*
	 * //chatRoom 이동
	 * 
	 * @RequestMapping("/chat-detail") public String chatRoom() {
	 * 
	 * return "/chat-detail"; }
	 */	
	
		/**
		 * 방 생성하기
		 * @param params
		 * @return
		 */
		@RequestMapping("/createRoom")
		public @ResponseBody List<EntryInfo> createRoom(@RequestParam HashMap<Object, Object> params,HttpServletRequest request){
			System.out.println("방생성 호출");
			Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
			Customer customer = customerOption.get();
			System.out.println("생성자 아이디"+customer.getCustomerNum());
			String roomName = (String) params.get("roomName");
			System.out.println("roomName = " + roomName);
			if(roomName != null && !roomName.trim().equals("")) {
				ChatRoom chatRoom= mindTalk.createChatRoom(ChatRoom.builder().roomName(roomName).build());
				
				mindTalk.insertRoomEntry(chatRoom,customer );
				List<EntryInfo> roomList = mindTalk.getAllChatRoom(customer);
				return roomList;
			}
			return null;
		}
		
		/**
		 * 방 정보가져오기
		 * @param params
		 * @return
		 */
		
		@RequestMapping("/getRoom")
		public @ResponseBody List<EntryInfo> getRoom(@RequestParam HashMap<Object, Object> params,HttpServletRequest request){
			
			
			Optional<Customer> customer= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
			List<EntryInfo> list = mindTalk.getAllChatRoom(customer.get());
			System.out.println("채팅유저"+customer.get().getCustomerNum());
			//System.out.println("testtest====\n\n\n\n\n\n====="+ list.get(0).getChatRoom());
			return list;
		}
		
		/**
		 * 채팅방 이동
		 * @return
		 */	
		@RequestMapping("/moveChating")
		public String chating(HttpServletRequest request,String roomNumber, Model m) {
			System.out.println("채팅방 이동 "+roomNumber );
			Optional<Customer> customerOp= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
			Customer customer =customerOp.get();
			m.addAttribute("user", customer);
			List<Message> messageList =mindTalk.getMsgListFirst(300, chattingSize, Integer.parseInt(roomNumber));
			Collections.reverse(messageList);
			m.addAttribute("roomNumber", roomNumber);
			m.addAttribute("messageList",messageList);
			
	
			return "/guest/chat-detail";
		
		}		
		
		@RequestMapping("/getMessageList")
		@ResponseBody
		public Page<Message> getMessageList(@RequestBody Map<String,String> m ,HttpServletRequest request) {
			
		/*
		 * Page<chatRoomCusNum> list= mindTalk.getMsgList(lastNum, size, roomNumber)
		 * 
		 */
		/*
		 * for(chatRoomCusNum data :list) {
		 * System.out.println(data.getCustomer().getMessage().get(0).getMessageNum()); }
		 */
			return null;
		}

	/*
			@RequestMapping("/getMessageList")
		@ResponseBody
		public Page<chatRoomCusNum> getMessageList(@RequestBody Map<String,String> m ,HttpServletRequest request) {
			
			
			Page<chatRoomCusNum> list= mindTalk.getMsgList(Integer.parseInt(m.get("lastNum")),Integer.parseInt(m.get("size")), Integer.parseInt(m.get("roomNumber")));
			for(chatRoomCusNum data :list) {
				System.out.println(data.getCustomer().getMessage().get(0).getMessageNum());
			}
			return list;
		}
	*/
		@RequestMapping("/saveMessage")
		@ResponseBody
		public void saveMessage(@RequestBody Map<String,String> m ,HttpServletRequest request) {
		System.out.println("데이터 체크  == "+ m);
		mindTalk.saveMessage(Message.builder()
				.messageCon(m.get("msg"))
				.customer(Customer.builder().customerNum(Integer.parseInt(m.get("userNum"))).build())
				.chatRoom(ChatRoom.builder().roomNum(Integer.parseInt(m.get("roomNumber"))).build())
				.build());
		
		}
		
		
		
		@RequestMapping("/invitation")
		public String  invitaion(@RequestParam int userNum,String userName,HttpServletRequest request) {
			System.out.println("userNum =  "+userNum  +"  userName  = "+userName);
			ModelAndView mv = new ModelAndView();
			Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
			Customer sender = customerOption.get();
			Customer reciver = customerRep.getById(userNum);
			String roomName= userName +"님과 "+ sender.getCustomerName();
			System.out.println(roomName);
			ChatRoom chatRoom= mindTalk.createChatRoom(ChatRoom.builder().roomName(roomName).build());
			mindTalk.insertRoomEntry(chatRoom,sender );
			System.out.println("reciver"+ reciver.getCustomerNum());
			mindTalk.insertRoomEntry(chatRoom,reciver );
		/* mv.setViewName("/guest/chatRoom"); */
			
			return "redirect:/guest/chat";
		}
		
		
		
		@RequestMapping("/searchUser")
		public ModelAndView searchUser(@RequestParam int userNum,ModelAndView mv,HttpServletRequest request
				,@PageableDefault(size=5,sort="talkNum",direction = Sort.Direction.DESC)
		Pageable pageable) {
			System.out.println("userNum= "+userNum);
			Customer customer =commonService.tokenCustomer(request);
			//System.out.println("고객"+ customer);
			mv.addObject("tokenNum",customer.getCustomerNum());
			
			mv.addObject("user",customer);
			mv.addObject("talkList", mindTalk.searchUser(userNum, pageable));
			mv.setViewName("guest/mindTalkSearch");
			return mv;
		}
		
	
		@RequestMapping("/deleteRoom")
		public void deleteRoom(@RequestParam int roomNumber) {
			System.out.println("deleteroom"+roomNumber);
			mindTalk.deleteRoom(roomNumber);
			
		}
}
//@ResponseBody
//@RequestMapping(value="/refreshTalk")
//public void refreshTalk(Model m, HttpServletRequest request) {
//	m.addAttribute("talkList", mindTalk.getTalksList());
//	System.out.println("갱신");
//	commonService.tokenImfo(m,request);
//	
//}
/*
  
  	@ResponseBody
	@PostMapping("/getToken")
	public int getToken(HttpServletRequest request) {
		//System.out.println("확인 \n\n\n\n\n\n\n"+talkReviewNum);
		int talkNum=-1;
		if(commonService.tokenCustomer(request).getCustomerNum()!=null) {
			talkNum=commonService.tokenCustomer(request).getCustomerNum();
		}
		
		return talkNum;
		
	}
 
*/