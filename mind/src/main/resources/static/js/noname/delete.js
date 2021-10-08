function deleteById(){	
	
	var num= $("#noNameNum").text();
	
//	alert(num);
	
	$.ajax({
		type:"DELETE",
		url:"/n_details/" + num,
		success:function(result){
			alert("삭제가 완료 되었습니다.")
			location.href='/no_name' 
		},
		error:function(err){
			alert("삭제가 되지 않았습니다")
			console.log(err)
		}
	});
		
		
};







