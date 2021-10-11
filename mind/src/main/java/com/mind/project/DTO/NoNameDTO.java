package com.mind.project.DTO;

import java.time.LocalDateTime;

import com.mind.project.model.Customer;
import com.mind.project.model.NoName;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class NoNameDTO {
	
	private int noNameNum;
	private Customer customer;
	private String noNameTitle;
	private String noNameCon;
	private int noNameCount;
	
	private LocalDateTime noNameDate;
	
	//private LocalDateTime noNameUpdatedate;
	
	//private String no_name_date;
	
	
	
	public NoName toEntity() {
		NoName noName = NoName.builder()
				.noNameNum(noNameNum)
				.customer(customer)
				.noNameTitle(noNameTitle)
				.noNameCon(noNameCon)
				.noNameCount(noNameCount)
				.build();
		return noName;
	}
	
	@Builder
	public NoNameDTO(int noNameNum, Customer customer, String noNameTitle, String noNameCon, int noNameCount) {
		this.noNameNum = noNameNum;
		this.customer = customer;
		this.noNameTitle = noNameTitle;
		this.noNameCon = noNameCon;
		this.noNameCount = noNameCount;
		this.noNameDate = LocalDateTime.now();
		
	}
}
