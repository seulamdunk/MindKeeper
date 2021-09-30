<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../css/admin/popup/fontstyle.css">

    <link rel="stylesheet" href="../css/admin/popup/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/admin/popup/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../css/admin/popup/style.css">

</head>


<script>
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
</script>

<body>

 <div class="half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-6">
            <div class="form-block">
              <div class="text-center mb-5">
              <h3>Register</h3>
              
              </div>
              <form action="#" method="post">
                <div class="form-group first">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" placeholder="John Doe" id="name">
                </div>
                <div class="form-group first">
                  <label for="username">Email Address</label>
                  <input type="text" class="form-control" placeholder="your-email@gmail.com" id="username">
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" placeholder="Your Password" id="password">
                </div>
                <div class="form-group last mb-3">
                  <label for="re-password">Re-type Password</label>
                  <input type="password" class="form-control" placeholder="Re-type Your Password" id="re-password">
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Agree our <a href="#">Terms and Conditions</a></span>
                    <input type="checkbox" checked="checked"/>
                    
                  </label>
                  <span class="ml-auto"><a href="#" class="forgot-pass">Have an account? Login</a></span> 
                </div>

                <input type="submit" value="Register" class="btn btn-block btn-primary">

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    
</body>
</html>