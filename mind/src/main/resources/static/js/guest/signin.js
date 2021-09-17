function signin(){
	
	var customerID=$('#customerID').val()
	var customerPW=$('#customerPW').val()
	
	var params={customerID:customerID,
				customerPW:customerPW
				} // json 파일
		
	$.ajax({
		type:"POST",
		url:"signin",
		contentType:'application/json',
		data:JSON.stringify(params),
		success:function(result){
			var expireDay = 24 * 60 * 60 * 1000;
			document.cookie="X-AUTH-TOKEN=" + result +expireDay+"; path=/";
			
			location.href='/' 
			 
		},
		error:function(err){
			alert("로그인오류")
			console.log(err)
		}
	})

}