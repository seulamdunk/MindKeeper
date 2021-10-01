package com.mind.project.service;

import java.util.List;
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
	public List getJindan(Long secretNum, Long jindanNum) {
		
		//Long secretNum = Long.parseLong(secretNum2);
		List<Jindan> jindanWrapper = jindanRepository.findBySecretNumAndJindanNum(secretNum, jindanNum);
		/*Jindan jindan = jindanWrapper.get();
		
		JindanModel jindanModel = JindanModel.builder()
				.secretNum(jindan.getSecretNum())
				.jindanCon(jindan.getJindanCon())
				.jindanConNum(jindan.getJindanConNum())
				.jindanDate(jindan.getJindanDate())
				.build();
*/
		return jindanWrapper;
				
	}
	
	
	/*
	 * @Transactional public JindanModel getColor(String jindanDate) {
	 * 
	 * //Long secretNum = Long.parseLong(secretNum2); Optional<Jindan> jindanWrapper
	 * = jindanRepository.findByJindanDate(jindanDate); Jindan jindan =
	 * jindanWrapper.get();
	 * 
	 * JindanModel jindanModel = JindanModel.builder()
	 * .secretNum(jindan.getSecretNum()) .jindanCon(jindan.getJindanCon())
	 * .jindanConNum(jindan.getJindanConNum()) .jindanDate(jindan.getJindanDate())
	 * .build();
	 * 
	 * return jindanModel;
	 * 
	 * }
	 */
	
	
	// 진단 결과 저장하기
	@Transactional
	public void saveJindan(JindanModel jindanModel) {
		jindanRepository.save(jindanModel.toEntity());
		//jindanRepository.save(Jindan.builder().jindanCon(jindanCon).jindanConNum(Long.parseLong(jindanConNum)).build());
	}
	

}
