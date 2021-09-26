package com.mind.project.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name="noname")
@EqualsAndHashCode(of = "no_name_num")
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AnonymousBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long no_name_num;
	private int customer_num;
	private String no_name_title;
	private String no_name_con;
	private String no_name_count;
	
	@CreationTimestamp
	private Timestamp no_name_date;
	
	@UpdateTimestamp
	private Timestamp no_name_updatedate;
	
	
}
