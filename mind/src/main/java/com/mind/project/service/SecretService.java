package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.mind.project.model.SecretModel;
import com.mind.project.model.entity.Secret;
import com.mind.project.repository.JindanRepository;
import com.mind.project.repository.SecretRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecretService { 
	
	private final SecretRepository secretRepository;
	
	@Transactional
	public Long save(SecretModel secretModel) {
		return secretRepository.save(secretModel.toEntity()).getCustomerNum();
	}
	
	@Transactional
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public List<SecretModel> getSecretList() {
		List<Secret> secrets = secretRepository.findAll();
		List<SecretModel> secretModelList = new ArrayList<>();
		
		for (Secret secret : secrets) {
			SecretModel secretModel = SecretModel.builder()
					.secretNum(secret.getSecretNum())
					.customerNum(secret.getCustomerNum())
					.secretTitle(secret.getSecretTitle())
					.secretCon(secret.getSecretCon())
					.secretDate(secret.getSecretDate())
					.build();
			
			secretModelList.add(secretModel);
		}
		
		return secretModelList;
	}
	
	// 비밀일기 뷰페이지
	@Transactional
	public SecretModel getPost(Long secretNum) {
		
		Optional<Secret> secretWrapper = secretRepository.findById(secretNum);
		Secret secret = secretWrapper.get();
		
		SecretModel secretModel = SecretModel.builder()
				.customerNum(secret.getCustomerNum())
				.secretNum(secret.getSecretNum())
				.secretDate(secret.getSecretDate())
				.secretCon(secret.getSecretCon())
				.secretTitle(secret.getSecretTitle())
				.build();
		
		return secretModel;
	}
}
