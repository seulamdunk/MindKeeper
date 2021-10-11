package com.mind.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.mind.project.model.KoreaStats;

@Service
public class SituationService {
	
	private static String KOREA_COVID_DATAS_URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13";
	private static String WEATHER_SPECIALREPORT = "https://www.weather.go.kr/w/weather/forecast/short-term.do	";
	
	@PostConstruct
	public List<KoreaStats> getKoreaCovidDatas() throws IOException {
		
		List<KoreaStats> koreaStatsList = new ArrayList<>();
		 
		 Document doc = Jsoup.connect(KOREA_COVID_DATAS_URL).get();
		
		 Elements contents = doc.select("#content > div > div.data_table.midd.mgt24 > table > tbody > tr");
		

		 for(Element content : contents){
			 
	            Elements tdContents = content.select("td");
	            
	            
	            
	            KoreaStats koreaStats = KoreaStats.builder()
	                    .country(content.select("th").text())
	                    .diffFromPrevDay(Integer.parseInt(tdContents.get(0).text().replace(",", "")))
	                    .d_outbreak(Integer.parseInt(tdContents.get(1).text().replace(",", "")))
	                    .o_inflow(Integer.parseInt(tdContents.get(2).text().replace(",", "")))
	                    .total(Integer.parseInt(tdContents.get(3).text().replace(",", "")))
	                    .in_quarantine(Integer.parseInt(tdContents.get(4).text().replace(",", "")))
	                    .q_release(Integer.parseInt(tdContents.get(5).text().replace(",", "")))
	                    .death(Integer.parseInt(tdContents.get(6).text().replace(",", "")))
	                    .incidence(Double.parseDouble(tdContents.get(7).text().replace(",", "").replace("-", "0.0")))
	                    .build();

	            koreaStatsList.add(koreaStats);
	}
		return koreaStatsList;
	}
		
	@PostConstruct
	public void getWeatherTables() throws IOException {
			
		Document doc = Jsoup.connect(WEATHER_SPECIALREPORT).get();
			
		Elements tables = doc.select("body > div.container > section > div > div:nth-child(4) > div:nth-child(2) > section");
		//System.out.println(tables);
		
		for(Element table : tables){
			
			Elements span = table.select("span");
			Elements H = table.select("H4");
			Elements th = table.select("th");
			
			//System.out.println(span);
			
		}
	}
		

	

		
}
	
	
	

