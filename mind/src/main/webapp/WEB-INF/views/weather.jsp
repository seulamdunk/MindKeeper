<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
 <head>
 	<!-- 날씨 현황 -->
    <title>마음지킴이</title>
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
    
    <link rel="apple-touch-icon-precomposed" href="//nimg.nate.com/ui/uidev/images/mnews/common/nate_news_114.png">
    <link href="https://common.nate.com/css/common/SvcCommon_2020.css?v=2020120301" rel="stylesheet" type="text/css">
    

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/weather.css">
    
    <link rel="apple-touch-icon-precomposed" href="//nimg.nate.com/ui/uidev/images/mnews/common/nate_news_114.png">
  	<link rel="stylesheet" type="text/css" href="//nimg.nate.com/ui/uidev/pc/release/css/sisa/snb.css?202109291436">
  	<link rel="stylesheet" type="text/css" href="//nimg.nate.com/ui/uidev/pc/release/css/sisa/news_common.css?202109291436">
  	<link rel="stylesheet" type="text/css" href="//nimg.nate.com/ui/uidev/pc/release/css/sisa/new_weather.css?202109291436">
  	<link rel="stylesheet" type="text/css" href="//nimg.nate.com/ui/uidev/pc/release/css/weather/weather_motion.css?202109291436">
  	<link rel="stylesheet" type="text/css" href="//nimg.nate.com/ui/uidev/pc/release/css/pcsnb.css?202109291436">
  	<script type="text/javascript" src="//news.nate.com/etc/mobileAgentJs"></script>
  	<script type="text/javascript" src="//news.nate.com/js/weather.js?202108311331"></script>
  	<script src="//news.nate.com/js/graph.js?202108311331" charset="euc-kr"></script>
  	
  	
  	
  <script type="text/javascript" src="https://common.nate.com/js/CommonTextGNB_v20200305.js?ver=20210628_1" charset="utf-8"></script>
  <script type="text/javascript" src="//common.nate.com/textGNB/commonTextGNBV1"></script>
  <script type="text/javascript" src="https://common.nate.com/js/CommonTextGNB_v20200305.js?ver=20210628_1" charset="utf-8"></script>
  <script type="text/javascript" src="//news.nate.com/js/common.js?202108311331"></script>
  <script type="text/javascript" src="//news.nate.com/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" charset="euc-kr" src="//news.nate.com/js/stat.js?202108311331"></script>
 </head>
 <body>
 	<%-- <c:forEach items="${test3 }" var=test>
    <input type='hidden' class='day_time' value='${test.city_weather }'>
    	
    </c:forEach> --%>
	<jsp:include page="navbar.jsp"></jsp:include>
    <!-- END nav -->
    
<!-- 메인 배너 -->
<div class="hero-wrap hero-wrap-2" style="background-image:  linear-gradient(
            to bottom,
            rgba(0, 0, 0, 0.6),
            rgba(0, 0, 0, 0.6),
            rgba(0, 0, 0, 0.6),
            rgba(0, 0, 0, 0.6),
            rgba(0, 0, 0, 0.6)
          ), url(../images/banner_weather.jpg); background-position-y:200%;">
          
          <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" style="margin-top: 50px;" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }" style="color:white;">날씨현황</h1>
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><span style="color:white;">오늘의 날씨를 확인해보세요<br>
그리고 날이 좋은날 잠시 걸어보는건 어떨까요?</span></p>
           </div>
        </div>
      </div>
      
</div>
<!-- 메인 배너 종료 -->


	<div class="lb-widget">
		<div class="lb-main">
			<select class="beom" id="select-box">
				<option value="1">Seoul, 서울</option>
				<option value="2">Incheon, 인천</option>
				<option value="3">Daejeon, 대전</option>
				<option value="4">Gwangju, 광주</option>
				<option value="5">Daegu, 대구</option>
				<option value="6">Ulsan, 울산</option>
				<option value="7">Busan, 부산</option>
				<option value="8">Jeju, 제주</option>
			</select>
		</div>
		<div id="lb-1" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=37.5266&lon=127.0403&name=Seoul, 서울&color=&font=&units=si"></iframe>
		</div>
		<div id="lb-2" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=37.4496&lon=126.7074&name=Incheon, 인천&color=#F6A8A6&font=&units=si"></iframe>
		</div>
		<div id="lb-3" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=36.3512&lon=127.3954&name=Daejeon, 대전&color=#5BC065&font=&units=si"></iframe>
		</div>
		<div id="lb-4" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=35.1787&lon=126.8974&name=Gwangju, 광주(전남)&color=#A5C8E4&font=&units=si"></iframe>
		</div>
		<div id="lb-5" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=35.8759&lon=128.5964&name=Daegu, 대구&color=#C0ECCC&font=&units=si"></iframe>
		</div>
		<div id="lb-6" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=35.538&lon=129.324&name=울산&color=#F9F0C1&font=&units=si"></iframe>
		</div>
		<div id="lb-7" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=35.1334&lon=129.1058&name=부산&color=#BA55D3&font=&units=si"></iframe>
		</div>
		<div id="lb-8" class="lb-weather">
			<iframe
				src="https://forecast.io/embed/#lat=33.5007&lon=126.5288&name=제주&color=#ffc261&font=&units=si"></iframe>
		</div>
	</div>

	<section class="ftco-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-5 test1">
      		<div class="weather_country">
      			${test1 }
      		</div>
      	</div>
		</div>
    	<div class="row">
  			
        <div class="row justify-content-center mb-5 pb-5 test1">
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
  <script src="js/weather/weather.js"></script>
  <script type="text/javascript" charset="UTF-8" src="https://common.nate.com/js/data/liveKeywordStatus.js?v=20211092115"></script>
  <script type="text/javascript" charset="UTF-8" src="https://common.nate.com/js/rolling-jq-nj_https.js?v=20180820_01"></script>

</body>
</html>