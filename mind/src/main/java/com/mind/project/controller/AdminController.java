package com.mind.project.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.service.AdminService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
@CrossOrigin("*")
public class AdminController {
	
	private final AdminService adminService;
	
	@GetMapping("/memberList")
	public ResponseEntity memberList() {
		return ResponseEntity.ok(adminService.memberList());
	}
}
