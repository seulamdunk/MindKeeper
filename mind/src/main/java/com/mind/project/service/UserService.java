package com.mind.project.service;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.CustomerLog;
import com.mind.project.repository.CustomerLogRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final CustomerLogRepository customerLogRepository;
	
	//로그인시 현재시간으로 로그
	public void login(int customerNum) {
		CustomerLog log = new CustomerLog();
		Customer user = new Customer();
		user.setCustomerNum(customerNum);
		log.setCustomer(user);
		log.setLogin(LocalDateTime.now());
		customerLogRepository.save(log);
	}
	//로그아웃시 현재시간으로 로그
	public void logout(int customerNum) {
		CustomerLog log = new CustomerLog();
		Customer user = new Customer();
		user.setCustomerNum(customerNum);
		log.setCustomer(user);
		log.setLogout(LocalDateTime.now());
		customerLogRepository.save(log);
	}
}
