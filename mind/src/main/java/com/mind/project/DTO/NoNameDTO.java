package com.mind.project.DTO;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

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
	
	private Long noNameNum;
	private int customerNum;
	private String noNameTitle;
	private String noNameCon;
	private int noNameCount;
	
	private LocalDateTime noNameDate;
	
	private LocalDateTime noNameUpdatedate;
	
	//private String no_name_date;
	
	
	
	public NoName toEntity() {
		NoName noName = NoName.builder()
				.noNameNum(noNameNum)
				.customerNum(customerNum)
				.noNameTitle(noNameTitle)
				.noNameCon(noNameCon)
				.noNameCount(noNameCount)
				.build();
		return noName;
	}
	
	@Builder
	public NoNameDTO(Long noNameNum, int customerNum, String noNameTitle, String noNameCon, int noNameCount) {
		this.noNameNum = noNameNum;
		this.customerNum = customerNum;
		this.noNameTitle = noNameTitle;
		this.noNameCon = noNameCon;
		this.noNameCount = noNameCount;
		this.noNameDate = LocalDateTime.now();
		this.noNameUpdatedate = LocalDateTime.now();
		
	}
}
