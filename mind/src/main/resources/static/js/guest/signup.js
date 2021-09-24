// 회원가입

//아이디 중복 검사
var idFlag = false ;
document.getElementById("customerID").addEventListener("focusout", ()=>{	
	
	// 아이디 값 4자 이상 12자 이하일때 ajax  
	var customerID=$('#customerID').val()
	if(customerID.length>=4 && customerID.length<=12){
		
	$.ajax({
		type:"post",
		url:"idCheck/"+customerID,
		success:function(result){
			if(result){
				$('#idCheckresult').text("이미 사용중인 아이디 입니다.");
				idFlag=false;
			}else{
				$('#idCheckresult').text("사용 가능한 아이디 입니다.");
				idFlag=true;
			}
		},
		error:function(err){
		}	
	}) //end ajax

	}//end if
		
})

//닉네임 중복 검사
var nickFlag = false ;
document.getElementById("customerNick").addEventListener("focusout", ()=>{	
	
	// 아이디 값 4자 이상 12자 이하일때 ajax  
	var customerNick=$('#customerNick').val()
	if(customerNick.length>=4 && customerNick.length<=30){
		
	$.ajax({
		type:"post",
		url:"nickCheck/"+customerNick,
		success:function(result){
			if(result){
				$('#nickCheckresult').text("이미 사용중인 닉네임 입니다.");
				nickFlag=false;
			}else{
				$('#nickCheckresult').text("사용 가능한 닉네임입니다.");
				nickFlag=true;
			}
		},
		error:function(err){
		}	
	}) //end ajax

	}//end if
		
})

function signup(){
	var customerID=$('#customerID').val()
	var customerPW=$('#customerPW').val()
	var customerPWR=$('#customerPWR').val()
	var customerName=$('#customerName').val()
	var customerNick=$('#customerNick').val()
	var identityNum=$('#identityNum').val()
	var phoneNum=$('#phoneNum').val()	
	var params={customerID:customerID,
				customerPW:customerPW,
				customerName:customerName,
				identityNum:identityNum,
				customerNick:customerNick,
				phoneNum:phoneNum
				} // json 파일
				
	//아이디 검사
	var cidCheck = /^[a-z0-9]{4,12}$/;
	//휴대폰번호 검사
	var cphoneCheck =  /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
	//패스워드 검사
	var cpwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
	// 아이디 
	if(customerID==""){
		alert("아이디를 입력하세요.")
		$('#customerID').focus();
		return false;
	} 
	if(!cidCheck.test(customerID)){
		alert("아이디는 4~12자의 영문 소문자, 숫자만 사용 가능합니다.")
		$('#customerID').focus();		
		return false;
	}
	if(idFlag == false){
		alert("아이디 중복을 확인하세요.")
		$('#customerID').focus();
		return false;
	}
	

	
	// 비밀번호
	if(customerPW==""){
		alert("비밀번호를 입력하세요.")
		$('#customerPW').focus();
		return false;
	}
	if(!cpwCheck.test(customerPW)){
		alert("비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. ")
		$('#customerPW').focus();
		return false;
	}

	if(customerPW!=customerPWR){
		alert("비밀번호가 일치하지 않습니다. ")
		$('#customerPWR').focus();
		return false;
	}
	
	// 닉네임
	if(customerNick==""){
		alert("닉네임을 입력하세요.")
		$('#customerNick').focus();
		return false;
	}

	if(customerNick.length>30 || customerNick.length<4  ){
		alert("닉네임은 4자 이상, 30자 이하로 입력하세요.")
		$('#customerNick').focus();
		return false;
	}
	
	if(nickFlag == false){
		alert("닉네임 중복을 확인하세요.")
		$('#customerNick').focus();
		return false;
	}
	
	// 이름
	if(customerName==""){
		alert("이름을 입력하세요.")
		$('#customerName').focus();
		return false;
	}

	// 전화번호
	if(phoneNum.length>=1){
		if(!cphoneCheck.test(phoneNum)){
			alert("휴대폰 번호는 "+"-"+" 를 포함한 000-0000-0000 형식으로 작성해주세요 ")
			$('#phoneNum').focus();
			return false;
		}
	}
	
	$.ajax({
		type:"POST",
		url:"signup",
		contentType:'application/json; charset=utf-8',
		data:JSON.stringify(params),
		success:function(result){
			alert("회원가입이 완료 되었습니다.")
			location.href='/guest/signin' 
		},
		error:function(err){
			alert("회원가입오류")
			console.log(err)
		}
	})
	

}