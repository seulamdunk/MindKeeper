package com.mind.project.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.repository.MindTalkRepository;
import com.mind.project.service.AdminService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	@GetMapping("/customerList")
	public ResponseEntity customerList() {
		return ResponseEntity.ok(adminService.customerList());
	}
	
	@GetMapping("/mindTalkList")
	public ResponseEntity mindTalkList() {
		return ResponseEntity.ok(adminService.mindTalkList());
	}
}
