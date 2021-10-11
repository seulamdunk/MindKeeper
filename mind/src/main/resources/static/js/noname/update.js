function update(){
	
	//let noNameNum = $("#noNameNum").val();
	
	let data = {
		noNameTitle: $("#noNameTitle").val(),
		noNameCon: $("#noNameCon").val(),
		noNameNum: $("#noNameNum").val()
	}
//	alert($("#noNameNum").val());
//	alert($("#noNameTitle").val());
//	alert($("#noNameCon").val());
	
	
	$.ajax({
		type:"POST",
		url:"/n_details/edit"  ,
		contentType: "application/json; charset=utf-8",
		data:JSON.stringify(data),
		success:function(result){
			alert("수정이 완료 되었습니다.")
			location.href='/no_name' 
		},
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       }
	});
		
		
};







