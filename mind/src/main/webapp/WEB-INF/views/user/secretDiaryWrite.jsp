<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 비밀일기 작성 -->
<title>마음지킴이</title>
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
		<jsp:include page="myPage-navbar.jsp">
		<jsp:param value="${user.customerNum }" name="customerNum"/>
		</jsp:include>

				<div id="colorlib-main">
				
				<!-- 메인 -->
			<section class="home-slider js-fullheight owl-carousel">
	      <div class="slider-item js-fullheight" style="background-image:url(../images/secret.jpg);">
	      	<div class="overlay"></div>
	        <div class="container-fluid">
	          <div class="row no-gutters slider-text slider-text-2 js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
	          <div class="col-md-10 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Secret Diary</h1>
	            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">오늘 하루는 어떠셨어요? 오늘의 감정을 한줄로 적어보세요</p>
	          </div>
	        </div>
	        </div>
	      </div>
	      </section>
	      <!-- end of 메인 -->
	      
					<section class="ftco-section">
					<div class="container">
					
					<section class="ftco-section-title">
					<div class="row justify-content-center mb-5 pb-2">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2 class="mb-4">비밀일기</h2>
					<p class="subtitle">오늘 하루 감정을 적어주세요. 사용자님의 감정을 분석해드립니다.</p>
				</div>
				</div>
				</section>
					

						<section class="ftco-section">
							<form action="#" method="post">
								<div class="form-group">
								<input type="hidden" name="customerNum" id="customerNum" value="${user.customerNum }"/>
									<input name="secretTitle" id="secretTitle" type="text"
										class="form-control" placeholder="제목을 입력해주세요">
								</div>
								<div class="form-group" style="margin-top: 20px;">
									<textarea name="secretCon" id="secretCon" cols="30" rows="7"
										class="form-control" placeholder="내용을 입력해주세요"></textarea>
								</div>
								<div class="form-group">
									<input type="button" value="등록" id="writeSecret"
										class="btn btn-primary py-3 px-5">
								</div>
							</form>

						</section>
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