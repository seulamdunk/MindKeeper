package com.mind.project.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mind.project.repository.CustomerRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CustomUserDetailService implements UserDetailsService  {

	@Autowired
	private final CustomerRepository customerRepository;
	
	//UserDetails상속받은 Customer에서 유저 정보를 불러오면 UserDetails이라는 스프링에서 제공하는 클래스로 반환하는 메소드
	@Override
	public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {
		return customerRepository.findByCustomerID(loginId)
				.orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다."));
	}

}
