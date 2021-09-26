$(function() {
	
	alert("개발시작");

//===================
// 일기 작성
//===================
	$('#writeSecret').click(function() {
		
		var secretTitle = $('#secretTitle').val()
		var secretCon = $('#secretCon').val()
		var customerNum = $('#customerNum').val()
		
		var params = {
			secretTitle : secretTitle,
			secretCon : secretCon,
			customerNum : customerNum
			
		}
		
		$.ajax({
			type: "POST",
			url: "saveDiary",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(params),
			success: function(result) {
				alert("성공")
				location.href= "myPage" 
			},
			error: function(err) {
				alert(err)
			}
		})


	})
	
	

//===================
// 결과 가져오기
//===================

$('#resultBtn').click(function() {
	
	
	var secretNum2 = $('#customerNum').val()
	alert(secretNum2)
	//JSON.stringify(secretNum)
	$.ajax({
			type: "POST",
			url: "resultDiary",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(
				secretNum2
			),
			dataType: "json",
			success: function(data) {
				alert(data.jindanCon)
				$('#resultBox').text(data.jindanCon + "," + data.jindanConNum + "%");
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
})


})