package com.mind.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mind.project.DTO.No_nameDTO;
import com.mind.project.model.AnonymousBoard;
import com.mind.project.repository.AnonymousBoardRepository;

import lombok.extern.java.Log;

@Controller
@Log
public class AnonymousController {
	
	@Autowired
	private AnonymousBoardRepository repo;
	
	@GetMapping("/no_name")
	public String list() {
		
		return "no_name";
	}

}
