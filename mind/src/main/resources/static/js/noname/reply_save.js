function replySave(){
	//alert("asdasdasd");
	let replyContent = $("#reply-content").val();
	
	let noNameNum = $("#noNameNum2").val();
	
	alert($("#noNameNum2").val());
	alert($("#reply-content").val());
	
	$.ajax({
		type:"POST",
		url:'/n_details/' + noNameNum + '/reply',
		contentType: "application/json; charset=utf-8",
		data:JSON.stringify(replyContent),
		success: setTimeout('location.reload()',100000000), 
//		success:function(result){
//			alert("저장 되었습니다.")
//			//location.href='/n_details/' + noNameNum
//			setTimeout('location.reload()',1000000); 
//		},
		error:function(err){
			alert("저장이 되지 않았습니다")
			console.log(JSON.stringify(err))
		}
	});
	
	
//	$.ajax({
//		type:"POST",
//		url:'/n_details/' + noNameNum + '/reply',
//		contentType: "application/json; charset=utf-8",
//		data:JSON.stringify(replyContent),
//		dataType:"json",
//		success:function(result){
//			
//			let 
//			
//		},error:function(err){
//			
//		}
//	
//	});
		
};






