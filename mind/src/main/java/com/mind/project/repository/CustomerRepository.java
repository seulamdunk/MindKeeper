package com.mind.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mind.project.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

}
