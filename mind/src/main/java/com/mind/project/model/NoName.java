package com.mind.project.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name="noname")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class NoName {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name="no_name_num")
	private Long noNameNum;
	
	@Column(name="customer_num")
	private int customerNum;
	
	@Column(name="no_name_title")
	private String noNameTitle;
	
	@Column(name="no_name_con")
	private String noNameCon;
	
	@Column(name="no_name_count")
	private int noNameCount;
	
	@Column(name="no_name_date")
	private LocalDateTime noNameDate;
	
	@Column(name="no_name_updatedate")
	private LocalDateTime noNameUpdatedate;
	
	
	@Builder
	public NoName(Long noNameNum, int customerNum, String noNameTitle, int noNameCount,  String noNameCon) {
		this.noNameNum = noNameNum;
		this.customerNum = customerNum;
		this.noNameTitle = noNameTitle;
		this.noNameCon = noNameCon;
		this.noNameCount = noNameCount;
		this.noNameDate = LocalDateTime.now();
		this.noNameUpdatedate = LocalDateTime.now();
	}
	
	
	
}
