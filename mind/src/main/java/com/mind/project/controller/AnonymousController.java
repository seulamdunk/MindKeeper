package com.mind.project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
