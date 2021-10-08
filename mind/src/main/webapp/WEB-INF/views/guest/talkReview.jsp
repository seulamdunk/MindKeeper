<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<script src="../js/jquery.min.js"></script>

</head>

<body>


<% String talkNum = request.getParameter("talkNum"); %>
<% String tokenNum = request.getParameter("tokenNum"); %>




<script>

$(document).ready(function(){
	
	commentList();
    function commentList(){
        let talkNum='<%=talkNum%>'
    	const tokenNum ='<%=tokenNum%>'
    		
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
 a+=                        		'<p><strong>'+value.customer.customerNick +'</strong> &nbsp;&nbsp;'+ value.talkReviewCon +'</p>';
 a+=                        	'</div>';
 a+=                        	'<div class="h7 text-muted">';
                         		
 a+=                        	'</div>';
 a+=                        	'<div class="">';
 a+=			                      ' <span class="btn btn-primary reviewHeartBtn reviewHeartArea'+value.talkReviewNum+'"></span> '; 
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

			                         $(".cheerUPArea"+talkNum ).html(a);
			            			 viewLikeReview(value.talkReviewNum,tokenNum);
    	   }); 
			
    			 
     	   
               }
 
         }); 
      
    }
    	


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
    			$(".reviewHeartArea"+talkReviewNum).text(a)
    			var de='deleteLikeTalkReview(${talkReviewNum},${customerNum})'
    			if(data.cnt !=0){	
    				
    			$(".reviewHeartArea"+talkReviewNum).css({"color":"red"})
    				$(".reviewHeartArea"+talkReviewNum).attr({"onclick":"deleteLikeTalkReview("+talkReviewNum+","+customerNum+")"})
    			}else{
    				$(".reviewHeartArea"+talkReviewNum).attr({"onclick":"insertLikeTalkReview("+talkReviewNum+","+customerNum+")"})
        			}
    			
    		},error:function(request, status, error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        		}
    		
    	}); 
    };




    
}); 




//댓글 좋아요 보기
function viewLikeReview2(talkReviewNum,customerNum){
	
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
			$(".reviewHeartArea"+talkReviewNum).text(a)
			
			if(data.cnt !=0){	
				
				$(".reviewHeartArea"+talkReviewNum).css({"color":"red"})
				$(".reviewHeartArea"+talkReviewNum).attr({"onclick":"deleteLikeTalkReview("+talkReviewNum+","+customerNum+")"})
			}else{
				$(".reviewHeartArea"+talkReviewNum).attr({"onclick":"insertLikeTalkReview("+talkReviewNum+","+customerNum+")"})
    			}
			
		},error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		
	}); 
}; 
 

//댓글 좋아요 입력
function insertLikeTalkReview(talkReviewNum, customerNum){
	
	   let param={
    			"talkReviewNum":talkReviewNum,
    			"customerNum":customerNum
                }
	 
    	$.ajax({
    		url:'/insertLikeReview',
    		contentType:'application/json; charset=utf-8',
    		type:'post',
    		data:JSON.stringify(param),  		
    		success:function(data){
    			viewLikeReview2(talkReviewNum,customerNum)
    		
    		},error:function(request, status, error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        		}
    		
    	}); 
		
	}
//댓글좋아요 해제
function deleteLikeTalkReview(talkReviewNum, customerNum){
	   let param={
    			"talkReviewNum":talkReviewNum,
    			"customerNum":customerNum
                }
    	$.ajax({
    		url:'/deleteLikeReview',
    		contentType:'application/json; charset=utf-8',
    		type:'post',
    		data:JSON.stringify(param),
    		
    		success:function(data){
    			viewLikeReview2(talkReviewNum,customerNum)
    			
    		},error:function(request, status, error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        		}
    		
    	}); 
		
	}






/* $(document).on('click','.reviewHeartBtn',function(){
	let cnt = $(this).text().substr(2,$(this).text().length)
	alert(cnt)
	let talkReviewNum =$(this).parent().find(".talkReviewNum").val()
	let customerNum =$("#writer").val()
	
	if(cnt==0){
		insertLikeTalkReview(talkReviewNum, customerNum)
		}else{
			deleteLikeTalkReview(talkReviewNum, customerNum)
			}

}) */
</script>




</html>
