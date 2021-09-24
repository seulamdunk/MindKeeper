$(function() {
	
	alert("개발시작");

	$('#writeSecret').click(function() {
		
		var secretTitle = $('#secretTitle').val()
		var secretCon = $('#secretCon').val()
		var customerNum = 1
		
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




})