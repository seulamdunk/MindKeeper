
function Request(){
	 var requestParam ="";
	 //getParameter 펑션
	  this.getParameter = function(param){
	  //현재 주소를 decoding
	  var url = unescape(location.href);
	  //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
	   var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
	   for(var i = 0 ; i < paramArr.length ; i++){
	     var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	     if(temp[0].toUpperCase() == param.toUpperCase()){
	       // 변수명과 일치할 경우 데이터 삽입
	       requestParam = paramArr[i].split("=")[1];
	       break;
	     }
	   }
	   return requestParam;
	 }
	}
var request = new Request();
var num=request.getParameter("num")

customerDetail()

//회원목록 가져오기
function customerDetail(){
	$.ajax({
	type:"GET",
	url:"../customerDetail/"+num,
	success:function(result){
        var info= result;
		$('#customerID').val(info.customerID)
		$('#customerName').val(info.customerName)
		$('#customerNick').val(info.customerNick)
		$('#phoneNum').val(info.phoneNum)
		$('#createDate').val(info.createDate)
		$('#createDate').val(info.createDate.substring(0,10))

		//user이면 옵션 user 선택 , admin이면 admin 선택
		if(info.roles=="ROLE_USER"){
		$('#roles').val('ROLE_USER').prop("selected",true);
		}else if(info.roles=="ROLE_ADMIN"){
		$('#roles').val('ROLE_ADMIN').prop("selected",true);
		}else{
		$('#roles').val('ROLE_GUEST').prop("selected",true);
		}
	},
	error:function(err){
		console.log("회원목록 가져오기 에러 : " + err)
	}
	})
	$.ajax({
		type:"GET",
		url:"../customerTalkCount/"+num,
		success:function(result){
			$('#customerTalkCount').val(result+" 개")
		},
		error:function(err){
			alert("게시글 수 오류")
		}
	})	
	
}

//권한 변경하기
function changerole(){
	var role=$('#roles').val()
	var params={customerNum:num,
				role:role}
	console.log(params)
	$.ajax({
		type:"POST",
		url:"../changerole",
		contentType:'application/json; charset=utf-8',
		data:JSON.stringify(params),
		success:function(result){
			if(result==1){
			alert("권한 변경 완료")
			customerDetail()
			}
		},
		error:function(err){
			console.log(err)
		}
	})
	
}

//창 닫기
function exit(){
	window.close()
}
