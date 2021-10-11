package com.mind.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mind.project.model.Customer;
import com.mind.project.model.Youtube;
import com.mind.project.model.YoutubeReview;

public interface MindGrowService {

	
	public List<List<Youtube>> getListYoutube() throws Exception; 
	public Youtube getYoutube(int youtubeNum) throws Exception;
	public void savaYoutuveLog(Youtube youtube, Customer customer) throws Exception;
	public List<Youtube> getRecommendList(HttpServletRequest request);
	public void insertYoutubeReview(Customer customer, Youtube youtube, String con);
	public List<YoutubeReview> viewYoutubeReview(int youtubeNum);
	public void deleteYoutubeReview(YoutubeReview youtubeReview);
}
