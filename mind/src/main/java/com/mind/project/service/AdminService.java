package com.mind.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final CustomerRepository customerRepository;
	
	public List<Customer> memberList() {
		return customerRepository.findAll(); 
	}
}
