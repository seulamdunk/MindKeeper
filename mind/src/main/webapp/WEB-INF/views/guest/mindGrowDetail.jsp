<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
  <head>
  	<!-- 마음가꾸기 상세보기 -->
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
    <link rel="stylesheet" href="../custom/mindGrowDetail.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
         <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
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
    
    <section class="ftco-section">
      <div class="container">
      <input type="hidden" value="${youtube.youtubeNum}" id="youtube-num">
      	<input type="hidden" value="${user}" id="user-num">
      
      	<div class="row justify-content-center mb-5 pb-5">
        	
	        <div class="ifArea">	
		        <iframe id="video" src="https://www.youtube.com/${youtube.youtubeUrl}" 
		        title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
		        clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
		        allowfullscreen></iframe>
		     </div>
	        
        </div>
        <div class="youtube-title"><h2>${youtube.youtubeTitle}</h2></div>
	        
	         <div>채널    : ${youtube.youtubeCh}</div>
	         <div><br/></div>
	         <div>조회수 : ${youtube.youtubeCnt}</div>
	         
	 
        	 <hr>
        	 
        	 	 <div class="youtube-review-input-area">
        	 	 		<div class="input-youtube">
        	 		  <input class="form-control" id="youtubeCon" name="youtubeCon"  placeholder="">
        	 		  </div>
        	 		  <div class="input-youtube-btn" onclick=insertYoutubeReview()>
        	 		 <i  class="fas fa-feather-alt"></i>
        			 </div>
        	 </div>
        	 
        	 
       <div class="youtube-review-area">
       		<div class="comments-list">
              
       
       </div> 	 
        	
        	 
        
        	 
        	   <hr>
        <div class="justify-content-center mb-5 pb-5">
        		<div class="container" >
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
    
    
    
        <div class="carousel-inner row w-100 mx-auto" role="listbox">
            
            
            
            
            
            <c:forEach items="${recommendList }" var="youtube" varStatus="status">
            <div class="carousel-item col-md-3">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="${youtube.youtubeTitle } ${status.count }" class="thumb">
                      <img class="img-fluid mx-auto d-block" src="${youtube.thumbnail }" alt="slide ${status.count }">
                    </a>
                  </div>
                </div>
            </div>
            </c:forEach>
       
      
            
         
        

        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next text-faded" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

        </div>	 
      </div>
      
      

      
      
   		</div>
    </section>

    
    <!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

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
  <script src="../custom/mindGrowDetail.js"></script>
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(".carousel-item").eq(3).addClass("active")

  $(document).ready(function() {


	  $('#myCarousel').on('slide.bs.carousel', function (e) {

		  
		    var $e = $(e.relatedTarget);
		    var idx = $e.index();
		    var itemsPerSlide = 4;
		    var totalItems = $('.carousel-item').length;
		    
		    if (idx >= totalItems-(itemsPerSlide-1)) {
		        var it = itemsPerSlide - (totalItems - idx);
		        for (var i=0; i<it; i++) {
		            // append slides to end
		            if (e.direction=="left") {
		                $('.carousel-item').eq(i).appendTo('.carousel-inner');
		            }
		            else {
		                $('.carousel-item').eq(0).appendTo('.carousel-inner');
		            }
		        }
		    }
		});


		  $('#myCarousel').carousel({ 
		                interval: 2000
		        });
			  
/* show lightbox when clicking a thumbnail */
    $('a.thumb').click(function(event){
      event.preventDefault();
      var content = $('.modal-body');
      content.empty();
        var title = $(this).attr("title");
        $('.modal-title').html(title);        
        content.html($(this).html());
        $(".modal-profile").modal({show:true});
    });

  });

</script>
  </body>
</html>