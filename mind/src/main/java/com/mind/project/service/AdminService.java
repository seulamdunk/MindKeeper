package com.mind.project.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.MindTalk;
import com.mind.project.repository.CustomerLogRepository;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.repository.MindTalkRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final CustomerRepository customerRepository;
	private final MindTalkRepository mindTalkRepository;
	private final CustomerLogRepository customerLogRepository;
	//회원 목록
	public List<Customer> customerList() {
		return customerRepository.findAll(); 
	}
	
	//게시글 목록
	public List<Object[]> mindTalkList() {
		return mindTalkRepository.findMindtalk();
	}

	//오늘 게시글 수
	public Integer countMindtalk() {
		return mindTalkRepository.countMindtalk();
	}
	//오늘 방문자 수
	public Integer countTodayCustomer() {
		return customerLogRepository.countTodayCustomer();
	}

	//가입자 수
	public int plusCustomer(int num) {
		return customerRepository.plusCustomer(num);
	}
	
	//전체 가입자 수
	public int countCustomer() {
		List<Customer> count=customerRepository.findAll();
		int result=count.size();
		return result;
	}
	
	//회원 상세
	public Optional<Customer> customerDetail(int num) {
		return customerRepository.findById(num);
	}
	//회원 게시글 수
	public Integer customerTalkCount(int num) {
		return mindTalkRepository.customerTalkCount(num);
	}

	//권한 변경
	public int changeRole(int num,String role) {
		return customerRepository.changeRole(num,role);
	}
	
	
	
	
	

}
