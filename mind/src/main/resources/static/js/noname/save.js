function save(){
	
	let data = {
		noNameTitle: $("#noNameTitle").val(),
		noNameCon: $("#noNameCon").val()
	}
//		alert($("#noNameTitle").val());
//		alert($("#noNameCon").val());
		
	$.ajax({
		type:"POST",
		url:"/n_write",
		contentType: "application/json; charset=utf-8",
		data:JSON.stringify(data),
		success:function(result){
			alert("저장이 완료 되었습니다.")
			location.href='/no_name'
		},
		error:function(request,status,error){
			alert("저장이 되지 않았습니다")
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
		
		
};







