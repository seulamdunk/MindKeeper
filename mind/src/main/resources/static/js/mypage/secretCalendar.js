$(function() {

	var day = $('#day').text();

	let today = new Date();

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day2 = today.getDay();  // 요일
	
	 if ((date+"").length < 2) {
        date2 = "0" + date;
    }
	
	var secretDate = year+'-'+month+'-'+date2+' 00:00:00';
	var tdDate = year+'-'+month+'-'+date2
	
	function colorPick(){
		
		$('#"[i]"')
	}
	/*
	
		$.ajax({
			type: "POST",
			url: "secretCalendar",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(secretDate),
			dataType:"JSON",
			success: function(result) {
				let a = result.secretCalendar.jindanConNum[1]
				alert(a)
				//for(var i=0; i<31; i++) {
				//	$('#calendar').append(a[i])
				//}
								
			},
			error: function(err) {
				alert("실패")
			}
		})
		
		*/
})

