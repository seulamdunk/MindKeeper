package com.mind.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mind.project.model.SecretModel;
import com.mind.project.service.SecretService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class SecretController {

	private final SecretService secretService;

	// 일기 저장
	@PostMapping("/saveDiary")
	public Long save(@RequestBody SecretModel secretModel) {
		return secretService.save(secretModel);
	}
	
	// 일기 소켓통신
	@RequestMapping("/predictDiary")
	public ModelAndView predict(String secretCon) throws IOException {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("secretCon", secretCon);
		// 파이썬과 통신하기 위해 웹 소켓 선언
	      
	      Socket socket = new Socket("localhost", 2222);
	      
	      // 데이터 전송을 보낼 output 선언
	      OutputStream output = socket.getOutputStream();
	      
	      // 나중에 userID로 전송 예쩡
	      
	      byte[] data = secretCon.getBytes(); //getBytes() 메서드를 사용 해 문자열을 Byte로 바꿔준다
	      output.write(data);
	      
	      // 데이터 전송을 받을 input 선언
	      
	      InputStream input = socket.getInputStream();
	      
	      BufferedReader reader = new BufferedReader(new InputStreamReader(input));
	           
	      // 소켓 연결 종료
	      model.addObject(reader.readLine());
	      socket.close();

	      model.setViewName("secretDiaryView");
	      return model;
	}
	

	@GetMapping("/myPage")
	public Model list(Model model) {
		List<SecretModel> secretModelList = secretService.getSecretList();
		model.addAttribute("secretList", secretModelList);
		return model;
	}
}
