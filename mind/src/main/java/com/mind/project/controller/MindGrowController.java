package com.mind.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.model.Customer;
import com.mind.project.model.Youtube;
import com.mind.project.service.CommonService;
import com.mind.project.service.MindGrowService;

@Controller
public class MindGrowController {
	@Autowired
	MindGrowService mindGrowService;
	@Autowired
	CommonService commonService;
	
	@GetMapping(value="/guest/mindGrow")
	public String getListYoutube(Model m) throws Exception {
		m.addAttribute("youtubeSet", mindGrowService.getListYoutube());
		return "/guest/mindGrow";
	}
	
	
	
	@GetMapping(value="/mindGrowDetail")
	public String viewYoutube(String youtubeNum, Model m,HttpServletRequest request) throws Exception{
		System.out.println(youtubeNum);
		Youtube youtube = mindGrowService.getYoutube(Integer.parseInt(youtubeNum));
		youtube.setYoutubeUrl(youtube.getYoutubeUrl().replace("watch?v=","embed/"));
		m.addAttribute("youtube", youtube);
		Customer customer = commonService.tokenCustomer(request);
		//youtube log
		if(customer.getCustomerNum() != null) {
			System.out.println("조건 체크"+customer.getCustomerNum());
			mindGrowService.savaYoutuveLog(youtube, customer);
		}
		
		
		return "/guest/mindGrowDetail";
	}
	
	
}
