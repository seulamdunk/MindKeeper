package com.mind.project.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.Customer;
import com.mind.project.repository.CustomerRepository;
@Service
public class CommonService {
	
	
	
	@Autowired
	CustomerRepository customerRep;
	@Autowired
	JwtTokenProvider jwtTokenProvider;
	
	public int tokenImfo(Model m,HttpServletRequest request) {
		//쿠키 가져오기
		Cookie[] cookies = request.getCookies();
			//쿠키 값이 null이 아니면
			if(cookies != null) {
				for(Cookie c : cookies) {
					//토큰을 찾아서
					if(c.getName().equals("token") ) {
						//토큰에서 id 받어서 고객 NUM을 찾고 고객 NUM으로 로우 호출
						String token = c.getValue();
						//토큰 유효성 검사 결과에 따라 진행
						if(jwtTokenProvider.validateToken(token)) {
							String userID=jwtTokenProvider.getUserPk(token);
							System.out.println("고객ID= "+userID);
							Customer customerData =customerRep.findByCustomerID(userID).get();
							System.out.println("고객번호 = "+customerData.getCustomerNum());
							m.addAttribute("tokenNum", customerData.getCustomerNum());
							return customerData.getCustomerNum();
							
						}else {
							
						}
					}else {
						
					}
				}
			}else {
				
			}
			return -1;
	}
	
	
	
	
	public Customer tokenCustomer(HttpServletRequest request) {
		//쿠키 가져오기
		Cookie[] cookies = request.getCookies();
			//쿠키 값이 null이 아니면
			if(cookies != null) {
				System.out.println("쿠키 존재");
				for(Cookie c : cookies) {
					System.out.println("쿠키이름 " +c);
					//토큰을 찾아서
					if(c.getName().equals("token") ) {
						//토큰에서 id 받어서 고객 NUM을 찾고 고객 NUM으로 로우 호출
						String token = c.getValue();
						System.out.println("토큰 있다"+token);
						//토큰 유효성 검사 결과에 따라 진행
						if(jwtTokenProvider.validateToken(token)) {
							String userID=jwtTokenProvider.getUserPk(token);
							//System.out.println("고객ID= "+userID);
							Customer customerData =customerRep.findByCustomerID(userID).get();
							System.out.println("고객번호 = "+customerData.getCustomerNum());
							return customerData;
							
							
						}else {
							//토큰이 유효하지 않으면 GUEST로 null
							Customer Nocustomer= new Customer();
							return Nocustomer;
						}
					}else {
						Customer Nocustomer= new Customer();
						return Nocustomer;
					}
				}
			}else {//쿠키가 없으면 GUEST로 null
				Customer Nocustomer= new Customer();
				return Nocustomer;
			}
			Customer Nocustomer= new Customer();
			return Nocustomer;
	}
}


/*	public Model tokenImfo(Model m,HttpServletRequest request) {
		//쿠키 가져오기
		Cookie[] cookies = request.getCookies();
			//쿠키 값이 null이 아니면
			if(cookies != null) {
				for(Cookie c : cookies) {
					//토큰을 찾아서
					if(c.getName().equals("X-AUTH-TOKEN") ) {
						//토큰에서 id 받어서 고객 NUM을 찾고 고객 NUM으로 로우 호출
						String token = c.getValue();
						//토큰 유효성 검사 결과에 따라 진행
						if(jwtTokenProvider.validateToken(token)) {
							String userID=jwtTokenProvider.getUserPk(token);
							System.out.println("고객ID= "+userID);
							Customer customerData =customerRep.findByCustomerID(userID).get();
							System.out.println("고객번호 = "+customerData.getCustomerNum());
							m.addAttribute("tokenNum", customerData.getCustomerNum());
							
							
						}else {
							//토큰이 유효하지 않으면 GUEST로 -1
							m.addAttribute("tokenNum", -1);
						}
					}else {
						m.addAttribute("tokenNum", -1);
					}
				}
			}else {//쿠키가 없으면 GUEST로 -1
				m.addAttribute("tokenNum", -1);
			}
			return m;
	}
*/
