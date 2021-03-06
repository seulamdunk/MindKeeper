<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>익명상담게시판</title>
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
    
    <link rel="stylesheet" href="../css/css/a_board/main.css">
    <link rel="stylesheet" href="../css/css/a_board/util.css">
    <link rel="stylesheet" href="../css/css/noname/css.css">
    <link rel="stylesheet" href="../css/css/noname/media.css">
    <link rel="stylesheet" href="../css/css/noname/style.css">
  </head>
  <body>
    
	<jsp:include page="navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="/">Home</a></span> <span>Team</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">익명상담게시판</h1>
          </div>
        </div>
      </div>
    </div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>익명상담게시판</strong>
			<p>익명으로 글이 작성되니 안심하고 상담하시기 바랍니다.</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
				<c:forEach var="noNameDTOList" items="${noNameDTOList}">
					<div>
						<div class="num">${noNameDTOList.noNameNum }</div>
						<div class="title">
							<a href="n_details/${noNameDTOList.noNameNum }">${noNameDTOList.noNameTitle }</a>
						</div>
						<div class="writer">익명</div>
						<div class="date">${noNameDTOList.noNameDate }</div>
						<div class="count">${noNameDTOList.noNameCount }</div>
					</div>
				</c:forEach>
			</div>
			<!-- 검색 form -->
			<br>
			<form action="/n_search" method="POST">
				<div class="btn-group" role="group" aria-label="Basic example">
					<input name="keyword" type="text" placeholder="검색어를 입력해주세요">
					<button class="btn btn-primary">검색</button>
				</div>
			</form>
		</div>
		<!-- 검색 종료 -->
		<div class="board_page">
			<div class="board_page">
				<c:forEach items="${pageList }" var="pageNum">
					<a href="n_search?keyword=${keyword }&page=${pageNum}">${pageNum }</a>
				</c:forEach>
			</div>
			<div class="bt_wrap">
				<a href="/n_write" class="on">글작성</a>
			</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>

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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>