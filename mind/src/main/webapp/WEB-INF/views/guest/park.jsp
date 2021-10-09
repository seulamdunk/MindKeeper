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


</head>

<body>
<!--********** nav 시작 **********-->
<jsp:include page="../navbar.jsp"></jsp:include>
<!--********** nav 종료 **********-->


<!--********** header 시작 **********--> 
<div class="hero-wrap hero-wrap-2" style="background-image: url(../images/banner_park.jpg);" data-stellar-background-ratio="0.5">
</div>
<!--********** header 종료 **********--> 

<br/><br/>

<!--********************* section 시작 *********************-->
<section class="ftco-section ftco-work">
	<div class="container-fluid-park">
        <div class="row">
        <!-- 지도 -->
        <div id="map" class="col-md-8" style="border:1px solid"></div>
        
        <!-- 검색 -->
        <div class="col-md-4" style="float:left;height:500px;">
		<div>
			<img src="../img/parkImg/rec_green.png" class="titleStyle_img"/> <span class="titleStyle">지역구분</span>
		</div>
		<div>
			<table class="col-md-12">
			<tr>
				<td><button type="button" class="button button1" id="Total" onclick="total()">전체</button></td>
				<td><button type="button" class="button button1" id="area" onclick="area()">서울</button></td>
				<td><button type="button" class="button button1" id="area" onclick="area()">인천</button></td>
				<td><button type="button" class="button button1" id="area" onclick="area()">경기도</button></td>
			</tr>
			<tr>
				<td><button type="button" class="button button1">부산</button></td>
				<td><button type="button" class="button button1">대구</button></td>
				<td><button type="button" class="button button1">대전</button></td>
				<td><button type="button" class="button button1">울산</button></td>
			</tr>
			<tr>
				<td><button type="button" class="button button1">충청남도</button></td>
				<td><button type="button" class="button button1">충청북도</button></td>
				<td><button type="button" class="button button1">전라남도</button></td>
				<td><button type="button" class="button button1">전라북도</button></td>
			</tr>
			<tr>
				<td><button type="button" class="button button1">광주</button></td>
				<td><button type="button" class="button button1">세종</button></td>
				<td><button type="button" class="button button1">경상남도</button></td>
				<td><button type="button" class="button button1">경상북도</button></td>
			</tr>
			<tr>
				<td><button type="button" class="button button1">강원도</button></td>
				<td><button type="button" class="button button1">제주도</button></td>
			</tr>
			</table>
		</div>
				
<br/>
				
		<div>
			<img src="../img/parkImg/rec_red.png" class="titleStyle_img"/> <span class="titleStyle">주소검색</span>
		</div>	
		<div>
			<input type="text" id="keyword" class="col-md-9" style="width:280px;float:left;" placeholder="입력해주세요.">
			<button type="button"  onclick="getKeyword()" id="keywordClick" class="button button12" style="float:right;width:100px;border-radius:5%">검색</button>
		</div>
		</div>
		<!-- 검색 종료 -->
    	</div>

<br/><br/>    
    	
    	<div class="container-fluid-park">
    	<!--*** 공원 목록 출력 시작 ***-->
		<div>
			<table  id="parkList_start" class="blueone" style="width:100%;margin-left: auto; margin-right: auto;">
			<tr>
				<th>공원이름</th>
				<th>주소</th>
				<th>평점</th>
				<th>후기</th>
				<th>리뷰</th>
				<th>상세보기</th>
			</tr>
			<tbody id="parkList">
			</tbody>
			</table>
		</div>
		<!--*** 공원 목록 출력 종료 ***-->
		
		<!-- 페이징 시작 -->
		<div class="row mt-5" align="center">
		<div class="col">
			<div class="block-27">
			<ul>
				<li><a href="#">&lt;</a></li>
			    <li class="active"><span>1</span></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#">&gt;</a></li>
			</ul>
			</div>
		</div>
		</div>
		<!-- 페이징 종료 -->
		
    	</div>
 
<br/><br/>
    	
		<!-- bx슬라이더 -->
    	<div id="container-fluid-park">
		<div class="banner_inner">
			<h2 style="color:black;">이번달 걷기 행사</h2>
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
		    		<a class="bx-prev" href=""><img src="../img/parkImg/previous.png" alt="이전버튼" style="width:45px;height:45px;"></a>
		    		<a class="bx-next" href=""><img src="../img/parkImg/next.png" alt="다음버튼" style="width:45px;height:45px;"></a>
		    	</div>
		    	</div>
		   		</div>
		</div>
		</div>
		<!-- bx슬라이더 종료 -->
	</div>
</section>
<!--********************* section 종료 *********************-->


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
<script src="../js/park/parkBtn.js"></script>
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