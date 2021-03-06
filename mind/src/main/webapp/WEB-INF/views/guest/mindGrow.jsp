<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>마음지킴이</title>
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
    <link rel="stylesheet" href="../custom/mindGrow.css">
  </head>
  <body>
    
	<jsp:include page="../navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-3" style="background-image:  linear-gradient(
            to bottom,
            rgba(0, 0, 0, 0) 10%,
            rgba(0, 0, 0, 0.25) 25%,
            rgba(0, 0, 0, 0.5) 50%,
            rgba(0, 0, 0, 0.75) 75%,
            rgba(0, 0, 0, 1) 100%
          ), url(../images/banner_mindgrow.jpg); background-size:100%; background-position-y: 180%"><!--data-stellar-background-ratio="0.8"  -->
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }" style="color:white;">마음가꾸기</h1>
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><span style="color:white;">마음이 즐거워질 수 있도록 에너지를 쌓아보세요<br>
취향에 맞는 영상을 추천받고 즐겨보세요</span></p>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section" >
	
<!--추천 영상-->
<c:if test="${recommendList[0].youtubeNum != Null }">


   <h2>이런건 어때요?</h2>
   <div class="loctionPoint">
   <div class="showInfo">
   
   
   </div>
 <div class="wrapper">
 
 	<div class="img-list recommendList" id="listCnt" >
		 <div class="arrow__btn btn1">‹</div>
		 	<div class="move-area">
		 		<c:forEach items="${recommendList }" var="youtube">
				 <div class="item">
				 	 <input type="hidden" class="thumbnail" value="${youtube.thumbnail}">
				 	 <input type="hidden" class="Title" value="${youtube.youtubeTitle}">
				 	 <input type="hidden" class="Ch" value="${youtube.youtubeCh}">
				 	 <input type="hidden" class="Cnt" value="${youtube.youtubeCnt}">
					 <img width="341" height="192" src="${youtube.thumbnail}"
					 onclick ="showInfo()"
					 ondblclick="location.href='/mindGrowDetail?youtubeNum=${youtube.youtubeNum}'">
				 </div>
				 </c:forEach>
	
	 		</div>
	 	 <div class="arrow__btn btn2">›</div>
	 </div>
	 
 </div>	 
 </div>
 	

	</c:if>
<!--태그 별  -->


<c:forEach items="${youtubeSet}" var="youtubeList" varStatus="status">

   <h2>${youtubeList[0].youtubeTag }</h2>
   <div class="loctionPoint">
   <div class="showInfo">
   
   
   </div>
 <div class="wrapper">
 
 	<div class="img-list" id="listCnt${status.count }" >
		 <div class="arrow__btn btn1">‹</div>
		 	<div class="move-area">
		 		<c:forEach items="${youtubeList }" var="youtube">
				 <div class="item">
				 	 <input type="hidden" class="thumbnail" value="${youtube.thumbnail}">
				 	 <input type="hidden" class="Title" value="${youtube.youtubeTitle}">
				 	 <input type="hidden" class="Ch" value="${youtube.youtubeCh}">
				 	 <input type="hidden" class="Cnt" value="${youtube.youtubeCnt}">
					 <img width="341" height="192" src="${youtube.thumbnail}"
					 onclick ="showInfo()"
					 ondblclick="location.href='/mindGrowDetail?youtubeNum=${youtube.youtubeNum}'">
				 </div>
				 </c:forEach>
	
	 		</div>
	 	 <div class="arrow__btn btn2">›</div>
	 </div>
	 
 </div>	 
 </div>
 	
</c:forEach>	 
	

    
      
    
    
    
    
    

    
    
    
    
      
      
        
       
      
    </section>

    
    <!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
s
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
   <script src="../custom/mindGrow.js"></script>
    
  </body>
</html>