<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
<style class="vjs-styles-defaults">
.video-js {
	width: 300px;
	height: 150px;
}

.vjs-fluid {
	padding-top: 56.25%
}
</style>
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
<link rel="stylesheet" href="../css/mypage/css/userInfo.css">
<link rel="stylesheet" href="../css/mypage/css/userInfo2.css">
</head>

<body>

	<!-- mypage -->
	<div id="colorlib-page">

		<jsp:include page="myPage-navbar.jsp">
			<jsp:param value="${user.customerNum }" name="customerNum" />
		</jsp:include>

		<div id="colorlib-main">
			<div class="hero-wrap js-fullheight"
				style="background-image: url(../css/mypage/images/bg_1.jpg);"
				data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div
					class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="img mb-4"
							style="background-image: url(../css/mypage/images/author.jpg);"></div>
						<div class="desc">
							<h2 class="subheading">반갑습니다</h2>
							<div>
								<h1 class="mb-4">${user.customerNick}님</h1>
							</div>
							<p>
								<a href="#" class="btn-custom">More About Me <span
									class="ion-ios-arrow-forward"></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 나의 마음지수 ########################################################################## -->
			<div class="hello_main">
				<div class="group_hellomain">
					<div class="area_thumb">
						<div class="ico_together3 ico_hello" style="background-image: url('../images/logo_y.png'); background-size: 170px"></div>
					</div>
					<div class="area_txt">
						<span class="tit_test">${user.customerName }님의 마음지수</span><span class="txt_score"><em>${jindanTotal}</em>점</span><a
							data-tiara-layer="hellotrend my_hello"
							data-tiara-action-name="필수테스트_보기_클릭" class="link_view"
							href="/hello/essential">안녕지수 자세히보기 &gt;</a>
					</div>
				</div>
				<div class="group_compare">
					<strong class="screen_out">테스트 평균과 비교하기</strong>
					<hello-essential-graph>
					<div class="area_graph">
						<div class="graph_compare">
							<div class="shape_compare"></div>
							<span class="value_lowest">0</span><span class="value_best">100</span>
							<div class="info_compare my_compare" style='left:${jindanTotal}%;'>
								<div class="indicate_point">
									<div class="name_info" style="left: 0px;">
										<a class="link_my"><span class="txt_compare">나의
												점수는?</span></a>
									</div>
									<!---->
									<!---->
									<div class="line_info"></div>
									<div class="dot_info"></div>
								</div>
							</div>
							<div class="info_compare average_compare" style="left: 52%;">
								<div class="indicate_point">
									<div class="line_info"></div>
									<div class="name_info">
									</div>
								</div>
							</div>
						</div>
					</div>
					</hello-essential-graph>
				</div>
			</div>
			<!-- end of 나의 마음지수 ########################################################################## -->



			<!-- 작성한 글 *********************************************************************** -->
			<div _ngcontent-hal-c80="" class="my_wrap my_main_wrap">

				<div _ngcontent-hal-c80="" class="article_right">
					<router-outlet _ngcontent-hal-c80=""></router-outlet>
					<ui-home _nghost-hal-c185="" class="ng-star-inserted">
					<section _ngcontent-hal-c185="" class="my_order">
						<h3 _ngcontent-hal-c185="" class="my_tit">내가 쓴 글</h3>
						<!---->
						<ul _ngcontent-hal-c185="" class="my_order_tbl ng-star-inserted">
							<li _ngcontent-hal-c185="" class="my_order_tit">
								<div _ngcontent-hal-c185="" class="my_tbl">
									<div _ngcontent-hal-c185="" class="date">글번호</div>
									<div _ngcontent-hal-c185="" class="history">제목</div>
									<div _ngcontent-hal-c185="" class="content">내용</div>
									<div _ngcontent-hal-c185="" class="num">작성일</div>
								</div>
							</li>
							
							<!-- 글 목록 불러오기 -->
							<c:forEach items="${mypageList }" var="mypage" varStatus="loop">
							<li _ngcontent-hal-c185="" class="my_order_tit">
							<div ngcontent-hal-c185="" class="my_tbl" style="border-bottom: 1px;">
									<div _ngcontent-hal-c185="" class="date">${mypage.secretNum }</div>
									<div _ngcontent-hal-c185="" class="history">
										<div _ngcontent-hal-c185="" class="prd_order">
										
									
												<div _ngcontent-hal-c185="" class="prd_order_in">
													<span _ngcontent-hal-c185="" class="elp"> <span
														_ngcontent-hal-c185=""> ${mypage.secretTitle } </span>
													</span>
													<!---->
												</div>
											
											
										</div>
									</div>
									<div _ngcontent-hal-c185="" class="content">
										<div _ngcontent-hal-c185="" class="prd_order">
										
									
												<div _ngcontent-hal-c185="" class="prd_order_in">
													<span _ngcontent-hal-c185="" class="elp"> <span
														_ngcontent-hal-c185=""> ${mypage.secretCon } </span>
													</span>
													<!---->
												</div>
											
											
										</div>
									</div>
									<div _ngcontent-hal-c185="" class="num">${fn:substring(mypage.secretDate,0,10)}</div>
							</div>
							</li>
							</c:forEach>
							
							
						</ul>
					</section>

					<div _ngcontent-hal-c185="" class="split_wrap">

						<section _ngcontent-hal-c185="" class="my_order">
							<h3 _ngcontent-hal-c185="" class="my_tit">좋아요</h3>
							
							<!-- 좋아요 목록 ******************************************************************* -->
							<!-- 
							<div _ngcontent-hal-c185="" class="heart_artwrap">
								<h4 _ngcontent-hal-c185="" class="h_tit">Products</h4>
								<ul _ngcontent-hal-c185="" class="heart_lst ng-star-inserted">
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/682991">
											<div _ngcontent-hal-c185="" class="imgbx"></div> <strong
											_ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">Unbal linen
												cardigan (skyblue)</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/684374">
											<div _ngcontent-hal-c185="" class="imgbx"></div> <strong
											_ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">Linen wide slacks
												(ivory)</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/895383">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2020/11/18/d9a89d2f435d4ed689148dc7e790d6a9_20201118154026.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">DRAWSTRING-WAIST
												TROUSERS (WHITE)</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/324879">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2019/02/26/83992435060245d08e1d5a7e4295e161_20190226174959.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">핀턱 와이드 밴딩 슬랙스 /
												아이보리</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/1036959">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2021/03/29/6c75196c7fd34cbeabc2e784aa688106_20210329090153.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">Bamboo wool
												cardigan (deep navy)</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/980933">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2021/02/13/0def97b8a295434387bb5ba4c217d6b3_20210213084619.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">UNISEX STRAIGHT
												LAMBSKIN BLOUSON JACKET BLACK_UDJU1E102BK</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/434912">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2019/08/29/002790e5323643d4aa2f613dc7239397_20190829165614.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">[DECKE][베스트] 클레프S
												DE2A3ABG007WRT</p>
									</a></li>
									<li _ngcontent-hal-c185="" class="ng-star-inserted"><a
										_ngcontent-hal-c185="" href="/product/874267">
											<div _ngcontent-hal-c185="" class="imgbx">
												<div _ngcontent-hal-c185="" class="imgin">
													<img _ngcontent-hal-c185="" alt=""
														src="//img.29cm.co.kr/next-product/2021/04/14/7f3d47581e23484188c385a0acca706b_20210414142707.jpg?width=900">
												</div>
											</div> <strong _ngcontent-hal-c185="" class="info"></strong>
											<p _ngcontent-hal-c185="" class="txt">브이넥 니트 가디건 (J07)
												AFPF2037196-J07</p>
									</a></li>
								</ul>
							</div>
							-->
							<!-- end of 좋아요 목록 ******************************************************************* -->

							<div _ngcontent-hal-c185="" class="heart_artwrap type2 border_no">
								<h4 _ngcontent-hal-c185="" class="h_tit h_tit2">Post</h4>
								<!---->
								<div _ngcontent-hal-c185=""
									class="order_list_none border_no ng-star-inserted">
									<p _ngcontent-hal-c185="">포스트 하트내역이 없습니다</p>
								</div>
								<!---->
								<ul _ngcontent-hal-c185="" class="heart_lst ng-star-inserted">
									<!---->
								</ul>
								<!---->
							</div>
							<a _ngcontent-hal-c185="" routerlink="/heart" class="btn_my_more"
								href="/mypage/heart">더보기</a>
						</section>
					</div>
					</ui-home>
					<!---->
				</div>
			</div>
			<!---->
			</section>
			<!-- end of 작성한글 *************************************************************** -->



			<!-- 회원 정보 *************************************************************** -->
			<section class="ftco-section">
				<div class="container">

					<div _ngcontent-kkl-c80="" class="article_right">
						<router-outlet _ngcontent-kkl-c80=""></router-outlet>
						<ui-edit _nghost-kkl-c204="" class="ng-star-inserted">
						<section _ngcontent-kkl-c204="" class="my_modify ng-star-inserted">
							<h3 _ngcontent-kkl-c204="" class="my_tit">회원정보 수정</h3>
							<fieldset _ngcontent-kkl-c204="">
								<legend _ngcontent-kkl-c204="">회원정보 수정 양식 작성</legend>
								<ul _ngcontent-kkl-c204="" class="modify_lst">
									
									
									<li _ngcontent-kkl-c204="">
										<h4 _ngcontent-kkl-c204="">회원 정보</h4>
										<div _ngcontent-kkl-c204="" class="list_wrap">
											<div _ngcontent-kkl-c204="" class="user_ly">
												<div _ngcontent-kkl-c204="" class="lr_wrap">
													<div _ngcontent-kkl-c204="" class="modify_l">성명</div>
													<div _ngcontent-kkl-c204="" class="modify_r">
														<div div _ngcontent-kkl-c204="" class="inpbx">
															<input _ngcontent-kkl-c204="" type="text"
																id="customerName" placeholder="${user.customerName }"
																class="ng-untouched ng-pristine">
														</div>
													</div>
												</div>
												<div _ngcontent-kkl-c204="" class="lr_wrap">
													<div _ngcontent-kkl-c204="" class="modify_l">연락처</div>
													<div _ngcontent-kkl-c204="" class="modify_r">
														<div div _ngcontent-kkl-c204="" class="inpbx">
															<input _ngcontent-kkl-c204="" type="text" id="phoneNum"
																placeholder="${user.phoneNum }"
																class="ng-untouched ng-pristine">
														</div>
													</div>
												</div>
												<div _ngcontent-kkl-c204="" class="lr_wrap">
													<div _ngcontent-kkl-c204="" class="modify_l">생일</div>
													<div _ngcontent-kkl-c204="" class="modify_r">
														<div div _ngcontent-kkl-c204="" class="inpbx">
															<input _ngcontent-kkl-c204="" type="text" id="phoneNum"
																placeholder="${user.phoneNum }"
																class="ng-untouched ng-pristine">
														</div>
													</div>
												</div>
												<div _ngcontent-kkl-c204="" class="lr_wrap">
													<div _ngcontent-kkl-c204="" class="modify_l">성별</div>
													<div _ngcontent-kkl-c204="" class="modify_r">
														<div div _ngcontent-kkl-c204="" class="inpbx">
															<input _ngcontent-kkl-c204="" type="text" id="gender"
																placeholder="남" class="ng-untouched ng-pristine">
														</div>
													</div>
												</div>

												<div _ngcontent-kkl-c204="" class="lr_wrap">
													<div _ngcontent-kkl-c204="" class="modify_l">이메일</div>
													<div _ngcontent-kkl-c204="" class="modify_r">
														<div div _ngcontent-kkl-c204="" class="inpbx">
															<input _ngcontent-kkl-c204="" type="text" id=""
																placeholder="wndrl@naver.com"
																class="ng-untouched ng-pristine">
														</div>
													</div>
												</div>

											</div>


											<!-- 수정하기 버튼 -->
											<div _ngcontent-kkl-c204="" class="lr_wrap">
												<button _ngcontent-kkl-c204="" type="button" class="go_nice">
													수정하기</button>
											</div>


										</div>
									</li>
								</ul>
								<a _ngcontent-kkl-c204="" href="javascript:void(0);"
									class="btn_out">회원탈퇴하기</a>
							</fieldset>
						</section>
						<!----> <!----> <!----> <!---->
						<div _ngcontent-kkl-c204="" class="out_msg">
							<!---->
						</div>
						</ui-edit>
						<!---->
					</div>

				</div>
			</section>
			<!-- end of 비밀일기 -->

			<jsp:include page="myPage-footer.jsp"></jsp:include>

		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

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
	<script src="../css/mypage/js/google-map.js"></script>
	<script src="../css/mypage/js/main.js"></script>
	<script src="../js/mypage/mypage.js"></script>

</body>
</html>