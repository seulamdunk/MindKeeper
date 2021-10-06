<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
		window.onload = function(){
			
			getRoom();
			createRoom();
		}

		function getRoom(){
	 
			$.ajax({
					url:"/getRoom",
					type:"post",
					dataType:"JSON",
					success:function(result){
					//alert(JSON.stringify(result[0]["chatRoom"].roomName))
					createChatingRoom(result);
						}
				}) 	
		}


		function createRoom(){
			$("#createRoom").click(function(){

				if( $('#roomName').val() != null	){
					
				var msg = {	roomName : $('#roomName').val()	};

				commonAjax('/createRoom', msg, 'post', function(result){
					createChatingRoom(result);
				});

				$("#roomName").val("");
				}
			});
		
		}
	/* 	function goRoom(number, name){
			
		 	location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number; 
		} */

		function createChatingRoom(res){
			if(res[0] != null || res[0] =="undefined"){
			
				var tag ='';
				res.forEach(function(d){
					
					var rn = d["chatRoom"].roomName;
					
				
		
/* 					
					tag += '<li class="chatRoomItem">' +
									'<div class="d-flex bd-highlight">'+
									'<div class="img_cont">'+
										'<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">'+
										'<span class="online_icon"></span>'+
									'</div>'+
								'	<div class="user_info">'+
										'<span>'+rn+'</span>'+
										'<p>Kalid is online</p>'+
									'</div>'+
								'</div>'+
								'<input type="hidden"value="'+d["chatRoom"].roomNumber +'" class="roomNum"  >'+
								'<input type="hidden"value="'+d["chatRoom"].roomName +'" class="roomName"  >'+
							'</li>';	
				}); */


				tag += 			
				'<a target="talk-frame" href="/moveChating?roomNumber='+d["chatRoom"].roomNumber+'" class="list-group-item list-group-item-action list-group-item-light rounded-0">'+
				
	              '<div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">'+
	                '<div class="media-body ml-4">'+
	                  '<div class="d-flex align-items-center justify-content-between mb-1">'+
	                   ' <h6 class="mb-0">'+rn+'</h6>'+/* <small class="small font-weight-bold">25 Dec</small> */
	                  '</div>'+
	                 ' <p class="font-italic mb-0 text-small">참가명단</p>'+
	                '</div>'+
	             ' </div>'+
	            '</a>';

		
				$("#roomList").empty().append(tag);
				});
			}
		}

		function commonAjax(url, parameter, type, calbak, contentType){
			$.ajax({
				url: url,
				data: parameter,
				type: type,
				contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
				success: function (res) {
					calbak(res);
				},
				error : function(err){
					console.log('error');
					calbak(err);
				}
			})
		}	
		

	

</script> 


	</head>
	<!--Coded With Love By Mutiullah Samim-->
	<body>
	
	<div class="container py-5 px-4">
  <!-- For demo purpose-->
  <header class="text-center">
    <h1 class="display-4 text-white">마음지킴이</h1>
    <p class="text-white lead mb-0"></p>
    <p class="text-white lead mb-4">
    
    </p>
  </header>

  <div class="row rounded-lg overflow-hidden shadow">
    <!-- Users box-->
    <div class="col-5 px-0">
      <div class="bg-white">

        <div class="bg-gray px-4 py-2 bg-light">
          <p class="h5 mb-0 py-1">Recent</p>
        </div>

        <div class="messages-box " id="roomList">
          <div class="list-group rounded-0">
         
        
   <!--          <a class="list-group-item list-group-item-action active text-white rounded-0">
              <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
                <div class="media-body ml-4">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="mb-0">Jason Doe</h6><small class="small font-weight-bold">25 Dec</small>
                  </div>
                  <p class="font-italic mb-0 text-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                </div>
              </div>
            </a>

                <a href="#" class="list-group-item list-group-item-action list-group-item-light rounded-0">
              <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
                <div class="media-body ml-4">
                  <div class="d-flex align-items-center justify-content-between mb-1">
                    <h6 class="mb-0">Jason Doe</h6><small class="small font-weight-bold">14 Dec</small>
                  </div>
                  <p class="font-italic text-muted mb-0 text-small">Lorem ipsum dolor sit amet, consectetur. incididunt ut labore.</p>
                </div>
              </div>
            </a> -->

   

          </div>
        </div>
      </div>
    </div>
    <!-- Chat Box-->
    <div class="col-7 px-0">
     	<div class="chatArea" >
          	<iframe class="chat-if talk-frame" name="talk-frame" id="talk-frame" src="./chat-detail"></iframe>
         
          </div>
    </div>
    
    
<!--     <div class="col-7 px-0">
      <div class="px-4 py-5 chat-box bg-white">
        Sender Message
        <div class="media w-50 mb-3"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
          <div class="media-body ml-3">
            <div class="bg-light rounded py-2 px-3 mb-2">
              <p class="text-small mb-0 text-muted">Test which is a new approach all solutions</p>
            </div>
            <p class="small text-muted">12:00 PM | Aug 13</p>
          </div>
        </div>

        Reciever Message
        <div class="media w-50 ml-auto mb-3">
          <div class="media-body">
            <div class="bg-primary rounded py-2 px-3 mb-2">
              <p class="text-small mb-0 text-white">Test which is a new approach to have all solutions</p>
            </div>
            <p class="small text-muted">12:00 PM | Aug 13</p>
          </div>
        </div>

      

      </div>

      Typing area
      <form action="#" class="bg-light">
        <div class="input-group">
          <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light">
          <div class="input-group-append">
            <button id="button-addon2" type="submit" class="btn btn-link"> <i class="fa fa-paper-plane"></i></button>
          </div>
        </div>
      </form>

    </div> -->
  </div>
</div>
	<%-- 	<div class="container-fluid h-100">
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
	</body> --%>

</html>

