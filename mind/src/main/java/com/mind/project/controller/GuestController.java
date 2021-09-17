package com.mind.project.controller;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.GuestService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/guest")
@RequiredArgsConstructor
public class GuestController {
	
	private final GuestService guestService;
	
//	@PostMapping("/insertCustomer")
//	public ResponseEntity<Customer> insertCustomer(@RequestBody InsertCustomerRequest request) {
//		return ResponseEntity.ok(guestService.insertCustomer(request));
//	}
	
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final CustomerRepository customerRepository;
	
    // 회원가입
    @PostMapping("/signup")
    public Integer join(@RequestBody Map<String, String> user) {
        return customerRepository.save(Customer.builder()
                .customerID(user.get("customerID"))
                .customerPW(passwordEncoder.encode(user.get("customerPW")))
                .customerName(user.get("customerName"))
                .customerNick(user.get("customerNick"))
                .identityNum(user.get("identityNum"))
                .createDate(LocalDateTime.now())
                .phoneNum(user.get("phoneNum"))
                .roles(Collections.singletonList("ROLE_USER")) // 최초 가입시 USER 로 설정
                .build()).getCustomerNum();
    }

    // 로그인
    @PostMapping("/signin")
    public String login(@RequestBody Map<String, String> user,HttpServletResponse response) {
        Customer customer= customerRepository.findByCustomerID(user.get("customerID"))
                .orElseThrow(() -> new IllegalArgumentException("가입되지 않은 아이디 입니다."));
        if (!passwordEncoder.matches(user.get("customerPW"), customer.getPassword())) {
            throw new IllegalArgumentException("잘못된 비밀번호입니다.");
        }
        return jwtTokenProvider.createToken(customer.getUsername(), customer.getRoles());
    }
    
    //권한 확인 나중에 지울것
    @GetMapping("/checkJWT")
    public String list(){
      //권한체크
      Authentication user = SecurityContextHolder.getContext().getAuthentication();
      Customer user2 = (Customer) user.getPrincipal();
      return user.getAuthorities().toString()+" / "+user2.getCustomerID()+" / "+user2.getCustomerNick();
    }
}
