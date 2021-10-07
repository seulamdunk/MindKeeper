
package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.PrePersist;

import com.mind.project.model.entity.Secret;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class SecretModel {
	
	private Long secretNum;
	private String secretTitle;
	private String secretCon;
	private Long customerNum;
	private String jindanCon;
	private Long jindanConNum;
	private String secretImg;
	private LocalDateTime secretDate;
	
	public Secret toEntity() {
		Secret build =  Secret.builder()
				.secretTitle(secretTitle)
				.secretCon(secretCon)
				.customerNum(customerNum)
				.jindanCon(jindanCon)
				.secretImg(secretImg)
				.jindanConNum(jindanConNum)
				.build();
		return build;
	}
	
	@Builder
	public SecretModel(Long secretNum, String secretTitle, String secretCon, Long customerNum,
			LocalDateTime secretDate, String jindanCon, String secretImg, Long jindanConNum) {
		super();
		this.secretNum = secretNum;
		this.secretTitle = secretTitle;
		this.secretCon = secretCon;
		this.customerNum = customerNum;
		this.jindanCon = jindanCon;
		this.secretImg = secretImg;
		this.jindanConNum = jindanConNum;
		this.secretDate = secretDate;
	}


	
	
    
    
   
    
    
}
