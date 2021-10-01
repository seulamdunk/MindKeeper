countCustomer()

function countCustomer(){
	$.ajax({
		url:"countCustomer",
		success:function(result){
			$('#countCustomer').text(result+" 명")
		},
		error:function(err){
			console.log(err)
		}
	})
	
}
countMindtalk()

function countMindtalk(){
	$.ajax({
		url:"countMindtalk",
		success:function(result){
			$('#countMindtalk').text(result+" 개")
		},
		error:function(err){
			console.log(err)
		}
	})
	
}

countTodayCustomer()

function countTodayCustomer(){
	$.ajax({
		url:"countTodayCustomer",
		success:function(result){
			$('#countTodayCustomer').text(result+" 명")
		},
		error:function(err){
			console.log(err)
		}
	})
}