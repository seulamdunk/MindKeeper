<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Elen - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
<link rel="stylesheet" href="../css/mypage/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/mypage/css/animate.css">
<link rel="stylesheet" href="../css/mypage/css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/mypage/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/mypage/css/magnific-popup.css">
<link rel="stylesheet" href="../css/mypage/css/aos.css">
<link rel="stylesheet" href="../css/mypage/css/ionicons.min.css">
<link rel="stylesheet" href="../css/mypage/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/mypage/css/jquery.timepicker.css">
<link rel="stylesheet" href="../css/mypage/css/flaticon.css">
<link rel="stylesheet" href="../css/mypage/css/icomoon.css">
<link rel="stylesheet" href="../css/mypage/css/style.css">
</head>

<body>
	<!-- mypage -->
	<div id="colorlib-page">

		<!-- navbar -->
		<jsp:include page="myPage-navbar.jsp"></jsp:include>

		<div class="container">
			<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2 class="mb-4">비밀일기</h2>
					<p>오늘 하루 감정을 적어주세요. 사용자님의 감정을 분석해드립니다.</p>
				</div>

				<div id="colorlib-main">
					<section class="ftco-section">

						<div>
							<form action="/admin/predictDiary" method="post">
								<div class="form-group">
								<input type="hidden" name="customerNum" id="customerNum" value="22"/>
									<input name="secretTitle" id="secretTitle" type="text"
										class="form-control" placeholder="제목을 입력해주세요">
								</div>
								<div class="form-group">
									<textarea name="secretCon" id="secretCon" cols="30" rows="7"
										class="form-control" placeholder="내용을 입력해주세요"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" value="등록" id="writeSecret"
										class="btn btn-primary py-3 px-5">
								</div>
							</form>

						</div>
					</section>


					<!-- footer -->
					<footer class="ftco-footer ftco-bg-dark ftco-section">
						<div class="container px-md-5">
							<div class="row mb-5">
								<div class="col-md">
									<div class="ftco-footer-widget mb-4 ml-md-4">
										<h2 class="ftco-heading-2">Category</h2>
										<ul class="list-unstyled categories">
											<li><a href="#">Photography <span>(6)</span></a></li>
											<li><a href="#">Fashion <span>(8)</span></a></li>
											<li><a href="#">Technology <span>(2)</span></a></li>
											<li><a href="#">Travel <span>(2)</span></a></li>
										</ul>
									</div>
								</div>
								<div class="col-md">
									<div class="ftco-footer-widget mb-4">
										<h2 class="ftco-heading-2">Archives</h2>
										<ul class="list-unstyled categories">
											<li><a href="#">October 2018 <span>(6)</span></a></li>
											<li><a href="#">September 2018 <span>(6)</span></a></li>
											<li><a href="#">August 2018 <span>(8)</span></a></li>
											<li><a href="#">July 2018 <span>(2)</span></a></li>
											<li><a href="#">June 2018 <span>(7)</span></a></li>
										</ul>
									</div>
								</div>


								<div class="col-md">
									<div class="ftco-footer-widget mb-4">
										<h2 class="ftco-heading-2">Have a Questions?</h2>
										<div class="block-23 mb-3">
											<ul>
												<li><span class="icon icon-map-marker"></span><span
													class="text">203 Fake St. Mountain View, San
														Francisco, California, USA</span></li>
												<li><a href="#"><span class="icon icon-phone"></span><span
														class="text">+2 392 3929 210</span></a></li>
												<li><a href="#"><span class="icon icon-envelope"></span><span
														class="text">info@yourdomain.com</span></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">

									<p>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										Copyright &copy;
										<script>
											document.write(new Date()
													.getFullYear());
										</script>
										All rights reserved | This template is made with <i
											class="icon-heart" aria-hidden="true"></i> by <a
											href="https://colorlib.com" target="_blank">Colorlib</a>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									</p>
								</div>
							</div>
						</div>
					</footer>
				</div>
				<!-- END COLORLIB-MAIN -->
			</div>
			<!-- END COLORLIB-PAGE -->
		</div>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>


		<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
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
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="../css/mypage/js/google-map.js"></script>
		<script src="../css/mypage/js/main.js"></script>
		<script src="../js/mypage/mypage.js"></script>
</body>
</html>