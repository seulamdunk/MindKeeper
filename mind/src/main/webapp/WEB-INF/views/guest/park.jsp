<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 주위 공원 알림 페이지 -->
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
    
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   
   <!-- 반경 정보 css 시작 -->
   <style>
	.info {position:relative;top:5px;left:5px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;font-size:12px;padding:5px;background:#fff;list-style:none;margin:0;color:#black;} 
	.info:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.info .label {display:inline-block;width:50px;}
	.number {font-weight:bold;color:#00a0e9;} 
   </style>
   <!-- 반경 정보 css 종료 -->
  </head>
  <body>
    
	 <jsp:include page="../navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
            <h1 class="mb-3 bread" style="radius:50px;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">공원 알림</h1>
          </div>
        </div>
      </div>
    </div>
		
		<!-- section 시작 -->
		<section class="ftco-section contact-section ftco-degree-bg">
		


	      <div class="container">
	        <!-- <div class="row d-flex mb-5 contact-info"> -->
	          <div class="col-md-12 mb-4">
	            <h2 class="h4" style="align:center">주변 공원 찾기 </h2>
	            	<!-- 부트스트랩 primary 버튼 -->
	            	<div>
					<button type="button" class="btn btn-primary py-2 px-2" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>
	       	 		</div>
	          </div>
	          
			 <!-- 지도 시작 -->
	          <div class="map_wrap">
				    <!-- 지도 띄우기 -->
				    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a2c6577da696f87c0359d059fa9c8a7"></script>
					<div id="map" style="width:100%;height:500px;"></div>
	       	 </div>
	       	 <!-- 지도 종료 -->
	      </div>
   		</section>
   		<!-- section 종료 -->



    <jsp:include page="../footer.jsp"></jsp:include>

	<!-- 지도 script 시작 -->
  	<!-- 카카오 javaScriptKey -->
	
	<!-- 부트스트랩 이용을 위한 jQuery와 CDN -->
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="../js/maps.js"></script>
	<!-- 지도 script 종료 -->
	
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
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>