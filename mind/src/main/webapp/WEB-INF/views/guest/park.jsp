<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 주위 공원 알림 페이지 -->
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 마음기르기 -->
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
    
<!--****************** parkCSS 추가 *****************-->
<link rel="stylesheet" href="../css/park/parkCSS.css">
<!--***********************************************-->

<!-- **************** 로드뷰 css 추가 (시작) **************** -->
<style>
#container {overflow:hidden;height:300px;position:relative;}
#mapWrapper {width:100%;height:300px;z-index:1;}
#rvWrapper {width:50%;height:300px;top:0;right:0;position:absolute;z-index:0;}
#container.view_roadview #mapWrapper {width: 50%;}
#roadviewControl {position:absolute;top:5px;left:5px;width:42px;height:42px;z-index: 1;cursor: pointer; background: url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png) 0 -450px no-repeat;}
#roadviewControl.active {background-position:0 -350px;}
#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
#close .img {display: block;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}
</style>
<!-- **************** 로드뷰 css 추가 (종료) **************** -->



</head>

<body>
<!--********** nav 시작 **********-->
<jsp:include page="../navbar.jsp"></jsp:include>
<!--********** nav 종료 **********-->


<!--********** header 시작 **********--> 
<div class="hero-wrap hero-wrap-2" style="background-image: url(../images/banner_park.jpg);" data-stellar-background-ratio="0.5">
</div>
<!--********** header 종료 **********--> 
		
<br/><br/><br/><br/>

<!--********************* section 시작 *********************-->
<section class="ftco-section contact-section ftco-degree-bg">

	<div class="container">
		<div class="row d-flex mb-5 contact-info">
	    	<div class="col-md-12 mb-4">
	         
	<!--*** 지도 DIV 시작 ***-->
	<div id="container" style="height:500px;">
	    <div id="rvWrapper">
	        <div id="roadview" style="width:100%;height:500px;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
	        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
	    </div>
	    <div id="mapWrapper">
	        <div id="map" style="width:100%;height:500px;"></div> <!-- 지도를 표시할 div 입니다 -->
	        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
	    </div>
	</div>
<!--*** 지도 DIV 종료 ***-->

<br/>

<!-- 검색&목록 DIV 시작 -->	
<div class="col-md-4" style="float:left;" >

			<!--*** 공원 검색 시작 ***-->
			<div class="col-md-12" style="float:center;">
					<div class="form-group d-flex">
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="입력해주세요.">
						<button type="button"  onclick="getKeyword()" id="keywordClick" class="btn btn-primary px-4 py-3">검색</button>
					</div>
			</div>
			<!--*** 공원 검색 종료 ***-->
			
			<br/>
			
			<!--*** 공원 목록 출력 시작 ***-->
			<div id="parkList" class="col-md-12" style="overflow:auto;height:430px;padding:10px;"></div>
			<!--*** 공원 목록 출력 종료 ***-->
			
</div>
<!-- 검색&목록 DIV 종료 -->

<!-- iframe 시작 -->
<div class="col-md-8" style="float:right;">
    <embed id="iframeUrl" width="100%" height="520px" src="../img/parkImg/mindImg2.png" style="border:1px solid #e9e9e9;">
</div>
<!-- iframe 종료 -->

			</div>
		</div>
	</div>
	
<br/><br/>

<div id="banner">
	 <div class="banner_inner">
	  <h2>이번달 걷기 행사</h2>
	   <div id="banner_list">
	    <ul class="sec3_list">
	     <li>
	      <span><img src="../img/parkImg/walkevent.jpg" alt="행사"></span>
	       <dl>
	        <dt>MIRUN SEOUL UNTACT RACE 2021</dt>
	        <dd>레포츠<br>2021.10.01. (금) ~ 2021.10.07. (목)</dd>
	       </dl>
	     </li>
	     <li>
	      <span><img src="../img/parkImg/walkevent2.jpg" alt="행사"></span>
	       <dl>
	        <dt>사랑 하나 오티즘 버츄얼레이스</dt>
	        <dd>레포츠<br>2021.10.04. (월) ~ 2021.10.11. (월)</dd>
	       </dl>
	     </li>
	     <li>
	      <span><img src="../img/parkImg/walkevent3.jpg" alt="행사"></span>
	       <dl>
	        <dt>하이브리드 한강나이트워크42K</dt>
	        <dd>레포츠<br>2021.10.01. (금) ~ 2021.10.17. (일)</dd>
	       </dl>
	     </li>
	     <li>
	      <span><img src="../img/parkImg/walkevent4.jpg" alt="행사"></span>
	       <dl>
	        <dt>2021 세이브더칠드런 R untact 국제어린이마라톤</dt>
	        <dd>레포츠<br>2021.10.08. (금) ~ 2021.10.10. (일)</dd>
	       </dl>
	     </li>
	     <li>
	      <span><img src="../img/parkImg/walkevent5.jpg" alt="행사"></span>
	       <dl>
	      	<dt>엘르런 ELLE RUN</dt>
	      	<dd>레포츠<br>2021.10.09. (토) ~ 2021.10.10. (일)</dd>
	       </dl>
	     </li>
	     <li>
	      <span><img src="../img/parkImg/walkevent6.jpg" alt="행사"></span>
	       <dl>
	        <dt>2021 옥스팜 버추얼워커 50K</dt>
	        <dd>레포츠<br>2021.10.11. (월) ~ 2021.11.21. (일)</dd>
	       </dl>
	     </li>
	    </ul>
	    <div class="bx-controls bx-has-controls-direction">
	    	<div class="bx-controls-direction">
	    		<a class="bx-prev" href=""><img src="../img/parkImg/previous.png" alt="이전버튼" style="width:48px;height:48px;"></a>
	    		<a class="bx-next" href=""><img src="../img/parkImg/next.png" alt="다음버튼" style="width:48px;height:48px;"></a>
	    	</div>
	    </div>
	   </div>
	  </div>
	</div>

</section>
<!--********************* section 종료 *********************-->

<br/><br/><br/>

<!--*************** footer 시작 ***************-->
<jsp:include page="../footer.jsp"></jsp:include>
<!--*************** footer 종료 ***************-->

<!--********************************** 지도 script 시작 ***************************************-->
<!-- 부트스트랩 이용을 위한 jQuery와 CDN -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 카카오 javaScriptKey -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a2c6577da696f87c0359d059fa9c8a7"></script>
<script src="../js/park/parkMap.js"></script>
<!--*********************************** 지도 script 종료 ***************************************-->
	
<!--********** script 시작 **********-->
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
<!--********** script 시작 **********-->

<!-- *************** bxslider script 시작**************** -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src=" http://bxslider.com/lib/jquery.bxslider.js "></script>
<script type="text/javascript">
$(document).ready(function(){
	var mySlider =$('.sec3_list').bxSlider({
		 auto:true,
		 pager: false,
		 controls: false, 
		 autoControls: false, 
		 minSlides: 4, 
		 maxSlides: 4, 
		 moveSlides: 1, 
		 slideWidth: 285, 
		 slideMargin: 20, 
		 autoHover:true,
		 prevText:"", 
		 nextText:"",
		 speed: 500
	});

	// 이전버튼
    $(".bx-prev").on("click", function(){
        // 이전 슬라이드 배너로 이동
        mySlider.goToPrevSlide();
        // <a>의 링크를 차단
        return false;
    });
    
    // 다음버튼
    $(".bx-next").on("click", function(){
        // 다음 슬라이드 배너로 이동
        mySlider.goToNextSlide();
        // <a>의 링크를 차단
        return false;
    });
    
});
</script>
<!-- *************** bxslider script 종료**************** -->
    
</body>
</html>