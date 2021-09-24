package com.mind.project.service;

import org.springframework.stereotype.Service;

import com.mind.project.repository.MindTalkRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

	private final MindTalkRepository mindTalkRepository;
	
}
