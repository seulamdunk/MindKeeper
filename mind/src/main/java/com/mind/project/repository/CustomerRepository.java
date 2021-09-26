package com.mind.project.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mind.project.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	//아이디 조회
	Optional<Customer> findByCustomerID(String id);

	//아이디 중복 조회
	boolean existsByCustomerID(String id);
	
	//닉네임중복 조회
	boolean existsByCustomerNick(String id);
	
	//회원증가량 쿼리
	@Query(value="SELECT count(create_date) FROM Customer c WHERE date(create_date)= date(now()-:num ) group by date(create_date)",nativeQuery=true)
	public int plusCustomer(@Param("num") int num);
}
