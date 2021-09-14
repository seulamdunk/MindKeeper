package com.mind.project.model.request;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class InsertCustomerRequest {
	private String customerID;
	private String customerPW;
	private String customerName;
	private String identityNum;
	private String phoneNum;
	private String CustomerNick;
}