package com.mind.project.model;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@ToString
@Builder
@Data
public class KoreaStats {
	
	private String country;				// 시도명
	private int diffFromPrevDay;		// 전날 대비 증가량
	private int d_outbreak;				// 국내 발생
	private int o_inflow;				// 해외유입
	private int total;					// 코로나 환자수
	private int in_quarantine;			// 격리중
	private int q_release;				// 격리해제
	private int death;					// 사망자 수
	private double incidence;			// 발병률

	

}
