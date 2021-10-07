<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 결과 그래프 -->
<link rel="stylesheet" href="../css/mypage/result/css/sb-admin-2.css">
<link rel="stylesheet"
	href="../css/mypage/result/css/sb-admin-2.min.css">
<link rel="stylesheet" href="../css/mypage/result/css/style.css">

<!-- *************** bxslider script 시작**************** -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/assets/css/style.css">
<!-- *************** bxslider script 종료**************** -->
</head>

<body>

	<!-- mypage -->
	<div id="colorlib-page">

		<!-- navbar -->
		<jsp:include page="myPage-navbar.jsp">
			<jsp:param value="${user.customerNum }" name="customerNum" />
		</jsp:include>

		<div id="colorlib-main">
			<section class="ftco-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
							<div class="row">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate">
										<span class="category mb-1 d-block"><a href="#">Technology</a></span>
										<h3 class="mb-4">
											<a href="#">${secretModel.secretTitle }</a>
										</h3>
										<hr>
										<input type="hidden" id="customerNum" value="${secretModel.customerNum }" />
										<input type="hidden" id="secretNum" value="${secretModel.secretNum }" />
										<input type="hidden" id="jindanCon" value="${secretModel.jindanCon }" />
										<input type="hidden"
											id="jindanConNum" value="${secretModel.jindanConNum }" />
											<input type="hidden" id="customerName" value="${user.customerName }" />

										<div class="text pt-2 mt-3">
											<a href="#" class="img"
												style='background-image: url("${secretModel.secretImg }");'></a>
											<p class="mb-4" style="margin-top: 20px; font-size: 25px"
												id="secretCon">${secretModel.secretCon }</p>
											<div class="author mb-4 d-flex align-items-center">
												<div class="ml-3 info">
													<h3>
														<span id="secretDate">${secretModel.secretDate }</span>
													</h3>
												</div>
											</div>



											<hr>
											<div class="meta-wrap d-md-flex align-items-center"
												id="btnBox">
												<input type="button" value="결과보기" id="resultBtn"
													class="btn btn-primary py-3 px-5" />
												<!--  
				              	<form action="/admin/predictDiary" method="post">
				              	<div class="half">
					              	<p><a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">결과보기</a></p>
				              	</div>
				              	</form>
				              	-->

											</div>


										</div>
									</div>
								</div>


							</div>

							<div id="resultBox"></div>
							<!-- resultBox -->



						</div>
					</div>

					<div id="banner"></div>
			</section>
		</div>

	</div>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../css/mypage/js/google-map.js"></script>
	<script src="../css/mypage/js/main.js"></script>
	<script src="../js/mypage/mypage.js"></script>


</body>
</html>