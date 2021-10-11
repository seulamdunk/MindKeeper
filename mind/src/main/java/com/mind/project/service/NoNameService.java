package com.mind.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.mind.project.DTO.NoNameDTO;
import com.mind.project.model.Customer;
import com.mind.project.model.NoName;
import com.mind.project.model.NoNameReply;
import com.mind.project.repository.NoNameReplyRepository;
import com.mind.project.repository.NoNameRepository;

@Service
public class NoNameService {
	@Autowired
	private NoNameRepository noNameRepository;
	
	@Autowired
	private NoNameReplyRepository noNameReplyRepository;
	
	
	// 게시글 작성
	@Transactional
	public void write(NoName noName, Customer customer) {
		noName.setCustomer(customer);
		noNameRepository.save(noName);
	}
	
	// 리스트, 페이징
	@Transactional
	public Page<NoName> no_list(Pageable pageable){
		return noNameRepository.findAll(pageable);
	}
	
	// 게시글 상세보기
	@Transactional
	public NoName n_details(int noNameNum) {
		return noNameRepository.findById(noNameNum)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을수 없습니다.");
				});
		
	}
	
	// 게시글 삭제
	@Transactional
	public void delete(int noNameNum, Customer customer) {
		NoName noName = new NoName();
		noName.setCustomer(customer);
		noNameRepository.deleteById(noNameNum);
	}
	
	// 게시글 수정
	@Transactional
	public void update(NoName noName, Customer customer) {
		noName.getNoNameDate();
		noName.setCustomer(customer);
		noNameRepository.save(noName);
		//해당 함수로 종료시 (service가 종료될때) 트랜젝션이 종료됩니다. 이때 더티체킹 - 자동업되이트가 됨. db flush
	}
	
	//댓글 쓰기
	@Transactional
	public void replyWrite(Customer customer, int NoNameNum, String replyContent) {
		NoName noName = noNameRepository.findById(NoNameNum)
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글쓰기 실패: 게시글 아이디를 찾을수 없습니다.");
				}); //영속화 완료
		
		NoNameReply reply = new NoNameReply();
		reply.setCustomer(customer);
		reply.setNoName(noName);
		reply.setNoNameReplyCon(replyContent);
		System.out.println("replyContent: " + replyContent);
		
		 noNameReplyRepository.save(reply);
		
	}
	// 댓글 삭제
	@Transactional
	public void replyDelete(int noNameNum, Customer customer, int noNameReplyNum) {
		//System.out.println("nonamenum: " + noNameNum);
		NoName noName = new NoName();
		noName.setCustomer(customer);
		
		NoNameReply reply = new NoNameReply();
		reply.setNoNameReplyNum(noNameReplyNum);
		
		//System.out.println("customerNum" + noName.getCustomer());
		noNameReplyRepository.delete(reply);
	}
	
	
	//검색 기능
	@Transactional
	public List<NoNameDTO> searchPosts(String keyword){
		
		List<NoName> noNames = noNameRepository.findByNoNameTitleContainingIgnoreCase(keyword);
		List<NoNameDTO> noNameDTOList = new ArrayList<>();
		if(noNames.isEmpty()) {return noNameDTOList;}
		
		for(NoName noName:noNames) {
			noNameDTOList.add(this.convertEntityToDto(noName));
		}
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
	
	
	
	// 조회수 카운팅 관리자 페이지용
	public List<Object[]> findnoNameCount() {
		return noNameRepository.findnoNameCount();
	}
	
	
//	private static final int BLOCK_PAGE_NUM_COUNT = 5;  // 블럭에 존재하는 페이지 수
//	private static final int PAGE_POST_COUNT = 10;  // 한 페이지에 존재하는 게시글 수
//	
//	public NoNameService(NoNameRepository noNameRepository) {
//		this.noNameRepository = noNameRepository;
//	}
//	
//	@Transactional
//	public int saveNoName(NoNameDTO noNameDTO) {
//		return noNameRepository.save(noNameDTO.toEntity()).getNoNameNum();
//	}
//	
//	@Transactional
//	public List<NoNameDTO> getNoNameList(Integer pageNum){
//		//System.out.println("pageNum service" + pageNum);
//		Page<NoName> page = noNameRepository
//				.findAll(PageRequest.of(pageNum-1, PAGE_POST_COUNT, Sort.by(Sort.Direction.ASC,"noNameDate")));
//		List<NoName> noNames = page.getContent();
//		List<NoNameDTO> noNameDTOList = new ArrayList<>();
//		
//		for(NoName noName : noNames) {
//			noNameDTOList.add(this.convertEntityToDto(noName));
//			//System.out.println(noName);
//		}
//			
//		return noNameDTOList;
//	}
//	
//	@Transactional
//    public int getNoNameCount() {
//        return (int) noNameRepository.count();
//    }
//	
//	public Integer[] getPageList(Integer curPageNum) {
//		Integer[] pageList = new Integer[BLOCK_PAGE_NUM_COUNT];
//		//System.out.println("pageList: " + pageList);
//		// 총 글 개수
//		Double postsTotalCount = Double.valueOf(this.getNoNameCount());
//		//System.out.println("postsTotalCount: " + postsTotalCount);
//		// 총 게시글 수를 기준으로 계산한 마지막 페이지 번호 계산
//		Integer totalLastPageNum = (int)(Math.ceil(postsTotalCount/PAGE_POST_COUNT));
//		//System.out.println("totalLastPageNum: " + totalLastPageNum);
//		// 현재 페이지를 기준으로 블럭의 마지막페이지 번호 계산
//		Integer blockLastPageNum = (totalLastPageNum > curPageNum + BLOCK_PAGE_NUM_COUNT)
//				? curPageNum + BLOCK_PAGE_NUM_COUNT
//				: totalLastPageNum;
//		System.out.println("blockLastPageNum: " + blockLastPageNum);
//		// 페이지 시작 번호 조정
//		curPageNum = (curPageNum<=9) ? 1 : curPageNum - 2;
//		//System.out.println(curPageNum);
//		// 페이지 번호 할당
//		for(int val=curPageNum, idx=0; val<=blockLastPageNum; val++, idx++) {
//			pageList[idx] = val;
//			
//		}
//		
//		
//		
//		return pageList;
//	}
//	
//	
//	
//	
//	
//
//	@Transactional
//	public NoNameDTO getPost(int noNameNum) {
//		
//		Optional<NoName> noNameWrapper = noNameRepository.findById(noNameNum);
//		NoName noName = noNameWrapper.get();
//		
//		NoNameDTO noNameDTO = NoNameDTO.builder()
//				.noNameNum(noName.getNoNameNum())
//				.noNameCount(noName.getNoNameCount())
//				.noNameTitle(noName.getNoNameTitle())
//				.noNameCon(noName.getNoNameCon())
//				.build();
//		
//		return noNameDTO;
//		
//	}
//	
//	
//	@Transactional
//	public void deleteNoName(int noNameNum) {
//		noNameRepository.deleteById(noNameNum);
//	}
//	
//	
//	@Transactional
//	public List<NoNameDTO> searchPosts(String keyword, Pageable pageable){
//		
//		//System.out.println("keyword: " + keyword);
//		List<NoName> noNames = noNameRepository.findByNoNameTitleContainingIgnoreCase(keyword, pageable);
//		//System.out.println("noNames: " + noNames);
//		List<NoNameDTO> noNameDTOList = new ArrayList<>();
//		
//		if(noNames.isEmpty()) {
//
//			return noNameDTOList;
//			
//		}
//		
//		
//		for(NoName noName:noNames) {
//			//System.out.println("noName: " + noName);
//			noNameDTOList.add(this.convertEntityToDto(noName));
//		}
//		//System.out.println("noNameDTOList" + noNameDTOList);
//		return noNameDTOList;
//	}
//	
//	private NoNameDTO convertEntityToDto(NoName noName) {
//		
//		return NoNameDTO.builder()
//				.noNameNum(noName.getNoNameNum())
//				.noNameTitle(noName.getNoNameTitle())
//				.noNameCon(noName.getNoNameCon())
//				.noNameCount(noName.getNoNameCount())
//				.build();
//	}
//	
//	public List<NoNameReply> getReplyList(){
//		return replyRepo.findAll(Sort.by("groupNum").and(Sort.by("NoClass").and(Sort.by("NoNameReplyNum"))));
//	}
}
