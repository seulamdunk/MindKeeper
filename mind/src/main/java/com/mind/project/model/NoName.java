package com.mind.project.model;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Table(name="noname")
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
public class NoName {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="no_name_num")
	private int noNameNum;
	
	@ManyToOne
	@JoinColumn(name="customer_num")
	private Customer customer;
	
	@Column(name="no_name_title")
	private String noNameTitle;
	
	@Column(name="no_name_con")
	private String noNameCon;
	
	@ColumnDefault("0")
	@Column(name="no_name_count")
	private int noNameCount;
	
	@CreationTimestamp
	@Column(name="no_name_date")
	private LocalDateTime noNameDate;
	
	@OneToMany(mappedBy = "noName", fetch = FetchType.LAZY)
	@JsonIgnoreProperties({"noName"})
	@OrderBy("noNameReplyDate desc")
	private List<NoNameReply> noNameReply;
	
	
	
	
	
}
