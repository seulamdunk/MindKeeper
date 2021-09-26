<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
 <head>
    <title>Mind Keep - 날씨현황</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/weather/weather">
    
    <style>
	.label * {display: inline-block;vertical-align: top;}
	.label .left {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	.label .center {background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
	.label .right {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
	</style>
  
 </head>
 <body>
 	<%-- <c:forEach items="${test3 }" var=test>
    <input type='hidden' class='day_time' value='${test.city_weather }'>
    	
    </c:forEach> --%>
	<jsp:include page="navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="/">Home</a></span> <span>Team</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">날씨 현황</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
      <div class="container">
      <h1 style="text-align: center;">${test2.country }</h1>
      	<div class="row justify-content-center mb-5 pb-5 test1">
			<div id="map" style="width:900px; height:1000px;"></div>
		</div>
    	<div class="row">
    		<h2>${test2.day_time }</h2>
  			<h3>${test2.title }</h3>
  			
        <div class="row justify-content-center mb-5 pb-5 test1">
        	<p>
        	<h5>${test2.weather_content }</h5>
        	</p>
      </div>
     </div>
     </div>
    </section>

    
    <!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=12a1ea904d5ba7f7679a6aedc74e4913"></script>
  <script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.56381, 126.98171), // 지도의 중심좌표
		draggable: false,
		level: 13, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var data = [
		[37.96560565610974, 124.66992514856672, '<div class ="label"><span class="left"></span><span class="center">${test3[0] }</span><span class="right"></span></div>'],
		[37.55833029166853, 126.98781186361127, '<div class ="label"><span class="left"></span><span class="center">${test3[1] }</span><span class="right"></span></div>'],
		[37.88721562441267, 127.74254172440317, '<div class ="label"><span class="left"></span><span class="center">${test3[2] }</span><span class="right"></span></div>'],
		[37.72000269051544, 128.8645374109962, '<div class ="label"><span class="left"></span><span class="center">${test3[3] }</span><span class="right"></span></div>'],
		[36.337136709383465, 127.39481035412976, '<div class ="label"><span class="left"></span><span class="center">${test3[4] }</span><span class="right"></span></div>'],
		[36.62550886273778, 127.49819460346839, '<div class ="label"><span class="left"></span><span class="center">${test3[5] }</span><span class="right"></span></div>'],
		[35.82716510800298, 127.11546336164004, '<div class ="label"><span class="left"></span><span class="center">${test3[6] }</span><span class="right"></span></div>'],
		[35.863838906099666, 128.58272153789764, '<div class ="label"><span class="left"></span><span class="center">${test3[7] }</span><span class="right"></span></div>'],
		[35.15199621925454, 126.84225457499286, '<div class ="label"><span class="left"></span><span class="center">${test3[8] }</span><span class="right"></span></div>'],
		[35.15685147978738, 129.05188539266413, '<div class ="label"><span class="left"></span><span class="center">${test3[9] }</span><span class="right"></span></div>'],
		[33.39809260788402, 126.54827962215151, '<div class ="label"><span class="left"></span><span class="center">${test3[10] }</span><span class="right"></span></div>'],
		[37.36092612710671, 131.41304657927483, '<div class ="label"><span class="left"></span><span class="center">${test3[11] }</span><span class="right"></span></div>'],
		[37.27865825237089, 127.00748177106634, '<div class ="label"><span class="left"></span><span class="center">${test3[12] }</span><span class="right"></span></div>'],
		[36.57862029176811, 128.78039193458747, '<div class ="label"><span class="left"></span><span class="center">${test3[13] }</span><span class="right"></span></div>'],
		[34.81135203404336, 126.39245050863407, '<div class ="label"><span class="left"></span><span class="center">${test3[14] }</span><span class="right"></span></div>'],
		[34.76011083959945, 127.6626670923337, '<div class ="label"><span class="left"></span><span class="center">${test3[15] }</span><span class="right"></span></div>'],
		[35.54359459796801, 129.2550244292698, '<div class ="label"><span class="left"></span><span class="center">${test3[16] }</span><span class="right"></span></div>'] 
		];
	
	
	for(var i=0; i<data.length; i++){
		var customOverlay = new kakao.maps.CustomOverlay({
			position: new kakao.maps.LatLng(data[i][0], data[i][1]),
			content: data[i][2]
		}); 
		
		customOverlay.setMap(map);
	}

 </script>
</body>
</html>