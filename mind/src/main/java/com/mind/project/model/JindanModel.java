package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Column;

import com.mind.project.model.entity.Jindan;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class JindanModel {
	
	private Long jindanNum;
	private Long secretNum;
	private String jindanCon;
	private Long jindanConNum;
	private LocalDateTime jindanDate;
	
	public Jindan toEntity() {
		Jindan build = Jindan.builder()
				.secretNum(secretNum)
				.jindanNum(jindanNum)
				.jindanCon(jindanCon)
				.jindanConNum(jindanConNum)
				.build();
		return build;
	}
	
	@Builder
	public JindanModel(Long jindanNum, Long secretNum, String jindanCon, Long jindanConNum, LocalDateTime jindanDate ) {
		this.jindanNum = jindanNum;
		this.secretNum = secretNum;
		this.jindanCon = jindanCon;
		this.jindanConNum = jindanConNum;
		this.jindanDate = jindanDate;
	}

}
