package com.mind.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.repository.MindTalkRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final CustomerRepository customerRepository;
	private final MindTalkRepository mindTalkRepository;
	
	//회원 목록
	public List<Customer> customerList() {
		return customerRepository.findAll(); 
	}
	
	//게시글 목록
	public List<Object[]> mindTalkList() {
		return mindTalkRepository.findMindtalk();
	}

	//가입자 수
	public int plusCustomer(int num) {
		return customerRepository.plusCustomer(num);
	}
	
	
}
