package com.mind.project.controller;

import java.io.Console;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.model.Customer;
import com.mind.project.service.AdminService;
import com.mind.project.service.JindanService;
import com.mind.project.service.MindTalkService;
import com.mind.project.service.NoNameService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	private final MindTalkService mindtalkService;
	private final NoNameService noNameService;
	private final JindanService jindanService;
	
	
	//회원 목록 불러오기
	@GetMapping("/customerList")
	public ResponseEntity customerList() {
		return ResponseEntity.ok(adminService.customerList());
	}

	//마인드톡 목록 불러오기
	@GetMapping("/mindTalkList")
	public ResponseEntity mindTalkList() {
		return ResponseEntity.ok(adminService.mindTalkList());
	}
	
	//마인드톡 게시글 삭제
    @DeleteMapping("/mindTalkDelete/{num}")
    public void deleteMindtalk(@PathVariable int num) {
    	mindtalkService.mindTalkDelete(num);
    }
	
	//닉네임 정보 가져오기
    @PostMapping("/nickname")
    public String list() {
    	// 시큐리티에서 정보 가져오기
    	Authentication user = SecurityContextHolder.getContext().getAuthentication();
    	Customer user2 = (Customer) user.getPrincipal();
        return user2.getCustomerNick();
    }

    //닉네임 정보 가져오기
    @PostMapping("/CustomerProfile")
    public String CustomerProfile() {
    	// 시큐리티에서 정보 가져오기
    	Authentication user = SecurityContextHolder.getContext().getAuthentication();
    	Customer user2 = (Customer) user.getPrincipal();
    	return user2.getProfileImg();
    }
	
    //회원 증가량 ajax 통신
    @GetMapping("/plusCustomer/{num}")
    public int plusCustomer(@PathVariable int num) {
    	int result = 0;
    	try {
    		result = adminService.plusCustomer(num);
    	}catch(Exception e) {
    		result = 0;
    	}
    	return result;
    }
    
    //회원 상세
    @GetMapping("/customerDetail/{num}")
    public Optional<Customer> customerDetail(@PathVariable int num) {
    	return adminService.customerDetail(num);
    }
    
    //회원 상세 게시글 수
    @GetMapping("/customerTalkCount/{num}")
    public Integer customerTalkCount(@PathVariable int num) {
    	Integer result = 0;
    	if(adminService.customerTalkCount(num)!=null)
    		result=adminService.customerTalkCount(num);
    	return result; 
    }
    
    //회원 권한 변경
    @PostMapping("/changerole")
    public int changerole(@RequestBody Map<String, String> customer) {
    int result=	adminService.changeRole(Integer.parseInt(customer.get("customerNum")),customer.get("role"));
    	return result;
    }	
    
    //총 회원 수
    @GetMapping("/countCustomer")
    public int countCustomer() {
    	int result = adminService.countCustomer();
    	return result;
    }
    
    //오늘 방문자 수
    @GetMapping("/countTodayCustomer")
    public int countTodayCustomer() {
    	int result = adminService.countTodayCustomer();
    	return result;
    }

    //오늘의 게시글 수
    @GetMapping("/countMindtalk")
    public Integer countMindtalk() {
    	Integer result = 0; //null 값 비교로 Integer사용
    	if(adminService.countMindtalk()!=null) 
    		result=adminService.countMindtalk();
    	return result;
    }
    
    //태그 조회
    @GetMapping("/countTag")
    public ResponseEntity countTag() {
    	return ResponseEntity.ok(adminService.countTag());
    }
    
    //익명게시판 조회수 
    @GetMapping("/countNoName")
    public ResponseEntity countNoName() {
		return ResponseEntity.ok(noNameService.findnoNameCount());
	}
    
    //긍정 갯수
    @GetMapping("/CustomerPositive")
    public double CustomerPositive() {
    	return jindanService.customerPositive();
    }
}
