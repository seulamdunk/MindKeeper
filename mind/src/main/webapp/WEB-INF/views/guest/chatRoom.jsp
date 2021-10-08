<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마음지킴이</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		 <link rel="stylesheet" href="../custom/chat.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
		    <script src="../js/popper.min.js"></script>
		   <script src="../js/bootstrap.min.js"></script>
		    
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
	function goRoom(number, name){
		
		location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	}

	function createChatingRoom(res){
		if(res[0] != null || res[0] =="undefined"){
		
			var tag ='';
			res.forEach(function(d){
				
				var rn = d["chatRoom"].roomName;
				
			
	
				
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
			});
			$("#roomList").empty().append(tag);
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
		});
	}

//방만들기 + 버튼
	$(function(){
		$('#creatRoomToggle').click(function(){
			
			$("#CRIArea").toggle()
		/* 	$("#CRIArea").removeClass("disNone")

			},function(){
				$("#CRIArea").addClass("disNone") */

				})
		$(document).on('dblclick',".chatRoomItem",function(){
			
			let roomNum =$(this).find(".roomNum").val()
			let roomName = $(this).find(".roomName").val()
		
			goRoom(roomNum,	roomName )
			})
			
		})

	
</script>

</head>
<body>
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
			
			 <div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="Search..." name="" class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
					<div class="card-body contacts_body">
						<ui class="contacts" id="roomList">
			
						</ui>
					</div>
					<div class="card-footer">
						<span id="creatRoomToggle">➕</span>
						<div id="CRIArea" class="disNone">
								<div><input id="roomName" maxlength=20><div id="createRoom"class="fas fa-location-arrow"></div></div>
						
						</div>
					</div>
				</div></div> 
			
			</div>
		</div>
	</body>
</html>