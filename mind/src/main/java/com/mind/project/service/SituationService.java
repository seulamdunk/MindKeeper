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
import com.mind.project.model.WeatherForecast;
import com.mind.project.model.WeatherMap;

@Service
public class SituationService {
	
	private static String KOREA_COVID_DATAS_URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13";
	private static String WEATHER_URL = "https://www.weather.go.kr/w/weather/warning/list.do";
	private static String WEATHER_MAP_URL = "https://www.nongmin.com/weather/view";
	
	@PostConstruct
	public List<KoreaStats> getKoreaCovidDatas() throws IOException {
		
		List<KoreaStats> koreaStatsList = new ArrayList<>();
		 
		 Document doc = Jsoup.connect(KOREA_COVID_DATAS_URL).get();
		//System.out.println(doc);
		 Elements contents = doc.select("#content > div > div.data_table.midd.mgt24 > table > tbody > tr");
		//System.out.println(contents);
		

		 for(Element content : contents){
			 
	            Elements tdContents = content.select("td");
	            
	            //System.out.println(tdContents);
	            
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

	            //System.out.println("ans ="+koreaStats.toString());
	            koreaStatsList.add(koreaStats);
	}
		return koreaStatsList;
}
	
	@PostConstruct
	public WeatherForecast getWeatherForecastData() throws IOException{
		Document doc = Jsoup.connect(WEATHER_URL).get();
		//System.out.println(doc);
		Elements weathers = doc.select("body > div.container > section > div > div.cont-wrap > div > section");
		//System.out.println(weathers);
		
		
		WeatherForecast weather = WeatherForecast.builder()
				.country(weathers.select("div.cmp-view-announce > span:nth-child(1)").text())
				.day_time(weathers.select("div.cmp-view-announce > span:nth-child(2)").text())
				.title(weathers.select("div.cmp-view-header > h4").text())
				.weather_content(weathers.select("div.cmp-view-content > p").text())
				.build();
		
		//System.out.println(weather);
		
		return weather;
	}
	
	@PostConstruct
	public List<String> getWeatherMap() throws IOException{
		
		List<String> MapList = new ArrayList<>();
		Document doc = Jsoup.connect(WEATHER_MAP_URL).get();
		//System.out.println(doc);
		Elements weatherMaps = doc.select("#divWeather > div.nation_map > div.map_list > a");
		//System.out.println(weatherMap);
		
		for(Element weatherMap : weatherMaps) {
			
			WeatherMap weather_m = WeatherMap.builder()
					.city_weather(weatherMap.select("em").text())
					.build();
			
			//System.out.println(weather_m);
			MapList.add(weather_m.getCity_weather());
			//System.out.println(MapList);
		}
		return MapList;
		

		
	}
	
	
	
}
