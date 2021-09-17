package com.mind.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.MindTalk;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.repository.MindTalkRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final CustomerRepository customerRepository;
	private final MindTalkRepository mindTalkRepository;
	
	public List<Customer> customerList() {
		return customerRepository.findAll(); 
	}
	
	public List<Object[]> mindTalkList() {
		return mindTalkRepository.findMindtalk();
	}
}
