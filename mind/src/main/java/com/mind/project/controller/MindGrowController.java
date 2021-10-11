package com.mind.project.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mind.project.model.Customer;
import com.mind.project.model.Youtube;
import com.mind.project.model.YoutubeReview;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.CommonService;
import com.mind.project.service.MindGrowService;




@Controller
public class MindGrowController {
	@Autowired
	MindGrowService mindGrowService;
	@Autowired
	CommonService commonService;
	
	@Autowired
	CustomerRepository customerRep;
	
	
	
	@GetMapping(value="/guest/mindGrow")
	public String getListYoutube(Model m,HttpServletRequest request) throws Exception {
		
		m.addAttribute("recommendList", mindGrowService.getRecommendList(request));
		m.addAttribute("youtubeSet", mindGrowService.getListYoutube());
		return "/guest/mindGrow";
	}
	
	
	
	@GetMapping(value="/mindGrowDetail")
	public String viewYoutube(String youtubeNum, Model m,HttpServletRequest request) throws Exception{
		System.out.println(youtubeNum);
		Youtube youtube = mindGrowService.getYoutube(Integer.parseInt(youtubeNum));
		youtube.setYoutubeUrl(youtube.getYoutubeUrl().replace("watch?v=","embed/"));
		m.addAttribute("youtube", youtube);
		
		
			Optional<Customer> customerOption=customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
			Customer customer = customerOption.get();
			m.addAttribute("user",customer.getCustomerNum());
		/*
		 * if(SecurityContextHolder.getContext().getAuthentication().getName() !=null) {
		 * Optional<Customer> customerOption=
		 * customerRep.findByCustomerID(SecurityContextHolder.getContext().
		 * getAuthentication().getName()); Customer customer = customerOption.get();
		 * 
		 * m.addAttribute("user",customer.getCustomerNum()); }else { Customer customer =
		 * commonService.tokenCustomer(request); }
		 */
		System.out.println("customer"+ customer.getCustomerNum());
		//youtube log
		if(customer.getCustomerNum() != null) {
			System.out.println("조건 체크"+customer.getCustomerNum());
			mindGrowService.savaYoutuveLog(youtube, customer);
		}
		m.addAttribute("recommendList", mindGrowService.getRecommendList(request));
		
		return "/guest/mindGrowDetail";
	}
	
	@ResponseBody
	@RequestMapping("/insertYoutubeReview")
	public void insertYoutubeReview(@RequestBody Map<String, String> m) throws Exception{
		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer = customerOption.get();
		if(customer.getCustomerName() != null) {
		mindGrowService.insertYoutubeReview(customer, Youtube.builder().youtubeNum(Integer.parseInt(m.get("youtubeNum"))).build(),m.get("youtubeCon"));
	}}
	
	@ResponseBody
	@RequestMapping("/deleteYoutubeReview")
	public void deleteYoutubeReview(@RequestBody Map<String, String> m) throws Exception{
		
		System.out.println("삭제"+ m);
		mindGrowService.deleteYoutubeReview(YoutubeReview.builder().youtubeReviewNum(Integer.parseInt(m.get("youtubeReviewNum"))).build());
	}
	
	@ResponseBody
	@RequestMapping("/getYoutubeReview")
	public List<YoutubeReview> viewYoutubeReview(@RequestBody Map<String, String> m) {
		
		System.out.println("리뷰"+Integer.parseInt(m.get("youtubeNum")));

		return mindGrowService.viewYoutubeReview(Integer.parseInt(m.get("youtubeNum")));
	}
}







