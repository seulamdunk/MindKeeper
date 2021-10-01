<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
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
	
	<jsp:include page="./myPage-navbar.jsp"></jsp:include>
	
		<div id="colorlib-main">
			<div class="hero-wrap js-fullheight" style="background-image: url(../css/mypage/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="img mb-4" style="background-image: url(../css/mypage/images/author.jpg);"></div>
						<div class="desc">
							<h2 class="subheading">반갑습니다</h2>
							<div><h1 class="mb-4">송중기 님</h1></div>
							<p><a href="#" class="btn-custom">More About Me <span class="ion-ios-arrow-forward"></span></a></p>
						</div>
					</div>
				</div>
			</div>
			<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">비밀일기</h2>
            <p>오늘 하루는 어떠셨어요? 오늘의 감정을 한줄로 적어보세요</p>
          </div>
        </div>
    		<div class="row_secretdiary">
    		
    		<c:forEach items="${secretList }" var="secret" varStatus="loop">
    			<div class="col-md-4">
    				<div class="blog-entry ftco-animate">
							<a href="#" class="img img-2" style="background-image: url(../css/mypage/images/image_1.jpg);"></a>
							<div class="text text-2 pt-2 mt-3">
								<span class="category mb-3 d-block"><a href="/secretDiaryView">Technology</a></span>
	              <h3 class="mb-4"><a href="./secretDiaryView?secretNum=${secret.secretNum }">${secret.secretTitle }</a></h3>
	              <p class="mb-4">${secret.secretCon }</p>
	              <div class="author mb-4 d-flex align-items-center">
	            		<div class="ml-3 info">
	            		<span>${fn:substring(secret.secretDate,0,10)}</span>
	            		</div>
	            	</div>
	              <div class="meta-wrap align-items-center">
	         

	              </div>
	            </div>
						</div>
    			</div>
    			</c:forEach>
    			
    		</div>
    		<div class="row">
    		<a href="/admin/secretDiaryWrite">
    			<input type="submit" value="글쓰기" id="writeBtn" class="btn btn-primary py-3 px-5" />
    			</a>
    			</div>
    			
    	</div>
    </section>
   
   <jsp:include page="myPage-footer.jsp"></jsp:include>
   
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
    
  </body>
</html>