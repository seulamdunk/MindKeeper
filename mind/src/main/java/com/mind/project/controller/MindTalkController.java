package com.mind.project.controller;


import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.MindTalkDTO;
import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.Customer;
import com.mind.project.model.LikeTalk;
import com.mind.project.model.MindTalk;
import com.mind.project.model.TalkReview;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.CommonService;
import com.mind.project.service.MindTalkService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	

	
	
	@GetMapping(value="/guest/mindTalk")
	public String getTalkList(Model m, HttpServletRequest request, @PageableDefault(size=5,sort="talkNum",direction = Sort.Direction.DESC)
	Pageable pageable){
		
		//m.addAttribute("talkReviewList", mindTalk.getTalksReviewsList());
		m.addAttribute("talkList", mindTalk.getTalksList(pageable));
		//토큰에 저장된 이름을 바로 가져오는 코드, token 유효성검사 과정이 없어 보임
		System.out.println("security check" + SecurityContextHolder.getContext().getAuthentication().getName());
		m.addAttribute("tokenNum",Integer.valueOf(commonService.tokenImfo(m,request)));
		
		return "guest/mindTalk";
		     
	}
	

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
	

	@RequestMapping(value="/insertTalk")
	public String insertTalk(MindTalkDTO talkDTO,MultipartHttpServletRequest MHSR,HttpServletRequest request
			) throws Exception  
	{

	//System.out.println("왜 안돼\n\n\n\n"+talkDTO.getTalkCon());
	MindTalk talk= new MindTalk();
	talk.setTalkCon(talkDTO.getTalkCon());
	talk.setTalkDate(LocalDateTime.now());
	
	//쿠키 가져오기
	Cookie[] cookies = request.getCookies();
		//쿠키 값이 null이 아니면
		if(cookies != null) {
			for(Cookie c : cookies) {
				//토큰을 찾아서
				if(c.getName().equals("X-AUTH-TOKEN") ) {
					//토큰에서 id 받어서 고객 NUM을 찾고 고객 NUM으로 로우 호출
					String token = c.getValue();
					if(jwtTokenProvider.validateToken(token)) {
						String userID=jwtTokenProvider.getUserPk(token);
						//System.out.println("고객ID= "+userID);
						Customer customerData =customerRep.findByCustomerID(userID).get();
						//System.out.println("고객번호 = "+customerData.getCustomerNum());
						talk.setCustomer(customerData);
						mindTalk.insertTalk(talk,MHSR);
						
					}
				}
			}
		}
		
	
		
		return "redirect:/guest/mindTalk";
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
	
	@ResponseBody
	@PostMapping("/deleteTalkReview")
	public void deleteTalkReview(@RequestBody String talkReviewNum) {
		//System.out.println("확인 \n\n\n\n\n\n\n"+talkReviewNum);
		mindTalk.deleteTalkReview(Integer.parseInt(talkReviewNum.substring(1,talkReviewNum.length()-1)));
		
	}

	@ResponseBody
	@PostMapping("/saveLiketalk")
	public void saveLiketalk(@RequestBody Map<String, String> m) {
		//System.out.println(m);
		int talkNum = Integer.parseInt(m.get("talkNum"));
		int customerNum = Integer.parseInt(m.get("customerNum"));
		mindTalk.saveTalkLike(LikeTalk.builder().talk(mindTalk.findByTalkNum(talkNum)).customer(customerRep.getById(customerNum)).build());
		
		
	}

	@ResponseBody
	@PostMapping("/deleteLikeTalk")
	public void deleteLikeTalk(@RequestBody Map<String, String> m) {
		int talkNum = Integer.parseInt(m.get("talkNum"));
		int customerNum = Integer.parseInt(m.get("customerNum"));
		mindTalk.deleteTalkLike(talkNum, customerNum);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/countLiketalk")
	public Map<String,String> countLikeTalk(@RequestBody Map<String, String> map) {
			int talkNum = Integer.parseInt(map.get("talkNum"));
			int customerNum = Integer.parseInt(map.get("customerNum"));		
			//System.out.println("talkNum = " + map.get("talkNum"));
			//System.out.println("customerNum = " + map.get("customerNum"));
			int cnt =mindTalk.countTalkLike(talkNum, customerNum);
			int cntSum = mindTalk.countSumTalkLike(talkNum);
			Map<String,String> result = new HashMap<>();
			
			result.put("cnt", String.valueOf(mindTalk.countTalkLike(talkNum, customerNum)));
			result.put("cntSum", String.valueOf(mindTalk.countSumTalkLike(talkNum)));
			
		return result;
		
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