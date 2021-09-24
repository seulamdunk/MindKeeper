
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
	private LocalDateTime secretDate;
	
	public Secret toEntity() {
		Secret build =  Secret.builder()
				.secretTitle(secretTitle)
				.secretCon(secretCon)
				.customerNum(customerNum)
				.build();
		return build;
	}
	
	@Builder
	public SecretModel(Long secretNum, String secretTitle, String secretCon, Long customerNum,
			LocalDateTime secretDate) {
		super();
		this.secretNum = secretNum;
		this.secretTitle = secretTitle;
		this.secretCon = secretCon;
		this.customerNum = customerNum;
		this.secretDate = secretDate;
	}


	
	
    
    
   
    
    
}
