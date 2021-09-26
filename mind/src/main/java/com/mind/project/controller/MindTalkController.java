package com.mind.project.controller;


import java.time.LocalDateTime;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mind.project.DTO.MindTalkDTO;
import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.Customer;
import com.mind.project.model.MindTalk;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.MindTalkService;
@Controller
public class MindTalkController {
	


	@Autowired
	private MindTalkService mindTalk;
	@Autowired
	JwtTokenProvider jwtTokenProvider;
	
	@Autowired
	CustomerRepository customerRep;
	
	
	
	@GetMapping(value="/guest/mindTalk")
	public String getTalkList(Model m, HttpServletRequest request){
		
		m.addAttribute("talkReviewList", mindTalk.getTalksReviewsList());
		m.addAttribute("talkList", mindTalk.getTalksList());
	 
		return "guest/mindTalk";
		     
	}
	

	@RequestMapping(value="/insertTalk")
	public String insertTalk(MindTalkDTO talkDTO,MultipartHttpServletRequest MHSR,HttpServletRequest request
			) throws Exception  
	{

	System.out.println("왜 안돼"+talkDTO.getTalkCon());
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
						System.out.println("고객ID= "+userID);
						Customer customerData =customerRep.findByCustomerID(userID).get();
						System.out.println("고객번호 = "+customerData.getCustomerNum());
						talk.setCustomer(customerData);
						mindTalk.insertTalk(talk,MHSR);
						
					}
				}
			}
		}
		
	
		
		return "redirect:guest/mindTalk";
	}
	
	@ResponseBody
	@PostMapping("/test_ajax")
	public Model test(Model model , String secretNum) {
		System.out.println("확인 \n\n\n\n\n\n\n"+secretNum);
		return model;
	}

}


