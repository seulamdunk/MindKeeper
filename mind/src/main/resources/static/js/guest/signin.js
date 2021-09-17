function signin(){
	
	var customerID=$('#customerID').val()
	var customerPW=$('#customerPW').val()
	
	var params={customerID:customerID,
				customerPW:customerPW
				} // json 파일
		
	$.ajax({
		type:"POST",
		url:"signin",
		contentType: "application/json; charset=utf-8",
		data:JSON.stringify(params),
		success:function(result){
			
			document.cookie="X-AUTH-TOKEN=" +result +"; path=/";
			
			location.href='/' 
			 
		},
		error:function(err){
			alert("로그인오류")
			console.log(err)
		}
	})

}