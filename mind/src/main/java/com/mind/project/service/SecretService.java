package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.mind.project.model.SecretModel;
import com.mind.project.model.entity.Secret;
import com.mind.project.repository.SecretRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SecretService {

	private final SecretRepository secretRepository;

	@Transactional
	public Long save(SecretModel secretModel) {
		return secretRepository.save(secretModel.toEntity()).getSecretNum();
	}

	@Transactional
	public List<SecretModel> getSecretList(Long customerNum) {
		List<Secret> secrets = secretRepository.findByCustomerNum(customerNum, null);
		List<SecretModel> secretModelList = new ArrayList<>();

		for (Secret secret : secrets) {
			SecretModel secretModel = SecretModel.builder()
					.secretNum(secret.getSecretNum())
					.customerNum(secret.getCustomerNum())
					.secretTitle(secret.getSecretTitle())
					.secretCon(secret.getSecretCon())
					.secretDate(secret.getSecretDate())
					.secretImg(secret.getSecretImg())
					.build();

			secretModelList.add(secretModel);
		}

		return secretModelList;
	}

	
	
	// 페이징
	@Transactional
	public List<SecretModel> getSecretListPage(Long customerNum, Pageable pageable) {
		List<Secret> secrets = secretRepository.findByCustomerNum(customerNum, pageable);
		List<SecretModel> secretModelList = new ArrayList<>();

		for (Secret secret : secrets) {
			SecretModel secretModel = SecretModel.builder()
					.secretNum(secret.getSecretNum())
					.customerNum(secret.getCustomerNum())
					.secretTitle(secret.getSecretTitle())
					.secretCon(secret.getSecretCon())
					.secretDate(secret.getSecretDate())
					.secretImg(secret.getSecretImg())
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
				.secretImg(secret.getSecretImg())
				.jindanCon(secret.getJindanCon()).jindanConNum(secret.getJindanConNum())
				.secretTitle(secret.getSecretTitle()).build();

		return secretModel;
	}

	
	
	/*
	// 캘린더 리스트
	@Transactional
	public SecretModel secretCalendar(secret) {

		Optional<Secret> secretWrapper = secretRepository.findBySecretDate(secretDate);
		Secret secret = secretWrapper.get();

		SecretModel secretCalendar = SecretModel.builder()
				.customerNum(secret.getCustomerNum())
				.secretNum(secret.getSecretNum())
				.secretDate(secret.getSecretDate())
				.secretCon(secret.getSecretCon())
				.jindanCon(secret.getJindanCon())
				.jindanConNum(secret.getJindanConNum())
				.secretTitle(secret.getSecretTitle())
				.build();
		
		return secretCalendar;
	}
	*/
	
	
	// 진단값
	@Transactional
	public List<SecretModel> jindanTotal(Long customerNum) {
		
		List<Secret> secrets = secretRepository.findByCustomerNum(customerNum, null);
		List<SecretModel> jindanList = new ArrayList<>();

		for (Secret secret : secrets) {
			SecretModel secretModel = SecretModel.builder()
					.secretDate(secret.getSecretDate())
					.jindanCon(secret.getJindanCon())
					.jindanConNum(secret.getJindanConNum())
					.build();

			jindanList.add(secretModel);
		}

		return jindanList;
	}

}
