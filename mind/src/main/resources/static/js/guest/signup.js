function signup(){
	var customerID=$('#customerID').val()
	var customerPW=$('#customerPW').val()
	var customerName=$('#customerName').val()
	var customerNick=$('#customerPW').val()
	var identityNum=$('#identityNum').val()
	var phoneNum=$('#phoneNum').val()

	
	var params={customerID:customerID,
				customerPW:customerPW,
				customerName:customerName,
				identityNum:identityNum,
				customerNick:customerNick,
				phoneNum:phoneNum
				} // json 파일

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
			alert("삽입오류")
			console.log(err)
		}
	})

}