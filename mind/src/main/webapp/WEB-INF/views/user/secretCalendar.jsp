<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Elen - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">

<link rel="stylesheet"
	href="../css/mypage/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/mypage/css/animate.css">

<link rel="stylesheet" href="../css/mypage/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../css/mypage/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/mypage/css/magnific-popup.css">

<link rel="stylesheet" href="../css/mypage/css/aos.css">

<link rel="stylesheet" href="../css/mypage/css/ionicons.min.css">

<link rel="stylesheet" href="../css/mypage/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/mypage/css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/mypage/css/flaticon.css">
<link rel="stylesheet" href="../css/mypage/css/icomoon.css">
<link rel="stylesheet" href="../css/mypage/css/style.css">

<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<link rel="stylesheet" href="../css/mypage/css/secretCalendar.css">



<link rel="stylesheet" href="../css/mypage/calendar/css/clndr.css"
	type="text/css" />
</head>

<body>


	<div id="colorlib-page">


		<!-- navbar -->
		<jsp:include page="myPage-navbar.jsp">
			<jsp:param value="${user.customerNum }" name="customerNum" />
		</jsp:include>
		
		<div id="colorlib-main">
<div>${user.customerNum }dddddddddddddddddds</div>
			<!-- 메인 -->
			<section class="home-slider js-fullheight owl-carousel">
				<div class="slider-item js-fullheight"
					style="background-image: url(../images/calendar.jpg);">
					<div class="overlay"></div>
					<div class="container-fluid">
						<div
							class="row no-gutters slider-text slider-text-2 js-fullheight align-items-center justify-content-center"
							data-scrollax-parent="true">
							<div id="jindan3" class="col-md-10 text-center ftco-animate"
								data-scrollax=" properties: { translateY: '70%' }">
								<h1 class="mb-4"
									data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Color
									Calendar</h1>
								<p
									data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">오늘
									하루는 어떠셨어요? 오늘의 감정을 한줄로 적어보세요</p>
									<p id="jindan2"></p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- end of 메인 -->

			<section class="ftco-section-calendar">
				<div class="photograhy">

					<div class="slide">

						<!--banner-Slider-->
						<script src="js/responsiveslides.min.js"></script>
						<script>
							// You can also use "$(window).load(function() {"
							$(function() {
								// Slideshow 4
								$("#slider4")
										.responsiveSlides(
												{
													auto : true,
													pager : true,
													nav : false,
													speed : 500,
													namespace : "callbacks",
													before : function() {
														$('.events')
																.append(
																		"<li>before event fired.</li>");
													},
													after : function() {
														$('.events')
																.append(
																		"<li>after event fired.</li>");
													}
												});

							});
						</script>
						<div class="clear"></div>
						<ul class=" side-icons">
							<li><a class="fb" href="#"></a></li>
							<li><a class="twitt" href="#"></a></li>
							<li><a class="goog" href="#"></a></li>
						</ul>

					</div>


					<div class="mini-cal">
						<div class="calender">
							<div class="column_right_grid calender">
								<div class="cal1">
									<div class="clndr">
										<div class="clndr-controls">
											<div class="clndr-control-button">
												<p class="clndr-previous-button">previous</p>
											</div>
											<div class="month">September 2015</div>
											<div class="clndr-control-button rightalign">
												<p class="clndr-next-button">next</p>
											</div>
										</div>
										<table class="clndr-table" border="0" cellspacing="0"
											cellpadding="0">
											<thead>
												<tr class="header-days">
													<td class="header-day">S</td>
													<td class="header-day">M</td>
													<td class="header-day">T</td>
													<td class="header-day">W</td>
													<td class="header-day">T</td>
													<td class="header-day">F</td>
													<td class="header-day">S</td>
												</tr>
											</thead>
											<tbody id="calendar">
												<tr>
													<td
														class="day past adjacent-month last-month calendar-day-2015-08-30">
														<div class="day-contents" id="day_30">30</div></td>
													<td class="day past adjacent-month last-month calendar-day-2015-08-31">
														<div class="day-contents" id="day_30">31</div>
													</td>
													<td class="day past calendar-day-2015-09-01"><div
															class="day-contents" id="day_1">1</div></td>
													<td class="day past calendar-day-2015-09-02"><div
															class="day-contents" id="day_2">2</div></td>
													<td class="day past calendar-day-2015-09-03">
													<div class="day-contents" id="day_3">3</div></td>
													<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">4</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">5</div></td>
												</tr>
												<tr>
													<td class="day past calendar-day-2015-09-06"><div
															class="day-contents" id="day6">6</div></td>
													<td class="day past calendar-day-2015-09-07"><div
															class="day-contents" id="day">7</div></td>
													<td class="day past calendar-day-2015-09-08"><div
															class="day-contents" id="day">8</div></td>
													<td class="day past calendar-day-2015-09-09"><div
															class="day-contents" id="day">9</div></td>
													<td class="day past event calendar-day-2015-09-10"><div
															class="day-contents" id="day">10</div></td>
													<td class="day past event calendar-day-2015-09-11"><div
															class="day-contents" id="day">11</div></td>
													<td class="day past event calendar-day-2015-09-12"><div
															class="day-contents" id="day">12</div></td>
												</tr>
												<tr>
													<td class="day past event calendar-day-2015-09-13"><div
															class="day-contents" id="day">13</div></td>
													<td class="day past event calendar-day-2015-09-14"><div
															class="day-contents" id="day">14</div></td>
													<td class="day past calendar-day-2015-09-15"><div
															class="day-contents" id="day">15</div></td>
													<td class="day past calendar-day-2015-09-16"><div
															class="day-contents" id="day">16</div></td>
													<td class="day past calendar-day-2015-09-17"><div
															class="day-contents" id="day">17</div></td>
													<td class="day past calendar-day-2015-09-18"><div
															class="day-contents" id="day">18</div></td>
													<td class="day past calendar-day-2015-09-19"><div
															class="day-contents" id="day">19</div></td>
												</tr>
												<tr>
													<td class="day past calendar-day-2015-09-20"><div
															class="day-contents" id="day">20</div></td>
													<td class="day past event calendar-day-2015-09-21"><div
															class="day-contents" id="day">21</div></td>
													<td class="day past event calendar-day-2015-09-22"><div
															class="day-contents" id="day">22</div></td>
													<td class="day past event calendar-day-2015-09-23"><div
															class="day-contents" id="day">23</div></td>
													<td class="day past calendar-day-2015-09-24"><div
															class="day-contents" id="day">24</div></td>
													<td class="day past calendar-day-2015-09-25"><div
															class="day-contents" id="day">25</div></td>
													<td class="day today calendar-day-2015-09-26"><div
															class="day-contents" id="day">26</div></td>
												</tr>
												<tr>
													<td class="day calendar-day-2015-09-27"><div
															class="day-contents" id="day">27</div></td>
													<td class="day calendar-day-2015-09-28"><div
															class="day-contents" id="day">28</div></td>
													<td class="day calendar-day-2015-09-29"><div
															class="day-contents" id="day">29</div></td>
													<td class="day calendar-day-2015-09-30"><div
															class="day-contents" id="day">30</div></td>
													<td
														class="day adjacent-month next-month calendar-day-2015-10-01"><div
															class="day-contents" id="day">1</div></td>
													<td
														class="day adjacent-month next-month calendar-day-2015-10-02"><div
															class="day-contents" id="day">2</div></td>
													<td
														class="day adjacent-month next-month calendar-day-2015-10-03"><div
															class="day-contents" id="day">3</div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="cal-pos a">
								<ul>
									<li></li>
									<li></li>
								</ul>
							</div>
							<div class="cal-pos">
								<ul>
									<li></li>
									<li></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<div class="clear"></div>







					<!--  달력
					<div class="row_calendar no-gutters">
	
						<c:forEach items="${calendar }" var="calendar" varStatus="loop">
						<c:choose>
						
						<c:when test="${calendar.jindanConNum >= 0 && calendar.jindanConNum < 10 } ">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#e1f5fe">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 10 && calendar.jindanConNum < 20 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#b3e5fc">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 20 && calendar.jindanConNum < 30 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#81d4fa">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 30 && calendar.jindanConNum < 40 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#4fc3f7">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 40 && calendar.jindanConNum < 50 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#29b6f6">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 60 && calendar.jindanConNum < 70 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#03a9f4">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 70 && calendar.jindanConNum < 80 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#039be5">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 80 && calendar.jindanConNum < 90 }">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#0288d1">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						<c:when test="${calendar.jindanConNum >= 90}">
						<div class="col-md-2">
							<a href="#" class="photography-entry img d-flex justify-content-center align-items-center"
							style="background-color:#0277bd">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>${calendar.jindanCon }</h3>
									<span>Technology</span>
								</div>
							</a>
						</div>
						</c:when>
						
						</c:choose>
						</c:forEach>						
						
					</div>
					-->

				</div>
			</section>
			<!-- end -->



		</div>
		<!-- end of colorlib-main -->



	</div>


</body>



<script src="../css/mypage/js/jquery.min.js"></script>
<script src="../css/mypage/js/jquery-migrate-3.0.1.min.js"></script>
<script src="../css/mypage/js/popper.min.js"></script>
<script src="../css/mypage/js/bootstrap.min.js"></script>
<script src="../css/mypage/js/jquery.easing.1.3.js"></script>
<script src="../css/mypage/js/jquery.waypoints.min.js"></script>
<script src="../css/mypage/js/jquery.stellar.min.js"></script>
<script src="../css/mypage/js/owl.carousel.min.js"></script>
<script src="../css/mypage/js/jquery.magnific-popup.min.js"></script>
<script src="../css/mypage/js/aos.js"></script>
<script src="../css/mypage/js/jquery.animateNumber.min.js"></script>
<script src="../css/mypage/js/bootstrap-datepicker.js"></script>
<script src="../css/mypage/js/jquery.timepicker.min.js"></script>
<script src="../css/mypage/js/scrollax.min.js"></script>
<script src="../css/mypage/js/google-map.js"></script>
<script src="../css/mypage/js/main.js"></script>
<script src="../js/mypage/mypage.js"></script>
<script src="../js/mypage/secretCalendar.js"></script>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="../css/mypage/calendar/js/underscore-min.js"></script>
<script src="../css/mypage/calendar/js/moment-2.2.1.js"></script>
<script src="../css/mypage/calendar/js/clndr.js"></script>
<script src="../css/mypage/calendar/js/site.js"></script>
<!--End Calender-->

<!---Google Analytics Designmaz.net-->
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-35751449-15', 'auto');ga('send', 'pageview');</script>

</html>