<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
						let div = '<div class="d-flex justify-content-end mb-4">'+
						'<div class="img_cont_msg">'+
						'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
					'</div>'+
					'<div class="msg_cotainer_send">'+
					'<p class="me">나 :' + d.msg + '</p>'+
						'<span class="msg_time">'+today.toLocaleString()+'</span>'+
				'	</div>'+
				'</div>';
					
						$("#chating").append(div);	
					}else{
						let div = '<div class="d-flex justify-content-start mb-4">'+
						'<div class="img_cont_msg">'+
						'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
					'</div>'+
					'<div class="msg_cotainer">'+
					'<strong>'+d.userName +'</strong>'+
					'<p class="others">' +d.msg + '</p>'+
						'<span class="msg_time">'+today.toLocaleString()+'</span>'+
				'	</div>'+
				'</div>';
				
						$("#chating").append(div);
					}
					messageSave(data)
				}else{
					console.warn("unknown type!")
				}
				
			}
			
			
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}


	function messageSave(data){
	let d= JSON.parse(data.data)	

	let saveData ={
			"msg" :d.msg,
			"roomNumber" :d.roomNumber,
			"userNum":d.userNum
				}
		alert(saveData.msg)
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
							let div = '<div class="d-flex justify-content-end mb-4">'+
							'<div class="img_cont_msg">'+
							'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
						'</div>'+
						'<div class="msg_cotainer_send">'+
						'<p class="me">나 :' + msg["messageCon"] + '</p>'+
							'<span class="msg_time">'+datetime.toLocaleString()+'</span>'+
					'	</div>'+
					'</div>';
						
							$("#chating").prepend(div);	
						}else{
							let div = '<div class="d-flex justify-content-start mb-4">'+
							'<div class="img_cont_msg">'+
							'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">'+
						'</div>'+
						'<div class="msg_cotainer">'+
						'<strong>'+d["customer"].customerName +'</strong>'+
						'<p class="others">' +msg["messageCon"] + '</p>'+
							'<span class="msg_time">'+datetime.toLocaleString()+'</span>'+
					'	</div>'+
					'</div>';
					
							$("#chating").prepend(div);	
						}

						})
						


				
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			
			})

		}





	
/* 	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	} */

	function send() {
		
		var option ={
				type: "message",
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				msg : $("#chatting").val(),
				roomNumber:$("#roomNumber").val(),
				userNum:$("#userNum").val()
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
</script>
	</head>
	<!--Coded With Love By Mutiullah Samim-->
	<body>
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
			
			
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
								<input type="hidden" id="roomNumber" value="${chatRoom.roomNumber }">
									<span>${chatRoom.roomName }</span>
									<p>1767 Messages</p>
								</div>
								<!-- <div class="video_cam">
									<span><i class="fas fa-video"></i></span>
									<span><i class="fas fa-phone"></i></span>
								</div> -->
							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
							<!-- <div class="action_menu">
								<ul>
									<li><i class="fas fa-user-circle"></i> View profile</li>
									<li><i class="fas fa-users"></i> Add to close friends</li>
									<li><i class="fas fa-plus"></i> Add to group</li>
									<li><i class="fas fa-ban"></i> Block</li>
								</ul>
							</div> -->
						</div>
						<div class="card-body msg_card_body "  >
						<div id="chating" class="chating"></div>
						
						</div>
						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
								</div>
								<input type="hidden" id="sessionId" value="">
								<input type="hidden" id="userNum" value="${user.customerNum }">
								<input type="hidden" id="userName" value="${user.customerName }">					
								<textarea name="" id="chatting" class="form-control type_msg" placeholder="Type your message..."></textarea>
								<div class="input-group-append">
									
									<span class="input-group-text send_btn" onclick="send()" id="sendBtn" ><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
wsOpen()
getMessageList(300,5)
</script>
</html>

