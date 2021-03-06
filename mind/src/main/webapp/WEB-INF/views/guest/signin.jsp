<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<!-- 로그인 -->
    <title>마음지킴이</title>
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
    	<c:redirect url="index"/>
</c:if>
	 <jsp:include page="../navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" data-stellar-background-ratio="0.5">
      <div class="container-fluid">
      <div style="width: 600px; margin: 0 auto; margin-top: 100px">
      <img src="../images/login_logo.png" style="width: 100%" />
      </div>
         <!-- 
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> </p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">로그인</h1>
          </div>
           -->
           

      </div>
    </div>

    <section class="ftco-section bg-light" style="margin-bottom: 100px;">
  		<div class="container">
        <div class="row">
          <div class="col-md-12">
            <form action="#" method="post" id="login_form">
              <!-- <h1> Sign In </h1> -->
              
              <fieldset>
                
                <legend>로그인</legend>
              
                <label for="name">ID:</label>
                <input type="text" id="customerID">
              
                <label for="password">Password:</label>
                <input type="password" id="customerPW" onkeyup="enterkey()">
              
              </fieldset>
              <a href="signup" style="float: right;"> 회원가입 ></a>

             <input type="button" onclick="signin();" value="로그인" class="btn btn-primary px-5 py-3" style="width: 150px; margin: 0 auto; margin-top: 50px;
    display: flex;"></input>

              
             </form>
              </div>
            </div>
          </div>
    </section>
    
<!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>

  <script src="../js/guest/signin.js"></script>
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