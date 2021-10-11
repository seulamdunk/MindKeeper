package com.mind.project.service;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mind.project.model.Customer;
import com.mind.project.model.Youtube;
import com.mind.project.model.YoutubeLog;
import com.mind.project.model.YoutubeReview;
import com.mind.project.repository.YoutubeLogRepository;
import com.mind.project.repository.YoutubeRepository;
import com.mind.project.repository.YoutubeReviewRepository;

import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("MindGrowService")
public class MindGrowServiceImpl implements MindGrowService {
	@Autowired
	YoutubeRepository youtubeRepository;
	
	@Autowired
	YoutubeLogRepository youtubeLogRep;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	YoutubeReviewRepository youtubeReviewRep;
	
	@Override
	public List<List<Youtube>> getListYoutube() throws Exception {

		List<Youtube> youtubeList = youtubeRepository.findAllByOrderByYoutubeTagDesc();

	
		
		
		ArrayList<String> tagList =new ArrayList<>();
		List<List<Youtube>> resultList = new ArrayList<>();
		
		//태그(검색어)에 따라 정렬
	   for(Youtube youtube: youtubeList) {
		   if (!(tagList.contains(youtube.getYoutubeTag()))) {
			   tagList.add(youtube.getYoutubeTag());
		   }		   
	   }
	   for(String tag:tagList) {
		   List<Youtube> list=new ArrayList<>();
		   for(Youtube youtube: youtubeList) {
			   if(youtube.getYoutubeTag().equals(tag)) {
				   list.add(youtube);
			   }else {
				   continue;
			   }
		   }
		   //섞기
		   Collections.shuffle(list);
		   //20개 꺼내기
		   list=list.subList(0, 20);
		   resultList.add(list);
	   }
	   

		return resultList;
	}
	
	public void savaYoutuveLog(Youtube youtube, Customer customer) {
		
		youtubeLogRep.save(YoutubeLog.builder()
				.youtube(youtube)
				.customer(customer)
				.build()
				);
				
	}

	@Override
	public Youtube getYoutube(int youtubeNum) throws Exception {
		Youtube youtube =youtubeRepository.findByYoutubeNum(youtubeNum);
		return  youtube;
	}

	@Override
	public List<Youtube> getRecommendList(HttpServletRequest request) {
		System.out.println("준비");
		Customer customer = commonService.tokenCustomer(request);
		int lastView;
		List<Integer> yList =new ArrayList<>();
		if (customer.getCustomerNum() ==null) {
			 List<Youtube> list =youtubeRepository.findAllByOrderByYoutubeTagDesc();
			   Collections.shuffle(list);
			   //20개 꺼내기
			   list=list.subList(0, 20);
			   return list;
		}
		//System.out.println("고객체크 완료");
		try {
			lastView = youtubeLogRep.findTop1ByCustomerOrderByYoutubeLogDateDesc(customer).getYoutube().getYoutubeNum();
		}catch (Exception e) {
			 System.out.println(e.toString());
			 List<Youtube> list =youtubeRepository.findAllByOrderByYoutubeTagDesc();
			   Collections.shuffle(list);
			   //20개 꺼내기
			   list=list.subList(0, 20);
			   return list;
			
		}
		
		//System.out.println("로그 체크 완료");
		//String msg = secretModel.getSecretCon();
		
		
		// 소켓통신 시작
		try (Socket client = new Socket()) {
			//System.out.println("통신시작");
			InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 9001);
			// 소켓 접속
			String reciveData;
			client.connect(ipep);
			// 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
			try (OutputStream sender = client.getOutputStream();InputStream receiver = client.getInputStream();) {
				for(int i=0; i<1; i++) {						
				// 전송할 메시지 작성			
				byte[] data = String.valueOf(lastView).getBytes();
				ByteBuffer b = ByteBuffer.allocate(4);
				// byte포맷은 little 앤디언이다
				b.order(ByteOrder.LITTLE_ENDIAN);
				b.putInt(data.length);
				// 데이터 길이 전송
				sender.write(b.array(),0,4);
				// 데이터 전송
				sender.write(data);				
				data = new byte[4];
				// 데이터 길이를 받는다
				receiver.read(data,0,4);
				// ByteBuffer를 통해 little 앤디언 형식으로 데이터 길이를 구한다
				ByteBuffer b1 = ByteBuffer.wrap(data);
				b1.order(ByteOrder.LITTLE_ENDIAN);
				int length = b1.getInt();
				// 데이터 받을 버퍼를 선언한다
				data = new byte[length];
				// 데이터를 받는다
				receiver.read(data, 0, length);				
				// byte형식의 데이터를 string형식으로 변환한다.
				reciveData = new String(data, "UTF-8");		
		        // ex) 이 msg는 ~확률로 무엇입니다. 가 저장되어 있다
		          
		        // 콘솔에 출력한다.
		        //model.addObject("result", msg);
		        //System.out.println("콘솔 결과 확인=========================>" + reciveData);
		        
		        for(String num :reciveData.split("#")) {
		        		yList.add(Integer.parseInt(num));
		        }
		        
				}
			}
		}catch (Throwable e) {
			e.printStackTrace();
			List<Youtube> list =youtubeRepository.findAllByOrderByYoutubeTagDesc();
			   Collections.shuffle(list);
			   //20개 꺼내기
			   list=list.subList(0, 20);
			   return list;
		} // 소켓통신 종료
		List<Youtube> resultList =youtubeRepository.findByYoutubeNumIn(yList);
		Collections.shuffle(resultList);
		return resultList;
	}
	public void insertYoutubeReview(Customer customer, Youtube youtube, String con) {
		youtubeReviewRep.save(YoutubeReview.builder().youtube(youtube).customer(customer).youtubeReviewCon(con).build());
	}

	
	public List<YoutubeReview> viewYoutubeReview(int youtubeNum){
		return youtubeReviewRep.findByYoutubeYoutubeNumOrderByYoutubeReviewDate(youtubeNum);
	}
	
	public void deleteYoutubeReview(YoutubeReview youtubeReview) {
		youtubeReviewRep.delete(youtubeReview);
	}
}
