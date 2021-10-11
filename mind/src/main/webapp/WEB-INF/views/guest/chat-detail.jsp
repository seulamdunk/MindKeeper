<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>Chat</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		 <link rel="stylesheet" href="../custom/chat.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
		
<title>마음지킴이</title>

<script type="text/javascript">

var ws;
function wsOpen(){
	
	ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
	wsEvt();
}
	
function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 동작
	}
	
	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		
		var msg = data.data;
		//alert(msg)
		if(msg != null && msg.trim() != ''){
			
			var d = JSON.parse(msg);
			
			if(d.type == "getId"){
				var si = d.sessionId != null ? d.sessionId : "";
				if(si != ''){
					$("#sessionId").val(si); 
				}
			}else if(d.type == "message"){
				let today = new Date(); 
				if(d.sessionId == $("#sessionId").val()){
				

			let div =
				 '<div class="media w-50 ml-auto mb-3">'+
		         ' <div class="media-body">'+
		           ' <div class="bg-primary rounded py-2 px-3 mb-2">'+
		             ' <p class="text-small mb-0 text-white">'+ d.msg +'</p>'+
		            '</div>'+
		            '<p class="small text-muted">'+today.toLocaleString()+'</p>'+
		          '</div>'+
		        '</div>'


			
					$("#chating").append(div);	
				}else{
					let div = 
			'<div class="media w-50 mb-3">'+
			'<div style="line-height:100px;">'+
			 ' <img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">'+
			'</div> ' +
          '<div class="media-body ml-3"><strong>'+d.userName+'</strong>'+
            '<div class="bg-light rounded py-2 px-3 mb-2">'+
             ' <p class="text-small mb-0 text-muted">'+d.msg +'</p>'+
            '</div>'+
            '<p class="small text-muted">'+today.toLocaleString()+'</p>'+
          '</div>'+
       ' </div>'
			
					$("#chating").append(div);
				}
				messageSave(data)
			}else{
				console.warn("unknown type!")
			}
			
		}
		
		
	}

	
}


function messageSave(data){
let d= JSON.parse(data.data)	

let saveData ={
		"msg" :d.msg,
		"roomNumber" :d.roomNumber,
		"userNum":d.userNum
			}
	//alert(saveData.msg)
	$.ajax({
		type:"post",
		url:"/saveMessage",
		data:JSON.stringify(saveData),
		contentType:'application/json; charset=utf-8',
		success:function(){
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		
		})

	}

function getMessageList(lastNum,size){
	let sendData ={
			"roomNumber" :$("#roomNumber").val(),	
			"lastNum":lastNum,
				"size":size
				}
	$.ajax({
		type:"post",
		url:"/getMessageList",
		data:JSON.stringify(sendData),
		contentType:'application/json; charset=utf-8',
		dataType:"JSON",
		success:function(data){
					//alert(JSON.stringify(data))
				data.content.forEach(function(d){
					
					let msg =d["customer"].message[0]
					let datetime = new Date(msg["messageDate"])
					//alert(msg["messageNum"])
				
					if(d["customer"].customerNum== $("#userNum").val()){
				/* 		let div = '<div class="d-flex justify-content-end mb-4">'+
						'<div class="img_cont_msg">'+
						'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
					'</div>'+
					'<div class="msg_cotainer_send">'+
					'<p class="me">나 :' + msg["messageCon"] + '</p>'+
						'<span class="msg_time">'+datetime.toLocaleString()+'</span>'+
				'	</div>'+
				'</div>'; */
				let div =
					 '<div class="media w-50 ml-auto mb-3">'+
			         ' <div class="media-body">'+
			           ' <div class="bg-primary rounded py-2 px-3 mb-2">'+
			             ' <p class="text-small mb-0 text-white">'+msg["messageCon"] +'</p>'+
			            '</div>'+
			            '<p class="small text-muted">'+datetime.toLocaleString()+'</p>'+
			          '</div>'+
			        '</div>'

						$("#chating").prepend(div);	
					}else{
					/* 	let div = '<div class="d-flex justify-content-start mb-4">'+
						'<div class="img_cont_msg">'+
						'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
					'</div>'+
					'<div class="msg_cotainer">'+
					'<strong>'+d["customer"].customerName +'</strong>'+
					'<p class="others">' +msg["messageCon"] + '</p>'+
						'<span class="msg_time">'+datetime.toLocaleString()+'</span>'+
				'	</div>'+
				'</div>'; */

				let div = 
				  '<div class="media w-50 mb-3">'+
					'<div style="line-height:100px;">'+
					 ' <img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">'+
					'</div> ' +
		          '<div class="media-body ml-3"><strong>'+customerName+'</strong>'+
		            '<div class="bg-light rounded py-2 px-3 mb-2">'+
		             ' <p class="text-small mb-0 text-muted">'+msg["messageCon"]+'</p>'+
		            '</div>'+
		            '<p class="small text-muted">'+datetime.toLocaleString()+'</p>'+
		          '</div>'+
		       ' </div>'



				
						$("#chating").prepend(div);	
					}

					})

			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		
		})

	}


function send() {

	
	
	var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName :"${user.customerName}",
			userNum:$("#userNum").val(),
			msg : $("#chatting").val(),
			roomNumber:$("#roomNumber").val()
			
		}

	ws.send(JSON.stringify(option))
	$('#chatting').val("");


	/* <div class="d-flex justify-content-start mb-4">
		<div class="img_cont_msg">
			<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
		</div>
		<div class="msg_cotainer">
			Bye, see you
			<span class="msg_time">9:12 AM, Today</span>
		</div>
	</div> */
}


function deleteRoom(){

$.ajax({
	type:"post",
	url:"/deleteRoom",
	data:JSON.stringify($("#roomNumber").val()),
	contentType:'application/json; charset=utf-8',
	dataType:"JSON",
	success:function(data){
		 location.reload()
}
})

}
$(function(){
	wsOpen()

	$('#action_menu_btn').click(function(){
		$('.action_menu').toggle();
	});

})

</script>
</head>

		      <div class="px-4 py-5 chat-box bg-white no-padding-top">
		      <!-- 	<div>더 가져오기</div> -->
		      <div class="chat-btn-area">
			      	<div class="more-chat">more</div>
			      	<div class="chat-setting"  >			      		 
	                    	<span id="action_menu_btn"><i class="fas fa-align-justify"></i></span>
							<div class="action_menu">
								<ul>
									<!-- <li><i class="fas fa-user-circle"></i> View profile</li>
									<li><i class="fas fa-users"></i> Add to close friends</li> -->
								<!-- 	<li><i class="fas fa-plus"></i> 초대하기</li> -->
									<li><a href="/deleteRoom?roomNumber=${roomNumber }"><i class="fas fa-trash delete-room" onclick="deleteRoom()"></i></a> 삭제</li>
								</ul>
							</div>	      	
			      </div>
		      </div>
		    	<div id="chating" >
			        <c:forEach items="${messageList }" var="message" varStatus="status">
						
						<c:choose>
							<c:when test="${message.customer.customerNum eq user.customerNum }">
									 <!-- 사용자-->
						        <div class="media w-50 ml-auto mb-3">
						          <div class="media-body">
						            <div class="bg-primary rounded py-2 px-3 mb-2">
						              <p class="text-small mb-0 text-white">${message.messageCon }</p>
						            </div>
						            <p class="small text-muted">
							            <fmt:parseDate value="${message.messageDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
							            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime }"  var="message_date"/>
							            ${message_date }
						            </p>
						          </div>
						        </div>
							
							</c:when>  
						 	<c:otherwise>
						 		  <div class="media w-50 mb-3"  >
							        <div style="line-height:100px;">
							        	<img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
							        </div>   
							          <div class="media-body ml-3"><strong>${message.customer.customerNum }</strong>
							            <div class="bg-light rounded py-2 px-3 mb-2">
							              <p class="text-small mb-0 text-muted">${message.messageCon }</p>
							            </div>
							            <p class="small text-muted">
							            	 <fmt:parseDate value="${message.messageDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
									         <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parsedDateTime }"  var="message_date"/>
									          ${message_date }
							            </p>
							        
							          </div>
							        
							        </div>
						 	</c:otherwise>
						</c:choose>			
						<c:if test="${status.last }">
							<c:set var="lastNum" value="${message.messageNum }"></c:set>
						</c:if>
				
				</c:forEach> 
		        </div>
		       </div>
		   <%--          <!-- Sender Message-->
		        <div class="media w-50 mb-3"  >
		        <div style="line-height:100px;">
		        <img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
		             </div>   
		          <div class="media-body ml-3"><strong>${message.customer.customerNum }</strong>
		            <div class="bg-light rounded py-2 px-3 mb-2">
		              <p class="text-small mb-0 text-muted">Test which is a new approach all solutions</p>
		            </div>
		            <p class="small text-muted">12:00 PM | Aug 13</p>
		        
		          </div>
		        
		        </div>
		
		        <!-- Reciever Message-->
		        <div class="media w-50 ml-auto mb-3">
		          <div class="media-body">
		            <div class="bg-primary rounded py-2 px-3 mb-2">
		              <p class="text-small mb-0 text-white">Test which is a new approach to have all solutions</p>
		            </div>
		            <p class="small text-muted">12:00 PM | Aug 13</p>
		          </div>
		        </div> --%>
	
      	

   
      <!-- Typing area -->
      <form action="#" class="bg-light"  onsubmit="return false">
        <div class="input-group">
          <input id="chatting" type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light">
          <div class="input-group-append">
            <div id="button-addon2"  onclick="send()" class="btn btn-link"> <i class="fa fa-paper-plane"></i></div>
          </div>
        </div>
      </form>
	<input type="hidden" value="" id="sessionId">
<input type="hidden" value="${roomNumber }" id="roomNumber">
<input type="hidden" value="${user.customerNum }" id="userNum">		        




<script type="text/javascript">

document.addEventListener("keypress", function(e){
	if(e.keyCode == 13){ //enter press
		send();
	}
});
</script>
