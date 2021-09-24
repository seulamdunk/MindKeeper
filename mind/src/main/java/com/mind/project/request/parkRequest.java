package com.mind.project.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class parkRequest {
	
	private int park_Num;
	private String park_Name;
	private float park_Wido;
	private float park_Gyungdo;
}
