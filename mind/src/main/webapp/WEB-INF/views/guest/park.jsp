<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
<!--****************** parkCSS 추가 *****************-->
<link rel="stylesheet" href="../css/park/parkCSS.css">
<!--***********************************************-->
</head>

<body>
<!--********** nav 시작 **********-->
<jsp:include page="../navbar.jsp"></jsp:include>
<!--********** nav 종료 **********-->


<!--********** header 시작 **********--> 
<div class="hero-wrap hero-wrap-2" style="background-image: url(../images/bg_2.jpg);" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="/">Home</a></span> <span>Search</span></p>
            <h1 class="mb-3 bread" style="radius:50px;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">공원 알림</h1>
          </div>
        </div>
     </div>
</div>
<!--********** header 종료 **********--> 
		
<!--********************* section 시작 *********************-->
<section class="ftco-section contact-section ftco-degree-bg">
	<div class="container">
		<div class="row d-flex mb-5 contact-info">
	    	<div class="col-md-12 mb-4">
	
	
	         
	<!--*** 지도 DIV 시작 ***-->
	
	<div class="map_wrap">
		<div id="map" class="col-md-8" style="height:100%;position:relative;overflow:hidden;float:left;"></div>
		
<!-- 검색&목록 DIV 시작 -->	
<div class="col-md-4" style="float:right;">

			<!--*** 공원 검색 시작 ***-->
			<div class="col-md-12" style="width:300px;float:center;">
				<form action="/guest/parkSearch" method="post" class="subscribe-form">
					<div class="form-group d-flex">
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="입력해주세요.">
						<input type="submit" value="검색" class="submit px-3">
					</div>
					</form>
			</div><br/>
			<!--*** 공원 검색 종료 ***-->
			
			<!--*** 공원 목록 출력 시작 ***-->
			<div id="parkList" style="overflow:auto;width:300px;height:430px;padding:10px;">
				<c:forEach items="${parkList }" var="parkList">
				<div class="wrap">
					<div style="font-weight: bold;">${parkList.parkName }</div>
			    	<div>
			    		<img class="parkScoreImg" src="../img/parkImg/parkScoreImg.png" alt="평점 이미지" width="18" height="18">${parkList.parkScore } ,
			    		후기 : <a href="${parkList.parkScoreLink }" target="_blank" class="parkLink" style="color:#007bff;">${parkList.parkScoreCnt }</a> ,
			    	 	리뷰 : <a href="${parkList.parkReviewLink }" target="_blank" class="parkLink" style="color:#007bff;">${parkList.parkReview }</a>
			    	</div>
			     	<div>${parkList.parkAddr }</div>
					<div><a href="${parkList.parkLink }" target="_blank" class="parkLink" style="color:#007bff;">상세보기 ></a></div>
				</div>
				<hr>
				</c:forEach>
			</div>
			<!--*** 공원 목록 출력 종료 ***-->   
</div>
<!-- 검색&목록 DIV 종료 -->
		 
	</div>
	<!--*** 지도 DIV 종료 ***-->

			</div>
		</div>
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
<script>

</script>
    
</body>
</html>