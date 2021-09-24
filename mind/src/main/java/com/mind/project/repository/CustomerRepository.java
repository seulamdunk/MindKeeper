package com.mind.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	Optional<Customer> findByCustomerID(String id);

	boolean existsByCustomerID(String id);
	
	boolean existsByCustomerNick(String id);
}
