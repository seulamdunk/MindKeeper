package com.mind.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mind.project.model.JindanModel;
import com.mind.project.model.SecretModel;
import com.mind.project.service.JindanService;
import com.mind.project.service.SecretService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class SecretController {

	private final SecretService secretService;
	private final JindanService jindanService;

	// 일기 저장
	@PostMapping("/saveDiary")
	public Long save(@RequestBody SecretModel secretModel) {
		return secretService.save(secretModel);
	}
	
	// 일기 소켓통신
	@RequestMapping("/predictDiary")
	public ModelAndView predict(String secretCon, String customerNum) throws IOException {
		
		
		ModelAndView model = new ModelAndView();
		String predict =secretCon +"#"+customerNum;
		model.addObject("predict", predict);
		// 파이썬과 통신하기 위해 웹 소켓 선언
	      
	      Socket socket = new Socket("localhost", 2222);
	      
	      // 데이터 전송을 보낼 output 선언
	      OutputStream output = socket.getOutputStream();
	      
	      // 나중에 userID로 전송 예쩡
	      
	      byte[] data = predict.getBytes();//getBytes() 메서드를 사용해 문자열을 Byte로 바꿔준다
	      output.write(data);
	      
	      // 데이터 전송을 받을 input 선언
	      
	      InputStream input = socket.getInputStream();
	      
	      BufferedReader reader = new BufferedReader(new InputStreamReader(input));
	           
	      // 소켓 연결 종료
	      model.addObject(reader.readLine());
	      //socket.close();

	      model.setViewName("secretDiaryView");
	      return model;
	}
	
	// 비밀일기 목록
	@GetMapping("/myPage")
	public Model list(Model model) {
		List<SecretModel> secretModelList = secretService.getSecretList();
		model.addAttribute("secretList", secretModelList);
		return model;
	}
	
	// 해당 비밀일기 뷰페이지
	@RequestMapping("/secretDiaryView")
	public Model diaryView(Long secretNum, Model model) {
		
		SecretModel secretModel = secretService.getPost(secretNum);
		
		model.addAttribute("secretModel", secretModel);
		
		return model;
		
	}
	
	// 비밀일기 결과 불러오기
	@RequestMapping("/resultDiary")
	@ResponseBody
	public JindanModel resultDiary(@RequestBody String secretNum) {
		System.out.println("확인=========\n\n\n"+secretNum.substring(1, (secretNum.length()-1)));
		//System.out.println("확인=========\n\n\n"+secretNum.get("secretNum"));
		String secretNum2 = secretNum.substring(1, (secretNum.length()-1));
		
		JindanModel jindanModel = jindanService.getJindan(secretNum2);
		
		//model.addAttribute("jindan", jindanModel);
		
		System.out.println("컨트롤러확인" + jindanModel.getJindanCon());
		System.out.println("컨트롤러확인" + jindanModel.getJindanConNum());
		
		
		return jindanModel;
	}
	
}
