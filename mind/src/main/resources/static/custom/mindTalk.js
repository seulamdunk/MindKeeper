/**
 * 
 */

function insertTalk(){
		
/*	let talkCon = $("#talkCon").val()
	
	let imageInput = $("#customFile")[0];
	let formData = new FormData();
	formData.append("talkCon", talkCon);
	if(imageInput.files.length === 0){
	
		
  for (var key of formData.keys()) {
	    console.log(key);
	  }
  for (var value of formData.values()) {
    console.log(value);
  }
	 formData.append("talkImg", imageInput.files[0]);
	}
	
	alert("ㅇㅇㅇ")
	*/
	
	var formData = new FormData($('#fileForm')[0]);


//	var params={"talkCon":talkCon
//				}
	$.ajax({
		type:"post",
		contentType: false,
		processData: false,
		enctype: 'multipart/form-data',
		data:formData,
		url:"/insertTalk",
		contentType:'application/json; charset=utf-8',
		success: function(res){
			alert("입력 성공 ")
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	}
	
