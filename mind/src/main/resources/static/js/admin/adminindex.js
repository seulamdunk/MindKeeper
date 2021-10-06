//총 회원수
countCustomer()
//오늘의 게시글 수
countMindtalk()
//오늘 로그인 수
countTodayCustomer()
//가장 많은 좋아요 수
countNoName()
//긍정 부정 개수
CustomerPositive()

function CustomerPositive(){
	$.ajax({
		url:"CustomerPositive",
		success:function(result){
			$('#countPositive').text(result*100+"%")
			document.getElementById('countPositivePer').style.width=result*100+'%';
		},
		error:function(err){
			console.log(err)
		}
	})
}

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

function countNoName(){
	$.ajax({
		url:"countNoName",
		success:function(result){
			var arr= result
			for(var i=0;i<5;i++){
			$('#noNameContent'+i).append('<a href=../../n_details/'+arr[i][0]+'>'+arr[i][4]+'</a>')
			$('#noNameCount'+i).text(arr[i][2]+" 회")
			}
			document.getElementById('one').style.width='100%';
			document.getElementById('two').style.width=arr[1][2]/arr[0][2]*100+'%';
			document.getElementById('three').style.width=arr[2][2]/arr[0][2]*100+'%';
			document.getElementById('four').style.width=arr[3][2]/arr[0][2]*100+'%';
			document.getElementById('five').style.width=arr[4][2]/arr[0][2]*100+'%';
		},
		error:function(err){
			console.log(err)
		}
	})
}


