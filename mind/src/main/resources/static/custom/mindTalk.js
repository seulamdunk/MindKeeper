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
	
	
	
	 var flag=0;
	  
	  $('.share').on('click',function(){
	   if(flag == 0)
	    {
	      $(this).siblings('.one').animate({
	      top:'200px',
	      left:'50%',
	    },200);
	    
	     $(this).siblings('.two').delay(200).animate({
	      top:'260px',
	      left:'40%'
	    },200);
	    
	     $(this).siblings('.three').delay(300).animate({
	      top:'260px',
	      left:'60%'
	    },200);
	              
	    $('.one i,.two i, .three i').delay(500).fadeIn(200);  
	      flag = 1;
	    }
	    
	    
	  else{
	    $('.one, .two, .three').animate({
	        top:'300px',
	        left:'50%'
	      },200);
	      
	  $('.one i,.two i, .three i').delay(500).fadeOut(200);
	      flag = 0;
	    }
	  });
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$("cus-name-click-menu").hide()
	$('.cus-name-click').click(function(){
		$(this).find("cus-name-click-menu").toggle()
	});
	
	
	
	function showInfo(){
		
		let area = $(this).parent(".loctionPoint").find(".showinfo")
		let thumbnail = $(this).parent().find(".thumbnail").val()
		let title = $(this).parent().find(".title").val()
		let ch = $(this).parent().find(".ch").val()
		let cnt= $(this).parent().find(".cnt").val()
		
		area.html();
		area.css({"background-img":thumbnail})
		let div =''
	}
	
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
	
	
	
	
	
	function YesScroll () {
		const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
		const fullContent = document.querySelector('#infinity'); // 전체를 둘러싼 컨텐츠 정보획득
		const screenHeight = screen.height; // 화면 크기
		let oneTime = false; // 일회용 글로벌 변수
		document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
		 function OnScroll () { //스크롤 이벤트 함수
		   const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이   
		   const scrollPosition = pageYOffset; // 스크롤 위치
		   if (fullHeight-screenHeight/8 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
		     oneTime = true; // oneTime 변수를 true로 변경해주고,
		      // 컨텐츠를 추가하는 함수를 불러온다.
		  getNewTalkList()
	   
		     
		   }
		 }
		 }
		YesScroll()

	// articleController

/*	const defaultArticlePaginationSize = 5; // 한 번 요청으로 가져올 게시글의 개수
	
	$(window).scroll(function() {
		   if($(window).scrollTop() + $(window).height() == $(document).height()) {
			   
			   alert("dkdkdkddk")
			   let talkNumList = document.querySelectorAll('.talk-num');
			  
			   	alert(talkNumList)
		
			 
			   
			   getNewTalkList(lastTalkNum,defaultArticlePaginationSize);
		   }
		});
*/
	/*	function(customerNum,customerNick){
			location.href='/invitation?userNum='+customerNum+'&'+userName=customerNick'
		}
*/
	function getNewTalkList(){
			let talkNumDiv = $('.talk-num');
			talkNumList=[]
			talkNumDiv.each(function(){
				
				let idNum =$(this).attr("id")
				talkNumList.push(idNum)
			})
				let lastTalkNum= Math.min.apply(null,talkNumList)
			 
				let param={
				lastTalkNum:lastTalkNum
			}
				$.ajax({
					type:"post",
					data:JSON.stringify(param),
					url:"/getTalkListPage",
					contentType:'application/json; charset=utf-8',
					dataType:'JSON',
					success: function(res){
						   let tokenNum =$("writer").val()
						$.each(res.content, function(key, value){
						console.log(value)
							 <!--- \\\\\\\Post-->
						
						let talkPage=''+
						
		               ' <div class="card gedf-card">'+
		               ' <div class="bg-blue-20"></div>'+
		               ' <input type ="hidden" class="talk-num" id="'+value.talkNum +'"value="$'+value.talkNum +'">'+
		                  '  <div class="card-header">'+
		                       ' <div class="d-flex justify-content-between align-items-center">'+
		                           ' <div class="d-flex justify-content-between align-items-center ">'+
		                              '  <div class="mr-2">'+
		                                   ' <img class="rounded-circle" width="45" src="'+value.customer.profileImg+'" alt="">'+
		                                   ' </div> '+
		                                   ' <div class="ml-2"> '+
		                                
		                                   ' <div class="h5 m-0" data-toggle="dropdown"> '+value.customer.customerNick +
		                                   '<div class="dropdown-menu"> '+
													'+	<a onclick="location.href=/searchUser?userNum='+value.customer.customerNum +'" class="dropdown-item searchUser" >게시글 보기</a>';
													
												if(value.customer.customerNum != tokenNum  ){
													talkPage +='<a onclick="location.href=/invitation?userNum='+value.customer.customerNum+'userName='+value.customer.customerNick +'" class="dropdown-item goTalk" >톡하기</a>'
												}
						talkPage +=					'</div>'+
		                                    
		                                   
		                               '</div>     '+

		                                    
		                                   ' <div class="h7 text-muted"><span>'+value.talkDate +'</span></div>'+
		               
		                                '</div>'+
		                            '</div>'+
		                           
		                      '  </div>'+

		                 '   </div>'+
		                    
		                  
		                    '<div class="card-body">'+
		                 
		                        '<p class="card-text">'+ value.talkCon +'</p>'+
		                       ' <hr>'+
		                        '<p class="card-text">'
		                        
		                        for (let a in value.tag.split("#")){
		                        	talkPage +=		'<a>'+a+'&nbsp</a>'
		                        }
		                        
						talkPage +=	
		                       ' </p>'+
		                        '<div class="img-display">'+
		                      '  <img  src="'+value.talkImg[0] +'"/>'+
		                      '  </div>'+
		                   ' </div>'+
		                  
		                    
		                   ' <div class="card-footer taklLikeArea'+value.talkNum +'">'+
		        
		                     
		                    	
							'<jsp:include page="./likeTalk.jsp">'+
								'<jsp:param value="${talk.talkNum }" name="talkNum"/>'+
								'<jsp:param value="${tokenNum }" name="tokenNum"/>'+
								'<jsp:param value="${talk.customer.customerNum }" name="writer"/>'+
						'	</jsp:include>'+
		                  '  </div>'+
		                  
						       	'	<div class="inser-area justify-content-center">'+
						       			'<form class="review-frm" method="post" action="insertReview">'+
						       				'<div class="review-group">'+
								       		
								       			'<div class="review-textarea-div">'+
								       		
								       			
													'<div  class="review-textarea" contenteditable="true"placeholder="응원의 한마디" ></div>'+
								       				'<div class="review-btn "><span>💌</span></div>'+
								       			'</div>'+
								       		'</div>	'+
						       			'</form>'+
						       		'</div>'+		  
						     
		                    '<div class="+cheerUPArea"'+value.talkNum+'">'+
		                    	 '<div class="card card-inner"> '+
		         
		              		  '<jsp:include page="./talkReview.jsp" flush="false">'+
		            			  		'<jsp:param name="talkNum" value="'+value.talkNum +'" /> '+         
		            			  	'	<jsp:param name="tokenNum" value="'+tokenNum +'" />'+                  
		      					'  </jsp:include>'+
						'</div>'+



		                  '</div>'+
		                
		                  
						'</div>'+
				
						'</div>	'
					
						
						
						$("#infinity").append(talkPage)
					})
								
						
					},
					error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
					
		}
	
	
});

//첫 댓글 입력
$(document).on("click",".review-btn",function(){
		if($("#writer")==-1){
			
			alert("로그인 후 작성하실 수 있습니다.")
			return;
		}
		
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
				
				commentList(talkNum,customerNum,customerNum)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
			
		
	
	
});


 function commentList(talkNum,tokenNum,customerNum){
    
    		
    var	param={'talkNum': talkNum}	
 	$.ajax({
    		url : '/guest/talkReview',
    		contentType:'application/json; charset=utf-8',
    		type:'post',
    		data : JSON.stringify(talkNum),
    		dataType:'JSON',
    		success : function(data){
    		
    		 	var a = '';
    			$.each(data.content, function(key, value){ // value가 list형태라서 for문같은 each돌림
    		
    				var customerNum = value.customer.customerNum;
					let tkClass = value.tkClass
					var date = value.talkReviewDate.replace("T"," ")
					var wd = new Date(date.valueOf());
					var w_time = wd.getTime();
    				
    				var cur = new Date();
    				var c_time = cur.getTime();
    				
    				var chai = c_time - w_time;
					


	 				let time;
                    
           		    if(chai < 1000 * 60)
           		    	time= Math.floor(chai / 1000) + ' 초전';
                    else if(chai < 1000 * 60 * 60)
                    	time= Math.floor(chai / (1000 * 60)) + ' 분전';
                    else if(chai < 1000 * 60 * 60 * 24)
                    	time= Math.floor(chai / (1000 * 60 * 60)) + ' 시간전';
                    else if(chai < 1000 * 60 * 60 * 24 * 30)
                    	time= Math.floor(chai / (1000 * 60 * 60 * 24)) + ' 일전';
                    else if(chai < 1000 * 60 * 60 * 24 * 30 * 12)
                    	time= Math.floor(chai / (1000 * 60 * 60 * 24 * 30)) + ' 달전';
                  



 a+=     '<div class="card-body"  style="margin-left:' + value.tkClass * 5 +'%">';
 a+=	        '<div class="row" style="margin-left:10px"> '       	 ;
 a+=                ' <div class="d-flex justify-content-between align-items-center" >';
 a+=                    ' <div class="mr-2">';
 a+=                     	'<div class="col-12">';
 a+=                        	'<img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">';
 a+=                      '  </div>';
 a+=                        '<div class="col-12">';
 a+=                        	'<span>'+time+'</span>';
 a+=                       ' </div>';
 a+=                    '</div>';
 a+=                    '<div class="ml-2">';
 a+=                       ' <div class="inline-div " style="width=100%">';
 a+=                         	'<div class=" text-bk">';
 a+=                        		'<p><strong>'+value.customer.customerName +'</strong> &nbsp;&nbsp;'+ value.talkReviewCon +'</p>';
 a+=                        	'</div>';
 a+=                        	'<div class="h7 text-muted">';
                         		
 a+=                        	'</div>';
 a+=                        	'<div class="">';
 a+=			                      ' <span class="btn btn-primary LikeReview">🤍'+ value.talkReviewCnt +' </span> '; 
 a+=			                       '<span class="btn btn-primary cheerUPBtn2">🗨  </span>	';
 a+=			                      ' <input type="hidden" class="tkClass" value="'+ value.tkClass +'">	';
 a+=			                       ' <input type="hidden" class="groupNum" value="'+value.groupNum+'">';
 a+=			                         '<input type="hidden" class="talkReviewNum" value="'+value.talkReviewNum+'">';
			                         if(tokenNum == value.customer.customerNum){
											 a+= '<span class="btn btn-primary deleteReviewBtn">❌ </span>'						
											}				                       
			                         a+=			                   ' </div>';
			                         a+=			                   ' <div class="insert-group-area"></div>';		                                    
			                         a+=                        '</div>  '    ;
			                         a+=                   ' </div>';
                     
			                         a+=           '</div>';
			                         a+=   			' </div>';
			                         a+=   		'</div> ';

                  
    	   }); 
			
    			 $(".cheerUPArea"+talkNum ).html(a);
    			 
     	   
               }
 
         }); 
      
    }

//대댓글 입력
$(document).on("click",".review-btn2",function(){
		
		const customerNum=$("#writer").val()
		const talkReviewCon=$(this).parent().find(".review-textarea").html()
		const talkNum=$(this).closest(".gedf-card").find(".talk-num").val()
		const tkClass =Number($(this).closest(".insert-area2").parent().parent().find(".tkClass").val())+1;
		const groupNum= $(this).closest(".insert-area2").parent().parent().find(".groupNum").val();
		if(customerNum==-1){
			
			alert("로그인 후 작성하실 수 있습니다.")
		}else if(talkReviewCon==""){
			
			
		}else{
		
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
				commentList(talkNum,customerNum,customerNum)
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
			
		}
	
	
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
	let talkNum = $(this).parent().find(".talkNum").val()
//	let param={
//		"talkNum":talkNum
//	}

	$.ajax({
		type:'post',
		data:JSON.stringify(talkNum),
		url:"/deleteTalk",
		contentType:'application/json; charset=utf-8',
		success:function(result){
			location.reload();
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	
});
	













//댓글삭제
$(document).on("click",".deleteReviewBtn",function(){
	let talkReviewNum = $(this).parent().find(".talkReviewNum").val()
	let customerNum=$("#writer").val()
	let talkNum=$(this).closest(".gedf-card").find(".talk-num").val()
	alert(talkReviewNum)
	$.ajax({
		type:'post',
		data:JSON.stringify(talkReviewNum),
		url:"/deleteTalkReview",
		contentType:'application/json; charset=utf-8',
		success:function(result){
		
			commentList(talkNum,customerNum)
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	
	
});


//댓글 좋아요 보기
function viewLikeReview(talkReviewNum,customerNum){
    let param={
			"talkReviewNum":talkReviewNum,
			"customerNum":customerNum
            }
	$.ajax({
		url:'/viewLikeReview',
		contentType:'application/json; charset=utf-8',
		type:'post',
		data:JSON.stringify(param),
		dataType:'JSON',
		success:function(data){
			var a='🤍 '+ data.cntSum
			
			if(data.cnt ==0){	
			
			$(".reviewHeartArea"+talkReviewNum).css({"color":"red"})
			}
			
		},error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		
	}); 
};









/*//댓글 좋아요 입력
$(document).on("click","likeReview",function(){
	let talkReviewNum = $(this).parent().find(".talkReviewNum").val()
	let customerNum=$("#writer").val()
	let talkNum=$(this).closest(".gedf-card").find(".talk-num").val()
		$.ajax({
		type:'post',
		data:JSON.stringify(talkReviewNum),
		url:"/insertLikeReview",
		contentType:'application/json; charset=utf-8',
		success:function(result){
		
			commentList(talkNum,customerNum)
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	
	
	
	
	
})

*/







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