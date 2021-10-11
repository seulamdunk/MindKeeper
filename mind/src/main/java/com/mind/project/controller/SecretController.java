package com.mind.project.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mind.project.config.security.JwtTokenProvider;
import com.mind.project.model.Customer;
import com.mind.project.model.MindTalk;
import com.mind.project.model.SecretModel;
import com.mind.project.model.Youtube;
import com.mind.project.repository.CustomerRepository;
import com.mind.project.service.CommonService;
import com.mind.project.service.MindTalkService;
import com.mind.project.service.SecretService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Configuration
public class SecretController {

	@Autowired
	private final SecretService secretService;
	@Autowired
	private final CommonService commonService;
	@Autowired
	private final JwtTokenProvider jwtTokenProvider;
	@Autowired
	private final CustomerRepository customerRep;
	@Autowired
	private final MindTalkService mindTalkService;

	// 마이페이지
	@RequestMapping(value = "/myPage")
	@ResponseBody
	public Model mypage(HttpServletRequest request, Model model) throws Exception {
		
		
		Optional<Customer> customerOption= customerRep.findByCustomerID(SecurityContextHolder.getContext().getAuthentication().getName());
		Customer customer = customerOption.get();
		
		commonService.tokenImfo(model, request);
		
		//System.out.println("마이페이지 customerNum확인-------" + customerNum);
		List<SecretModel> secretModelList = secretService.jindanTotal(Long.parseLong(String.valueOf(customer.getCustomerNum())));
		
		
		if(secretModelList != null) {
			Long jindanConNumTotal = (long) 0;
			
			for(int i=0; i<secretModelList.size(); i++) {
				System.out.println("리스트확인========="+secretModelList.get(i).getJindanConNum());
				jindanConNumTotal += secretModelList.get(i).getJindanConNum();
				
				String jindanTotal = Long.toString(jindanConNumTotal/secretModelList.size());
				model.addAttribute("jindanTotal", jindanTotal);
			}
		}
//		for(int i=0; i<secretModelList.size(); i++) {
//			System.out.println("리스트확인========="+secretModelList.get(i).getJindanConNum());
//			jindanConNumTotal += secretModelList.get(i).getJindanConNum();
//		}
		//System.out.println("토탈확인========="+ jindanConNumTotal);
		//System.out.println("평균확인========="+ (jindanConNumTotal/secretModelList.size()));
		
		//String jindanTotal = Long.toString(jindanConNumTotal/secretModelList.size());
		
		// 좋아요 누른 게시글 가져오기 =======================================================
		//MindTalk mindTalk = secretService.likeMindTalk(customer.getCustomerNum());
		//model.addAttribute("likeMind", mindTalk);
		
		// 글목록 불러오기
		List<SecretModel> mypageList = secretService.getSecretList(Long.parseLong(String.valueOf(customer.getCustomerNum())));
		
		model.addAttribute("mypageList", mypageList);
		System.out.println(LocalDateTime.now());

		return model;
	}

	// 비밀일기 작성 페이지
	@RequestMapping(value = "/secretDiaryWrite")
	public Model secretDiaryWrite(Model m, HttpServletRequest request) {

		System.out.println("security check==============" + request.getCookies());
		m.addAttribute("user", commonService.tokenCustomer(request));

		return m;

	}

	// 일기 저장
	@PostMapping("/saveDiary")
	@ResponseBody
	public Long save(@RequestBody SecretModel secretModel, HttpServletRequest request, Model model) {

		// 소켓통신 시작
		try (Socket client = new Socket()) {
			InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 9000);
			// 소켓 접속
			client.connect(ipep);
			// 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
			try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {
				// for (int i = 0; i < 1; i++) {

				// 전송할 메시지 작성
				String msg = secretModel.getSecretCon();
				byte[] data = msg.getBytes();
				ByteBuffer b = ByteBuffer.allocate(4);
				// byte포맷은 little 앤디언이다
				b.order(ByteOrder.LITTLE_ENDIAN);
				b.putInt(data.length);
				// 데이터 길이 전송
				sender.write(b.array(), 0, 4);
				// 데이터 전송
				sender.write(data);

				data = new byte[4];
				// 데이터 길이를 받는다
				receiver.read(data, 0, 4);
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

				secretModel.setJindanCon(msg.substring(0, 2));
				secretModel.setJindanConNum(Long.parseLong(msg.substring(3, 5)));
				model.addAttribute("user", commonService.tokenCustomer(request));
				
				// }
			}
		} catch (Throwable e) {
			e.printStackTrace();

		} // 소켓통신 종료

		return secretService.save(secretModel);

	}

	
	// 비밀일기 목록 =============================================================================================
	@RequestMapping("/secretDiaryList")
	public Model list(Model model, HttpServletRequest request, @PageableDefault(size = 6, sort = "secretDate", direction = Sort.Direction.DESC) Pageable pageable){
		
		Customer customer = commonService.tokenCustomer(request);
		model.addAttribute("user", commonService.tokenCustomer(request));
		
		System.out.println("널확인========" + customer.getCustomerNum());
		Long customerNum = Long.parseLong(String.valueOf(customer.getCustomerNum()));
		// String customerNum2 = customerNum.substring(1, customerNum.length()-1);
		// System.out.println("2확인=========" + Long.parseLong(customerNum2));
		
		List<SecretModel> secretModelList = secretService.getSecretListPage(customerNum, pageable);

		
		model.addAttribute("secretList", secretModelList);
		return model;
	}

	
	// 해당 비밀일기 뷰페이지 ================================================================================================
	@RequestMapping("/secretDiaryView")
	public Model diaryView(Long secretNum, Model model, HttpServletRequest request) {

		SecretModel secretModel = secretService.getPost(secretNum);

		model.addAttribute("secretModel", secretModel);
		model.addAttribute("user", commonService.tokenCustomer(request));
		
		List<Youtube> youtubeList = secretService.getYoutubeList();
		model.addAttribute("youtube", youtubeList);

		return model;

	}
	
	
	// 캘린더
	@RequestMapping(value="/secretCalendar2")
	@ResponseBody
	public Model secretCalendar(Model model, HttpServletRequest request) {
		
		Customer customer = commonService.tokenCustomer(request);
		System.out.println("날짜확인=========>"+ customer.getCustomerNum());
		
		// 캘린더 값 가져오기
		List<SecretModel> secretCalendar2 = secretService.jindanTotal(Long.parseLong(String.valueOf(customer.getCustomerNum())));
		
		model.addAttribute("user", commonService.tokenCustomer(request));
		model.addAttribute("calendar", secretCalendar2);
		
		return model;
	}
	
	
	


}
