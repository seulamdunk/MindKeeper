package com.mind.project.model;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@ToString
@Builder
@Data
public class WeatherForecast {
	
	private String country;
	private String day_time;
	private String title;
	private String weather_content;
	
	

}
