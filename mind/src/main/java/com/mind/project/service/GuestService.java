package com.mind.project.service;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.request.InsertCustomerRequest;
import com.mind.project.repository.CustomerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuestService {

	private final CustomerRepository customerRepository;
	
	public Customer insertCustomer(InsertCustomerRequest request) {
		Customer customer = new Customer();
		BeanUtils.copyProperties(request, customer);
		return customerRepository.save(customer);
	}
}
