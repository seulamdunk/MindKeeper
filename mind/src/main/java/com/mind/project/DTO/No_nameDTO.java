package com.mind.project.DTO;

import java.sql.Timestamp;

import com.mind.project.model.AnonymousBoard;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class No_nameDTO {
	
	private Long no_name_num;
	private int customer_num;
	private String no_name_title;
	private String no_name_con;
	private String no_name_count;
	private Timestamp no_name_date;
	private Timestamp no_name_updatedate;
	
//	public AnonymousBoard toEntity() {
//		AnonymousBoard aBoard = AnonymousBoard.builder()
//				.no_name_num(no_name_num)
//				.customer_num(customer_num)
//				.no_name_title(no_name_title)
//				.no_name_con(no_name_con)
//				.no_name_count(no_name_count)
//				.build();
//		return aBoard;
//	}
}
