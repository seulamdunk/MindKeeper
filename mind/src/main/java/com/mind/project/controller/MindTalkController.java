package com.mind.project.controller;


import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
		

		m.addAttribute("talkList", mindTalk.getTalksList());
	 
		return "guest/mindTalk";
		     
	}
	
	
	@PostMapping(value="/insertTalk")
	public String insertTalk(@RequestBody MindTalk talk,MultipartHttpServletRequest msr
			, HttpServletRequest request) throws Exception  
	{
		//System.out.println("내용2==============!!!!!"+talkCon);
	System.out.println("내용2==============!!!!!"+talk.getTalkCon());
	
	
//	Cookie[] cookies = request.getCookies();
//		
//		if(cookies != null) {
//			for(Cookie c : cookies) {
//				if(c.getName().equals("X-AUTH-TOKEN") ) {
//					
//					String token = c.getValue();
//					if(jwtTokenProvider.validateToken(token)) {
//						String userNick=jwtTokenProvider.getUserPk(token);
//						
//						Customer customerData =customerRep.findByCustomerNick(userNick);
//						System.out.println("고객번호 = "+customerData.getCustomerNum());
//						talk.setCustomer(customerData);
//						mindTalk.insertTalk(talk);
//						
//					}
//				}
//			}
//		}
		
	
		
		return "guest/mindTalk";
	}
	
	

}


