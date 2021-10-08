package com.mind.project.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mind.project.model.Customer;
import com.mind.project.model.NoName;
import com.mind.project.model.NoNameReply;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.CommonService;
import com.mind.project.service.NoNameService;

@Controller
public class NoNameApiController {
	
	@Autowired
	private NoNameService noNameService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CustomerRepository customerRep;
	
	// 리스트, 페이징 처리
	@GetMapping("/no_name")
	public String n_list(Model model, @PageableDefault(size=5, sort="noNameNum", direction=Sort.Direction.DESC) Pageable pageable) {
		
		model.addAttribute("n_list", noNameService.no_list(pageable));
		//System.out.println(noNameService.no_list());
		
		return "no_name";
	}
	
	// 게시글 작성
	@RequestMapping("/no_name_write")
	public String move() {
		return "no_name_write";
	}
	
	@ResponseBody
	@RequestMapping(value="/n_write")
	public void save(HttpServletRequest request, @RequestBody Map<String,String> m){
		NoName noName = new NoName();
		//System.err.println(m.get("noNameTitle"));
		//noName.setNoNameNum(Integer.parseInt(m.get("noNameNum")));
		noName.setNoNameTitle(m.get("noNameTitle"));
		noName.setNoNameCon(m.get("noNameCon"));
		//System.out.println(m);
		//Customer customer = commonService.tokenCustomer(request);
		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer = customerOption.get();
		//System.out.println("customer: " + customer.getCustomerNum());
		System.out.println("title" + noName.getNoNameTitle());
		System.out.println("con" + noName.getNoNameCon());
		System.out.println("num" + noName.getNoNameNum());
		System.out.println("customer" + customer.getCustomerNum());
		noNameService.write(noName, customer);
	}
	
	// 상세 페이지
	@GetMapping("/n_details/{noNameNum}")
	public String n_detail(@PathVariable int noNameNum, Model model, HttpServletRequest request) {

//		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
//		Customer customer = customerOption.get();
//		System.out.println(customer.getCustomerNum());
		commonService.tokenImfo(model, request);
		model.addAttribute("noName", noNameService.n_details(noNameNum));
		
		return "no_name_details"; 
	}
	
	// 삭제하기
	@ResponseBody
	@DeleteMapping("/n_details/{noNameNum}")
	public void deleteById(@RequestBody @PathVariable int noNameNum, HttpServletRequest request) {
		//System.out.println("noNameNum: " + noNameNum);
		Customer customer = commonService.tokenCustomer(request);
		//System.out.println("customer: " + customer.getCustomerNum());
		noNameService.delete(noNameNum,customer);
		
	}
	
	//수정하기
	
	@GetMapping("/n_details/edit/{noNameNum}")
	public String update(@PathVariable int noNameNum, Model model, HttpServletRequest request){
		commonService.tokenImfo(model, request);
		model.addAttribute("noName", noNameService.n_details(noNameNum));
		
		return "no_name_update";
	}
	
	@ResponseBody
	@PostMapping("/n_details/edit")
	public void n_update(@RequestBody Map<String,String> m) {
		NoName noName = new NoName();
		noName.setNoNameDate(LocalDateTime.now());
		
		noName.setNoNameNum(Integer.parseInt(m.get("noNameNum")));
		noName.setNoNameTitle(m.get("noNameTitle"));
		noName.setNoNameCon(m.get("noNameCon"));
		
		
		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer = customerOption.get();
		//System.out.println("customer" + customer.getCustomerNum());
		System.out.println(noName.getNoNameDate());
//		System.out.println(noName.getNoNameTitle());
//		System.out.println(noName.getNoNameCon());
//		System.out.println(noName.getNoNameNum());
		noNameService.update(noName, customer);
		
	}
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value="/n_details/{noNameNum}/reply")
	public void replySave(HttpServletRequest request, @PathVariable int noNameNum, @RequestBody String replyContent , NoNameReply reply){
		//System.out.println(m);
		String replyCon2=replyContent.substring(1, replyContent.length()-1);
		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer = customerOption.get();
		//System.out.println("customer: " + customer.getCustomerNum());
		noNameService.replyWrite(customer, noNameNum, replyCon2);
	}

}
