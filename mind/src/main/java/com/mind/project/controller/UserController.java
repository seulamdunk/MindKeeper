package com.mind.project.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.model.Customer;
import com.mind.project.model.CustomerLog;
import com.mind.project.model.MindTalk;
import com.mind.project.repository.CustomerLogRepository;
import com.mind.project.repository.MindTalkRepository;
import com.mind.project.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/user")
@RequiredArgsConstructor
public class UserController {
	
	private final MindTalkRepository mindTalkRepository;
	private final UserService userService;

    // 공개일기 작성
    @PostMapping("/insertTalks")
    public Integer join(@RequestBody Map<String, String> user) {
        Customer customer = new Customer();
        customer.setCustomerNum(Integer.parseInt(user.get("CustomerNum")));
    	return mindTalkRepository.save(MindTalk.builder()
        		.talkCon(user.get("talkCon"))
        		.talkCnt(0)
        		.talkDate(LocalDateTime.now())
        		.talkImg(null)
        		.customer(customer)
                .build()).getTalkNum();
    }
    
    @PostMapping("/nickname")
    public String list() {
    	// 시큐리티에서 정보 가져오기
    	Authentication user = SecurityContextHolder.getContext().getAuthentication();
    	Customer user2 = (Customer) user.getPrincipal();
        return user2.getCustomerNick();
    }

    @PostMapping("/userCheck")
    public String userCheck() {
    	// 시큐리티에서 정보 가져오기
    	try {
    	
    	Authentication user = SecurityContextHolder.getContext().getAuthentication();
    	Customer user2 = (Customer) user.getPrincipal();
    	List<String> role = user2.getRoles();
    	return role.get(0);
    	
    	}catch (Exception e) {
    		return null;
    	}
    }
    
    // 로그아웃
    @GetMapping("/signout")
    public void signout(HttpServletResponse response) throws IOException{
    	//로그아웃시 로그 기록
    	Authentication user = SecurityContextHolder.getContext().getAuthentication();
    	Customer customer = (Customer) user.getPrincipal();
    	userService.logout(customer.getCustomerNum());

    	//쿠키 제거
    	Cookie cookie = new Cookie("token", null);
    	cookie.setMaxAge(0);
    	cookie.setPath("/");
    	response.addCookie(cookie);
    	response.sendRedirect("/");
    }
    

}
