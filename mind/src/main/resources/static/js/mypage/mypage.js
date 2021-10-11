$(function() {
		
	var customerNum = $('#customerNum').val()
	


	//===================
	// 일기 작성
	//===================
	$('#writeSecret').click(function() {

		var secretTitle = $('#secretTitle').val()
		var secretCon = $('#secretCon').val()
		var customerNum = $('#customerNum').val()
		var secretImg = $('#')

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
				alert("저장되었습니다")
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
		
		var jindanCon = $('#jindanCon').val()
		var jindanConNum = $('#jindanConNum').val()
		var customerName = $('#customerName').val()
		
		//alert(jindanConNum)
		
		if(jindanCon == '긍정') {
			$('#resultBox').append('<div class="card-body"><h4 class="font-weight-bold">' + jindanCon + '<span class="float-right">' + jindanConNum + '%</span></h4><div class="progress mb-4"><div class="progress-bar bg-danger" role="progressbar" style="width:' +jindanConNum + '%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div></div></div>')
			$('#banner').removeClass('banner')
		} else {
			$('#resultBox').append('<div class="card-body"><h4 class="small font-weight-bold">' + jindanCon + '<span class="float-right">' + jindanConNum + '%</span></h4><div class="progress mb-4"><div class="progress-bar bg-danger" role="progressbar" style="width:' +jindanConNum + '%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div></div></div>')
			$('#banner2').append('<div id="banner"><div class="banner_inner"><h2>이번달걷기행사</h2><div id="banner_list"><ul class="sec3_list"><li><span><img src="../img/parkImg/walkevent.jpg"alt="행사"></span><dl><dt>MIRUN SEOUL UNTACT RACE 2021</dt><dd>레포츠<br>2021.10.01.(금)~2021.10.07.(목)</dd></dl></li><li><span><img src="../img/parkImg/walkevent2.jpg"alt="행사"></span><dl><dt>사랑하나오티즘버츄얼레이스</dt><dd>레포츠<br>2021.10.04.(월)~2021.10.11.(월)</dd></dl></li><li><span><img src="../img/parkImg/walkevent3.jpg"alt="행사"></span><dl><dt>하이브리드한강나이트워크42K</dt><dd>레포츠<br>2021.10.01.(금)~2021.10.17.(일)</dd></dl></li><li><span><img src="../img/parkImg/walkevent4.jpg"alt="행사"></span><dl><dt>2021세이브더칠드런R untact국제어린이마라톤</dt><dd>레포츠<br>2021.10.08.(금)~2021.10.10.(일)</dd></dl></li><li><span><img src="../img/parkImg/walkevent5.jpg"alt="행사"></span><dl><dt>엘르런ELLE RUN</dt><dd>레포츠<br>2021.10.09.(토)~2021.10.10.(일)</dd></dl></li><li><span><img src="../img/parkImg/walkevent6.jpg"alt="행사"></span><dl><dt>2021옥스팜버추얼워커50K</dt><dd>레포츠<br>2021.10.11.(월)~2021.11.21.(일)</dd></dl></li></ul><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev"href=""><img src="../img/parkImg/previous.png"alt="이전버튼"style="width:50px;height:50px;"></a><a class="bx-next"href=""><img src="../img/parkImg/next.png"alt="다음버튼"style="width:50px;height:50px;"></a></div></div></div></div></div>')
		}
	})
	


})