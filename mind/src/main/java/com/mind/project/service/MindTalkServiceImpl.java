package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;

@Service("MindTalkService")
public class MindTalkServiceImpl implements MindTalkService {
	@Autowired
	private CustomerRepository customerRep;
	
	public MindTalkServiceImpl(CustomerRepository customerRep){
		this.customerRep = customerRep;
	}
	
	
//	public Int SaveMindTalk()
//	private MindTalkRepository mindtalkRep; 
//	
	@Transactional
	public List<Customer> getCustomerList(){
	
		List<Customer> customers = new ArrayList<>(); 	
		customerRep.findAll().forEach(e -> customers.add(e));
		
		System.out.println(customers.get(0).toString()+"=================================================================================");
		return customers;
	}
	
	
	
}
