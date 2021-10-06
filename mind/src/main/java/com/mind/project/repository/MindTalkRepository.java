package com.mind.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.MindTalk;

public interface MindTalkRepository extends JpaRepository<MindTalk, Integer> {

	//게시글 조회
	@Query(value="select talk_num,customerid,talk_con,talk_date,talk_cnt from mindtalk "
			+ "left join customer on mindtalk.customer_num=customer.customer_num ",nativeQuery=true)
	public List<Object[]> findMindtalk();
	
	//일별 게시글 수
	@Query(value="select count(*) as date from mindtalk "
			+ "where date(talk_date)=date(now()) "
			+ "group by date(talk_date)",nativeQuery=true)
	Integer countMindtalk();
	
	@Query(value="select tag from mindtalk",nativeQuery=true)
	public List<Object> findTag();
	
	//회원 작성한 게시글 수
	@Query(value="select count(*) from mindtalk group by customer_num having customer_num=:num ",nativeQuery=true)
	Integer customerTalkCount(int num);	

	
	Page<MindTalk> findAllByOrderByTalkDateDesc(Pageable pageable);

	
	//게시글 삭제
	 @Transactional
	public void deleteByTalkNum(int talkNum);
	 
	 
	public  MindTalk findByTalkNum(int talkNum);
	
	//고객 게시물 검색
	Page<MindTalk> findAllByCustomerCustomerNumOrderByTalkDateDesc(int customerNum, Pageable pageable);
}
