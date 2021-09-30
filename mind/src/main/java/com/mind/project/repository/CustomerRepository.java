package com.mind.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

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
	
	//권한변경
    @Modifying(clearAutomatically = true)
    @Transactional
	@Query(value="UPDATE customer_roles SET roles=?2 WHERE customer_customer_num=?1",nativeQuery=true)
	public int changeRole(@Param("num") int num,@Param("role") String role);

    
}
