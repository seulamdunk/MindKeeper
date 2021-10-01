/**
 * 
 */
//	//2초마다 갱신 코드
//	function updateData(){
//	    $.ajax({
//	      url: "/refreshTalk",
//	      type:"post",
//	      success: function(data){ 
//	       console.log("갱신")
//	      },
//	      error:function(data){
//	    	  console.log("갱신 실패")
//	      }
//	    });
//	    timerID = setTimeout("updateData()", 2000); // 2초 단위로 갱신 처리
//	}
//	setTimeout("updateData()", 2000); 

$(function() { 
	
/*	//업로드 이미지 표시
	$("#files").on("change", function(e) {
		 console.log(e.target.files[0].name)
		 let name=e.target.files[0].name
		 $(".custom-file-label").text(name)
		 
		});
	*/
	
	//업로드 이미지 표시
	$("#files").on("change", function(e) {
		
		 let name=e.target.files[0].name
		 $(".custom-file-label").text(name)

		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src", data.target.result).width(150);
			}
			reader.readAsDataURL(this.files[0]);
		}
		});
	
	
	
	
	
	//첫 댓글 입력
	$(document).on("click",".review-btn",function(){
			
			const customerNum=$("#writer").val()
			const talkReviewCon=$(this).parent().find(".review-textarea").html()
			const talkNum=$(this).closest(".gedf-card").find(".talk-num").val()
			const tkClass =0;
			const groupNum= -1;
			
			let param={
				"talkNum":talkNum,
				"customerNum":customerNum,
				"talkReviewCon":talkReviewCon,
				"tkClass":tkClass,
				"groupNum":groupNum
			}
			
			$.ajax({
				type:"post",
				data:JSON.stringify(param),
				url:"/insertTalkReview",
				contentType:'application/json; charset=utf-8',
				success: function(res){
					alert("입력 성공 ")
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
				
			
		
		
	});
	
	//대댓글 입력
	$(document).on("click",".review-btn2",function(){
			
			const customerNum=$("#writer").val()
			const talkReviewCon=$(this).parent().find(".review-textarea").html()
			const talkNum=$(this).closest(".gedf-card").find(".talk-num").val()
			const tkClass =Number($(this).closest(".insert-area2").parent().parent().find(".tkClass").val())+1;
			const groupNum= $(this).closest(".insert-area2").parent().parent().find(".groupNum").val();
			alert(tkClass)
			alert(groupNum)
			
			let param={
				"talkNum":talkNum,
				"customerNum":customerNum,
				"talkReviewCon":talkReviewCon,
				"tkClass":tkClass,
				"groupNum":groupNum
			}
			
			$.ajax({
				type:"post",
				data:JSON.stringify(param),
				url:"/insertTalkReview",
				contentType:'application/json; charset=utf-8',
				success: function(res){
					
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
				
			
		
		
	});
	
	
	//게시글 응원 버튼 누를 시 입력 창으로 포커스
	$(document).on("click",".cheerUPBtn",function(){
		
		$(this).parent().parent().find(".inser-area").find(".review-textarea").focus();
	});
	

	
	
	
	//댓글 응원 버튼 누를 시 입력 창 삽입
	$(document).on("click",".cheerUPBtn2",function(){
	
		let area="";
		area+= '<div class="insert-area2" style="min-width:307px" >'
		area+=	 '"<form class="review-frm" method="post" action="insertReview">'
		area+=		'<div class="review-group" style="margin-left:30px">'
		area+=			'<div class="mr-2">'
		area+=	            '<img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">'
		area+=	        '</div>'
		area+=			'<div class="review-textarea-div">'
		area+=					'<div  class="review-textarea" contenteditable="true"placeholder="응원의 한마디" ></div>'
		area+=					'<div class="review-btn2 "><span> 💌응원</span></div>'

		area+=			'</div>'
		area+=	   		'</div>	'
		area+=			'</form>'
		area+='</div>'		
		
		
		$(this).parent().parent().find('.insert-group-area').html(area)
	});
		
	


	//게시글 삭제 버튼 누를 시
	$(document).on("click",".deleteTalkBtn",function(){
		const talkNum = $(this).parent().find(".talkNum").val()
//		let param={
//			"talkNum":talkNum
//		}
	
		$.ajax({
			type:'post',
			data:JSON.stringify(talkNum),
			url:"/deleteTalk",
			contentType:'application/json; charset=utf-8',
			success:function(result){
				alert("성공")
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
		
	});
		
	$(document).on("click",".deleteReviewBtn",function(){
		const talkReviewNum = $(this).parent().find(".talkReviewNum").val()
		
		$.ajax({
			type:'post',
			data:JSON.stringify(talkReviewNum),
			url:"/deleteTalkReview",
			contentType:'application/json; charset=utf-8',
			success:function(result){
				alert("성공")
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
		
	});
	
	
	

	
	
	function insertTalkLike(talkNum,customerNum,writer){
		alert("diq")
		let param= {

				"talkNum":talkNum,
				"customerNum":customerNum
				}
		
			$.ajax({
					url:"/saveLiketalk",
					data:JSON.stringify(param),
					contentType:'application/json; charset=utf-8',
					success:function(){
						alert("삽입")
						}
					
				
				})
				

		}
	
	
	
	
	
	
	
	
});
	
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




/*
//댓글 응원 버튼 누를 시 입력 창 삽입
$(document).on("click",".cheerUPBtn2",function(){

	let area="";
	area+= '<div class="insert-area2" style="min-width:307px" >'
	area+=	 '"<form class="review-frm" method="post" action="insertReview">'
	area+=		'<div class="review-group" style="margin-left:30px">'
	area+=			'<div class="mr-2">'
	area+=	            '<img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">'
	area+=	        '</div>'
	area+=			'<div class="review-textarea-div">'
	area+=					'<div  class="review-textarea" contenteditable="true"placeholder="응원의 한마디" ></div>'
	area+=					'<div class="review-btn2 "><span> 💌응원</span></div>'

	area+=			'</div>'
	area+=	   		'</div>	'
	area+=			'</form>'
	area+='</div>'		
	
	
	$(this).parent().parent().find('.insert-group-area').html(area)
});
	});


*/