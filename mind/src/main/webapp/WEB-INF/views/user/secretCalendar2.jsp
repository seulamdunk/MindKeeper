<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- 비밀일기 캘린더2 -->
<title>마음지킴이</title>
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


					<div class="mini-cal">
						<div class="calender">
							<div class="column_right_grid calender">
								<div class="cal1">
									<div class="clndr">
										<div class="clndr-controls">
											<div class="clndr-control-button">
												<p class="clndr-previous-button">previous</p>
											</div>
											<div class="month">October 2021</div>
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
											<tbody>
												<tr>
													<td
														class="day past adjacent-month last-month calendar-day-2015-08-30">
														<div class="day-contents" id="day_30">26</div></td>
													<td class="day past adjacent-month last-month calendar-day-2015-08-31">
														<div class="day-contents" id="day_30">27</div>
													</td>
													<td class="day past adjacent-month last-month calendar-day-2015-08-31"><div
															class="day-contents" id="day_30">28</div></td>
													<td class="day past adjacent-month last-month calendar-day-2015-08-31"><div
															class="day-contents" id="day_30">29</div></td>
													<td class="day past adjacent-month last-month calendar-day-2015-08-31">
													<div class="day-contents" id="day_30">30</div></td>
													<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">1</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">2</div></td>
												</tr>
												
												<!-- 날짜 for each문 *************************************************************** -->
												<tr>
												<c:forEach items="${calendar }" var="calendar" varStatus="loop" begin="0" end="6" step="1">
												
												<c:choose>
													<c:when test="${calendar.jindanConNum > 85}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #fbc02d;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 70}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #fdd835;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 55}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #ffeb3b;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 40}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #ffee58;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:otherwise>
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: blue">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:otherwise>
													
												
												</c:choose>
																								
													
												</c:forEach>
												</tr>
												<!-- end of 날짜 for each문 *************************************************************** -->
												
												
												
												
												<!-- 날짜 for each문 11~17 *************************************************************** -->
<%-- 												<tr>
												<c:forEach items="${calendar }" var="calendar" varStatus="loop" begin="7" end="13" step="1">
												
												<c:choose>
													<c:when test="${calendar.jindanConNum > 85}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #fbc02d;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 70}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #fdd835;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 55}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #ffeb3b;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:when test="${calendar.jindanConNum > 40}">
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: #ffee58;">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:when>
													
													<c:otherwise>
													<td class="day past calendar-day-'${calendar.secretDate }'">
													<div style="background-color: blue">
													<div class="day-contents" id="${calendar.jindanConNum}">${fn:substring(calendar.secretDate,8,10)+0}</div>
													</div>
													</td>
													</c:otherwise>
													
												
												</c:choose>
																								
													
												</c:forEach>
												</tr> --%>
												<!-- end of 날짜 for each문 *************************************************************** -->
												
												
												
												<tr>
													<td class="day past calendar-day-2015-09-04">
													<div style="background-color: #fdd835;"><div class="day-contents">11</div></div></td>
													
													<td class="day past calendar-day-2015-09-05">
													<div style="background-color: #fbc02d;"><div
															class="day-contents" id="day">12</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">13</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">14</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">15</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">16</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">17</div></div></td>
												</tr>
												
												
												
												<tr>
													<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">18</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">19</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">20</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">21</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">22</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">23</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">24</div></div></td>
												</tr>
												
												
												<tr>
													<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">25</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">26</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">27</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">28</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">29</div></div></td>
													<td class="day past calendar-day-2015-09-05"><div
															class="day-contents" id="day">30</div></td>
															<td class="day past calendar-day-2015-09-04">
													<div id="day_4"><div class="day-contents">31</div></div></td>
												</tr>
										
											</tbody>
										</table>
									</div>
								</div>
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
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<!--End Calender-->
<script src="../js/mypage/secretCalendar.js"></script>




</html>