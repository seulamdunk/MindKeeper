
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
            var date = new Date();
            date.setTime(date.getTime() + (60 * 60 * 1000)); //유효시간 1시간
            var expires = "; expires=" + date.toGMTString();
			document.cookie="token="+result+expires+"; path=/";
			location.href='/' 
		},
		error:function(err){
			alert("아이디 또는 비밀번호를 확인하세요.")
			console.log(err)
		}
	})

}

function enterkey(){
	if(window.event.keyCode==13){
		signin()
	}
}