<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Ultim8 - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/signup.css">
  </head>
  <body>
    
<c:if test="${cookie.token.value!=null}">
    	<c:redirect url="i!ndex"/>
</c:if>
	 <jsp:include page="../navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url(../images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">회원가입</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light">
  		<div class="container">
        <div class="row">
          <div class="col-md-12">
            <form method="post">
              <!-- <h1> Sign Up </h1> -->
              
              <fieldset>
                
                <legend>회원가입</legend>
              
                <label for="CustomerID">아이디:</label>
                <input type="text" id="customerID">
				<p id="idCheckresult" style="color:red;"></p>
				
                <label for="CustomerPW">비밀번호:</label>
                <input type="password" id="customerPW">

                <label for="CustomerPWR">비밀번호 확인:</label>
                <input type="password" id="customerPWR">

                <label for="Customer_Name">이름:</label>
                <input type="text" id="customerName">

                <label for="Customer_Nick">닉네임:</label>
                <input type="text" id="customerNick">
              	<p id="nickCheckresult" style="color:red;"></p>
              	
                <label for="identity_Num">생년월일:</label>
                <input type="text" id="identityNum" pattern="[0-9]+" style="width:40%" maxlength="6">-
                <input type="text" id="identityNumAfter" pattern="[1-4]+" style="width:10%" maxlength="1">
                <input type="text" value="# 　#　 #　 #　 #　 #" readonly style="width:45.5%">
             	
                <label for="phone_Num">전화번호:</label>
                <input type="text" id="phoneNum">
              
              
              </fieldset>
  
             
              <input type="button" onclick="signup();" class="btn btn-primary"  value="회원가입"></input>
              
             </form>
              </div>
            </div>
          </div>
    </section>
    
<!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>

  <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
  <script src="../js/guest/signup.js"></script>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>