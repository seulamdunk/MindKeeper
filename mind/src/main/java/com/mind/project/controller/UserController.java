package com.mind.project.controller;

import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.model.Customer;
import com.mind.project.model.MindTalk;
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
    @PostMapping("/insertTalk")
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
    

}
