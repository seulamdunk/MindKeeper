/**
 * 
 */



$(function() { 
	
	//업로드 이미지 표시
	$("#files").on("change", function(e) {
		 console.log(e.target.files[0].name)
		 let name=e.target.files[0].name
		 $(".custom-file-label").text(name)
		 
		});
	
		});
	


	//댓글 불러오기

	$(document).on("click",".cheerUPBtn",function(){
		
		const talkNum=$(this).find(".talkNum").val()
		a.ajax({
			
		})
	})

	/*	
	$("#files").on("change", function(e) {
		inputFile(e); });
	
		});

var inputFileList =new Array();
function insertTalk(){
		
    let talkCon = $("#talkCon").val()
	
	let imageInput = $("#files").val();
    var editForm = $("#talk_frm")
	let formData = new FormData(editForm[0]);
	//formData.append("talkCon", talkCon);
	for (var i = 0; i < inputFileList.length; i++) { 
		if(!inputFileList[i].is_delete){
			formData.append("talkImg", inputFileList[i]); 
			}
		}


	// formData.append("upLoadImg", imageInput);
	
	
	
	alert(formData.get('talkCon'))
	
	
	//var formData = new FormData($('#fileForm')[0]);


//	var params={"talkCon":talkCon,
//				"file":imageInput
//				}
    
    
	$.ajax({
		type:"post",
		contentType: false,
		processData: false,
		enctype:'multipart/form-data',
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
	*/
