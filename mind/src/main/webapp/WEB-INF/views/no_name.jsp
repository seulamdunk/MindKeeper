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

    <section class="ftco-section">
      <div class="container">
      <div><h1>익명 상담 게시판</h1><br/></div>
       <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">번호</th>
								<th class="column2">작성날짜</th>
								<th class="column3">글제목</th>
								<th class="column4">조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${result }">
								<tr>
									<td class="column1">${result.no_name_num }</td>
									<td class="column2">${result.no_name_date }</td>
									<td class="column3">${result.no_name_title }</td>
									<td class="column4">${result.no_name_count }</td>
									
								</tr>
						</c:forEach>
							<!-- 	<tr>
									<td class="column1">2</td>
									<td class="column2">2021-09-24 8:43</td>
									<td class="column3">Samsung S8 Black</td>
									<td class="column4">$756.00</td>
								</tr>
								<tr>
									<td class="column1">3</td>
									<td class="column2">200396</td>
									<td class="column3">Game Console Controller</td>
									<td class="column4">$22.00</td>
								</tr>
								<tr>
									<td class="column1">4</td>
									<td class="column2">200392</td>
									<td class="column3">USB 3.0 Cable</td>
									<td class="column4">$10.00</td>
								</tr>
								<tr>
									<td class="column1">5</td>
									<td class="column2">200391</td>
									<td class="column3">Smartwatch 4.0 LTE Wifi</td>
									<td class="column4">$199.00</td>
								</tr>
								<tr>
									<td class="column1">6</td>
									<td class="column2">200390</td>
									<td class="column3">Camera C430W 4k</td>
									<td class="column4">$699.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-22 05:57</td>
									<td class="column2">200389</td>
									<td class="column3">Macbook Pro Retina 2017</td>
									<td class="column4">$2199.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-21 05:57</td>
									<td class="column2">200388</td>
									<td class="column3">Game Console Controller</td>
									<td class="column4">$999.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-19 05:57</td>
									<td class="column2">200387</td>
									<td class="column3">iPhone X 64Gb Grey</td>
									<td class="column4">$999.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-18 05:57</td>
									<td class="column2">200386</td>
									<td class="column3">iPhone X 64Gb Grey</td>
									<td class="column4">$999.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-22 05:57</td>
									<td class="column2">200389</td>
									<td class="column3">Macbook Pro Retina 2017</td>
									<td class="column4">$2199.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-21 05:57</td>
									<td class="column2">200388</td>
									<td class="column3">Game Console Controller</td>
									<td class="column4">$999.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-19 05:57</td>
									<td class="column2">200387</td>
									<td class="column3">iPhone X 64Gb Grey</td>
									<td class="column4">$999.00</td>
								</tr>
								<tr>
									<td class="column1">2017-09-18 05:57</td>
									<td class="column2">200386</td>
									<td class="column3">iPhone X 64Gb Grey</td>
									<td class="column4">$999.00</td>
								</tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
        <div class="row">
        	
        </div>
        	<div class="col-lg-3 d-flex mb-sm-4 ftco-animate">
        		
        	</div>
        	<div class="col-lg-3 d-flex mb-sm-4 ftco-animate">
        		
        	</div>
        	<div class="col-lg-3 d-flex mb-sm-4 ftco-animate">
        		
        	</div>
        <div class="row  mt-5 justify-conten-center">
        	
      </div>
     </div>
    </section>

    
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