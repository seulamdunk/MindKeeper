package com.mind.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mind.project.DTO.NoNameDTO;
import com.mind.project.service.NoNameService;

import lombok.extern.java.Log;

@Controller
@Log
public class NoNameController {
	
	@Autowired
	private NoNameService noNameService;
	
	public NoNameController(NoNameService noNameService) {
		this.noNameService = noNameService;
	}
	
	
	// 게시판 리스트 보기
	@GetMapping(value="/n_name")
	public String list(Long noNameNum,Model model, @RequestParam(value="page", defaultValue="1") Integer pageNum) {
		//System.out.println("pageNum" + pageNum);
		
		List<NoNameDTO> noNameList = noNameService.getNoNameList(pageNum);
		Integer[] pageList = noNameService.getPageList(pageNum);
		
		//model.addAttribute("count", noNameService.updateCount(noNameNum));
		model.addAttribute("noNameList", noNameList);
		model.addAttribute("pageList", pageList);
		//System.out.println("count" + noNameNum);
		return "no_name";
	}
	
	// 게시판 작성
	@GetMapping("/n_write")
	public String write() {
		
		return "no_name_write";
	}
	
	@PostMapping("/n_write")
	public String write(NoNameDTO noNameDTO) {
		
		noNameService.saveNoName(noNameDTO);
		return "redirect:/n_name";
	}
	
	// 게시판 상세보기
	@GetMapping("/n_details/{no}")
	public String details(@PathVariable("no") Long noNameNum, Model model) {
		System.out.println("noNameNum: " + noNameNum);
		NoNameDTO noNameDTO = noNameService.getPost(noNameNum);
		model.addAttribute("noNameDTO", noNameDTO);
		
		return "no_name_details";
	}
	
	// 게시판 수정
	@GetMapping("/n_details/edit/{no}")
	public String edit(@PathVariable("no") Long noNameNum, Model model) {
		
		NoNameDTO noNameDTO = noNameService.getPost(noNameNum);
		model.addAttribute("noNameDTO", noNameDTO);
		
		return "no_name_update";
		
	}

	
	@PutMapping("/n_details/edit/{no}")
	public String update(NoNameDTO noNameDTO) {
		//System.out.println(noNameDTO.getNo_name_date());
		noNameService.saveNoName(noNameDTO);
		//System.out.println(noNameDTO.getNo_name_num());
		
		return "redirect:/n_name";
		
	}
	
	// 게시글 삭제
	@DeleteMapping("/n_details/{no}")
	public String delete(@PathVariable("no") Long noNameNum) {
		
		noNameService.deleteNoName(noNameNum);
		
		return "redirect:/n_name";
	}
	
	// 게시판 검색 기능
	@GetMapping("/n_search")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
	   
		List<NoNameDTO> noNameDTOList = noNameService.searchPosts(keyword);
	    
	    model.addAttribute("noNameDTOList", noNameDTOList);
	    //System.out.println("noNameDTOList:" + noNameDTOList);
	    return "no_name_view";
	}
	
	
}
