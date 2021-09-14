package com.mind.project.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.model.Customer;
import com.mind.project.model.request.InsertCustomerRequest;
import com.mind.project.service.GuestService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/guest")
@RequiredArgsConstructor
@CrossOrigin("*")
public class GuestController {
	
	private final GuestService guestService;
	
	@PostMapping("/insertCustomer")
	public ResponseEntity<Customer> insertCustomer(@RequestBody InsertCustomerRequest request) {
		return ResponseEntity.ok(guestService.insertCustomer(request));
	}
}
