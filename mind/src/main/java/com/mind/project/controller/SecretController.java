package com.mind.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Configuration;
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
@Configuration
public class SecretController {

	private final SecretService secretService;
	private final JindanService jindanService;

	// 일기 저장
	@PostMapping("/saveDiary")
	public Long save(@RequestBody SecretModel secretModel) {
		return secretService.save(secretModel);
		//System.out.println("a 확인==================>" + a);
		//return secretService.save(secretModel);
	}
	
	
	
	// 일기 소켓통신
	@RequestMapping("/predictDiary")
	public String predict(SecretModel secretModel) throws IOException { 
		//ModelAndView model = new ModelAndView();
		//model.addObject("secretCon", secretCon);
		JindanModel jindanModel = new JindanModel();
		
		System.out.println("secretCon 확인==============>" + secretModel.getSecretCon());
		System.out.println("secretNum 확인==============>" + secretModel.getSecretNum());
		
		// 소켓통신 시작
		try (Socket client = new Socket()) {
			InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 9000);
			// 소켓 접속
			client.connect(ipep);
			// 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
			try (OutputStream sender = client.getOutputStream();InputStream receiver = client.getInputStream();) {
				for(int i=0; i<1; i++) {

				// 전송할 메시지 작성
				String msg = secretModel.getSecretCon();
				byte[] data = msg.getBytes();
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
		        msg = new String(data, "UTF-8");		
		        // ex) 이 msg는 ~확률로 무엇입니다. 가 저장되어 있다
		          
		        // 콘솔에 출력한다.
		        //model.addObject("result", msg);
		        System.out.println("콘솔 결과 확인=========================>" + msg);
		        System.out.println("콘솔 결과 확인----------------->" + msg.substring(0, 2));
		        System.out.println("콘솔 결과 확인2----------------->" + msg.substring(3, 5));
		        
		        //jindanModel.setCustomerNum(secretModel.getCustomerNum());
		        jindanModel.setJindanCon(msg.substring(0, 2));
		        jindanModel.setJindanConNum(Long.parseLong(msg.substring(3, 5)));
		        jindanModel.setSecretNum(secretModel.getSecretNum());
		        //jindanModel.setJindanDate("2021-10-01");
		        
		        jindanService.saveJindan(jindanModel);
				}
			}
		}catch (Throwable e) {
			e.printStackTrace();
			
		} // 소켓통신 종료
		return "/admin/myPage";
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
	
	/*
	 * // 비밀일기 결과 불러오기
	 * 
	 * @RequestMapping("/resultDiary")
	 * 
	 * @ResponseBody public List<Jindan> resultDiary(@RequestBody Long secretNum,
	 * Long jindanNum) {
	 * //System.out.println("확인=========\n\n\n"+secretNum.substring(1,
	 * (secretNum.length()-1))); System.out.println("확인=========\n\n\n"+secretNum);
	 * //String secretNum2 = secretNum.substring(1, (secretNum.length()-1));
	 * 
	 * List<Jindan> jindanModel = jindanService.getJindan(secretNum, jindanNum);
	 * 
	 * //model.addAttribute("jindan", jindanModel);
	 * 
	 * //System.out.println("컨트롤러확인" + jindanModel.getJindanCon());
	 * //System.out.println("컨트롤러확인" + jindanModel.getJindanConNum());
	 * 
	 * 
	 * return jindanModel; }
	 */
	
	
	/*
	 * // 캘린더 비밀일기 결과 값 가져오기
	 * 
	 * @RequestMapping("/getColor")
	 * 
	 * @ResponseBody public JindanModel getColor(@RequestBody String jindanDate) {
	 * System.out.println("확인=========\n\n\n" + jindanDate );
	 * 
	 * String jindanDate2 = jindanDate.substring(1, (jindanDate.length()-1));
	 * 
	 * JindanModel jindanModel = jindanService.getColor(jindanDate2);
	 * System.out.println("확인=========\n\n\n"+jindanModel.getJindanDate());
	 * 
	 * return jindanModel;
	 * 
	 * }
	 */
	
}
