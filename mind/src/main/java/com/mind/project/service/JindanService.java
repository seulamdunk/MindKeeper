package com.mind.project.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.mind.project.model.JindanModel;
import com.mind.project.model.entity.Jindan;
import com.mind.project.repository.JindanRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JindanService {
	
	private final JindanRepository jindanRepository;
	
	@Transactional
	public JindanModel getJindan(String secretNum2) {
		
		Long secretNum = Long.parseLong(secretNum2);
		System.out.println("1");
		Optional<Jindan> jindanWrapper = jindanRepository.findBySecretNum(secretNum);
		Jindan jindan = jindanWrapper.get();
		System.out.println("2");
		JindanModel jindanModel = JindanModel.builder()
				.secretNum(jindan.getSecretNum())
				.jindanCon(jindan.getJindanCon())
				.jindanConNum(jindan.getJindanConNum())
				.build();
		System.out.println("3");
		System.out.println("서비스확인");
		
		return jindanModel;
				
	}

}
