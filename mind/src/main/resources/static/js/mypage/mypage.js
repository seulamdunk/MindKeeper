$(function() {
	

	//===================
	// 일기 작성
	//===================
	$('#writeSecret').click(function() {

		var secretTitle = $('#secretTitle').val()
		var secretCon = $('#secretCon').val()
		var customerNum = $('#customerNum').val()

		var params = {
			secretTitle: secretTitle,
			secretCon: secretCon,
			customerNum: customerNum,

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
		}) // ajax
		
		


	})



	//===================
	// 결과 가져오기
	//===================

	$('#resultBtn').click(function() {


		var customerNum = $('#customerNum').val()
		var secretNum = $('#secretNum').val()
		var secretCon = $('#secretCon').val()
		var secretDate = $('#secretDate').val()
		
		var params = {
			customerNum : customerNum,
			secretNum : secretNum,
			secretCon : secretCon,
			secretDate : secretDate
		}
		
		alert(customerNum)
		alert(secretNum)
		//JSON.stringify(secretNum)
		$.ajax({
			type: "POST",
			url: "predictDiary",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(
				params
			),
			success: function(result) {
				$('#btnBox').empty()
				$('#btnBox').append('<input type="button" value="결과보기" id="resultBtn2" class="btn btn-primary py-3 px-5" />')
			},
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}) // ajax
	})
	
	
/*	function text(secretNum){
		
		console.log(secretNum)
		
		var customerNum = $('#customerNum').val()
		
		alert(customerNum)
		alert(secretNum)
		//JSON.stringify(secretNum)
		$.ajax({
			type: "POST",
			url: "predictDiary",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(
				customerNum,
				secretNum
			),
			dataType: "json",
			success: function(data) {
				alert(data[0].jindanCon)
				if (data.jindanCon[0] == '긍정') {
					$('#resultBox').text(data.jindanCon + "," + data.jindanConNum + "%" + "새로운 오늘을 맞이할 준비를 해봐!");
				}
				else {
					alert("부정");
				}

			},
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}) // ajax
		
		
		
	}*/



/*	function getColor() {

		var today = new Date();

		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);

		var jindanDate = year + '-' + month + '-' + day;
		
		var secretNum = $('#customerNum').val()

		//alert(jindanDate)

		//var date = $('.dateSel').val()

		$.ajax({
			type: "POST",
			url: "getColor",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(
				jindanDate
			),
			dataType: "json",
			success: function(data) {
				//alert(data.jindanConNum)
				//alert(day)
				if(data.jindanConNum > 50 && $('dateSel').val() == 30) {
					$('.dateSel_30').css('background-color','#e1bee7');
				}
			},
			error: function(err) {
				alert(error)
			}

		}) // ajax


	} // getColor
	getColor();*/


})