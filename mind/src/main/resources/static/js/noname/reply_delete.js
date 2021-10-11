function replyDelete() {	
	
	var noNameNum = $("#noNameNum").text();
	var noNameReplyNum= $("#noNameReplyNum").val();
//	
//	alert($("#noNameNum").text());
//	alert($("#noNameReplyNum").val());
	
	
	$.ajax({
		type:"Delete",
		url:'/n_details/' + noNameNum + '/reply/' + noNameReplyNum,
		success:function(result){
			alert("삭제가 완료 되었습니다.")
			location.href='/n_details/' + noNameNum 
		},
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       }
	});
		
		
};
