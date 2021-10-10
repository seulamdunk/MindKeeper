<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 코로나 현황 -->
<title>마음지킴이</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700"
	rel="stylesheet">

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
<link rel="stylesheet" href="css/weather/weather.css">
</head>
<body>

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
          ), url(../images/banner_corona.jpg); background-position-y:200%;">
          
          <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" style="margin-top: 50px;" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }" style="color:white;">코로나현황</h1>
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><span style="color:white;">코로나 현황을 확인하고 지역별 방역지침을 알아보세요<br>
그리고 달라진 상황을 받아들이고 생활 속에서 방역지침을 실천해주세요</span></p>
           </div>
        </div>
      </div>
      
</div>
<!-- 메인 배너 종료 -->

	
		<div class="container mt-5">
		<div class="col-4">
		</div>
		
			<div class="row center justify-content-center mb-5 pb-5" style="margin-top: 30px;">
			
			
			<div style="width: 100%; text-align: center; margin-bottom: 20px;">
			<h2 class="corona-title">코로나 총 확진자 수 <span style="color: red">${test[0].total}</span></h2>
			</div>
			<section class="ftco-section ftco-work">
				<table class="table caption-top">
					<thead>
						<tr>
							<th scope="col">지역</th>
							<th scope="col">전날대비증가량</th>
							<th scope="col">국내 발생</th>
							<th scope="col">해외 유입</th>
							<th scope="col">지역별 코로나 환자수</th>
							<th scope="col">격리 중</th>
							<th scope="col">격리 해제</th>
							<th scope="col">사망자</th>
							<th scope="col">발생률</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="test" items="${test }">
						<tr>
							<th>${test.country }</th>
							<td>${test.diffFromPrevDay }</td>
							<td>${test.d_outbreak }</td>
							<td>${test.o_inflow }</td>
							<td>${test.total }</td>
							<td>${test.in_quarantine }</td>
							<td>${test.q_release }</td>
							<td>${test.death }</td>
							<td>${test.incidence }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</section>
				
				<div class="row  mt-5 justify-conten-center">
					<img src="img\코로나 현황 크롤링0.png">
				</div>
				<div class="row  mt-5 justify-conten-center">
					<img src="img\코로나 현황 크롤링1.png">
				</div>
				<div class="row  mt-5 justify-conten-center">
					<img src="img\코로나 현황 크롤링3.png">
				</div>
				<div class="row  mt-5 justify-conten-center">
					<img src="img\코로나 현황 크롤링4.png">
				</div>
			</div>
		</div>
	


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>