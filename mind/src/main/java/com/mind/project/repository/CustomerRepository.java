package com.mind.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	Optional<Customer> findByCustomerID(String id);

	//임시 토큰 key 값 nick 기준
	Customer findByCustomerNick(String customerNick);
}
