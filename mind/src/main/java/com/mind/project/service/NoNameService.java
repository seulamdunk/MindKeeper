package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.mind.project.DTO.NoNameDTO;
import com.mind.project.model.NoName;
import com.mind.project.repository.NoNameRepository;

@Service
public class NoNameService {
	
	private NoNameRepository noNameRepository;
	private static final int BLOCK_PAGE_NUM_COUNT = 5;  // 블럭에 존재하는 페이지 수
	private static final int PAGE_POST_COUNT = 18;  // 한 페이지에 존재하는 게시글 수
	
	public NoNameService(NoNameRepository noNameRepository) {
		this.noNameRepository = noNameRepository;
	}
	
	@Transactional
	public Long saveNoName(NoNameDTO noNameDTO) {
		return noNameRepository.save(noNameDTO.toEntity()).getNoNameNum();
	}
	
	@Transactional
	public List<NoNameDTO> getNoNameList(Integer pageNum){
		//System.out.println("pageNum service" + pageNum);
		Page<NoName> page = noNameRepository
				.findAll(PageRequest.of(pageNum-1, PAGE_POST_COUNT, Sort.by(Sort.Direction.ASC,"noNameDate")));
		List<NoName> noNames = page.getContent();
		List<NoNameDTO> noNameDTOList = new ArrayList<>();
		
		for(NoName noName : noNames) {
			noNameDTOList.add(this.convertEntityToDto(noName));
			//System.out.println(noName);
		}
			
		return noNameDTOList;
	}
	
	@Transactional
    public Long getNoNameCount() {
        return noNameRepository.count();
    }
	
	public Integer[] getPageList(Integer curPageNum) {
		Integer[] pageList = new Integer[BLOCK_PAGE_NUM_COUNT];
		//System.out.println("pageList: " + pageList);
		// 총 글 개수
		Double postsTotalCount = Double.valueOf(this.getNoNameCount());
		//System.out.println("postsTotalCount: " + postsTotalCount);
		// 총 게시글 수를 기준으로 계산한 마지막 페이지 번호 계산
		Integer totalLastPageNum = (int)(Math.ceil(postsTotalCount/PAGE_POST_COUNT));
		//System.out.println("totalLastPageNum: " + totalLastPageNum);
		// 현재 페이지를 기준으로 블럭의 마지막페이지 번호 계산
		Integer blockLastPageNum = (totalLastPageNum > curPageNum + BLOCK_PAGE_NUM_COUNT)
				? curPageNum + BLOCK_PAGE_NUM_COUNT
				: totalLastPageNum;
		System.out.println("blockLastPageNum: " + blockLastPageNum);
		// 페이지 시작 번호 조정
		curPageNum = (curPageNum<=9) ? 1 : curPageNum - 2;
		//System.out.println(curPageNum);
		// 페이지 번호 할당
		for(int val=curPageNum, idx=0; val<=blockLastPageNum; val++, idx++) {
			pageList[idx] = val;
			
		}
		
		
		
		return pageList;
	}
	
	
	
	
	

	@Transactional
	public NoNameDTO getPost(Long noNameNum) {
		
		Optional<NoName> noNameWrapper = noNameRepository.findById(noNameNum);
		NoName noName = noNameWrapper.get();
		
		NoNameDTO noNameDTO = NoNameDTO.builder()
				.noNameNum(noName.getNoNameNum())
				.noNameCount(noName.getNoNameCount())
				.noNameTitle(noName.getNoNameTitle())
				.noNameCon(noName.getNoNameCon())
				.build();
		
		return noNameDTO;
		
	}
	
	
	@Transactional
	public void deleteNoName(Long noNameNum) {
		noNameRepository.deleteById(noNameNum);
	}
	
	
	@Transactional
	public List<NoNameDTO> searchPosts(String keyword){
		
		//System.out.println("keyword: " + keyword);
		List<NoName> noNames = noNameRepository.findByNoNameTitleContainingIgnoreCase(keyword);
		//System.out.println("noNames: " + noNames);
		List<NoNameDTO> noNameDTOList = new ArrayList<>();
		
		if(noNames.isEmpty()) {

			return noNameDTOList;
			
		}
		
		
		for(NoName noName:noNames) {
			//System.out.println("noName: " + noName);
			noNameDTOList.add(this.convertEntityToDto(noName));
		}
		//System.out.println("noNameDTOList" + noNameDTOList);
		return noNameDTOList;
	}
	
	private NoNameDTO convertEntityToDto(NoName noName) {
		
		return NoNameDTO.builder()
				.noNameNum(noName.getNoNameNum())
				.noNameTitle(noName.getNoNameTitle())
				.noNameCon(noName.getNoNameCon())
				.noNameCount(noName.getNoNameCount())
				.build();
		
	}
	
//	@Transactional
//	public int updateCount(Long noNameNum) {
//		System.out.println(noNameNum);
//		return noNameRepository.updateCount(noNameNum);
//	}

}
