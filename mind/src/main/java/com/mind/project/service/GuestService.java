package com.mind.project.service;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuestService {

	private final CustomerRepository customerRepository;
	
}
