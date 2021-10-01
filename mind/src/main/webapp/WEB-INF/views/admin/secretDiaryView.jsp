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
  
  <div id="colorlib-main">
  <section class="ftco-section">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-lg-8">
	    				<div class="row">
	    					<div class="col-md-12">
	    						<div class="blog-entry ftco-animate">
	    							<span class="category mb-1 d-block"><a href="#">Technology</a></span>
				              <h3 class="mb-4"><a href="#">${secretModel.secretTitle }</a></h3>
				              <hr>
				              <input type="hidden" id="customerNum" value="${secretModel.customerNum }" />
				              <input type="hidden" id="secretNum" value="${secretModel.secretNum }" />
	    							
	    					<div class="text pt-2 mt-3">
				              <a href="#" class="img" style="background-image: url(../css/mypage/images/image_1.jpg);"></a>
				              <p class="mb-4" style="margin-top: 20px; font-size: 25px">${secretModel.secretCon }</p>
				              <div class="author mb-4 d-flex align-items-center">
				            		<div class="ml-3 info">
				            			<h3><span id="secretDate">${secretModel.secretDate }</span></h3>
				            		</div>
				            	</div>
				              
				              
				              
				              <hr>
				              <div class="meta-wrap d-md-flex align-items-center" id="btnBox">
				              	 <input type="button" value="분석하기" id="resultBtn" class="btn btn-primary py-3 px-5" />
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
	    		
						<div id="resultBox">
						결과값
						</div>
	    				
	    				<!-- 페이징 버튼 -->
	    				<!-- 
	    				<div class="row mt-5">
			          <div class="col">
			            <div class="block-27">
			              <ul>
			                <li><a href="#">&lt;</a></li>
			                <li class="active"><span>1</span></li>
			                <li><a href="#">2</a></li>
			                <li><a href="#">3</a></li>
			                <li><a href="#">4</a></li>
			                <li><a href="#">5</a></li>
			                <li><a href="#">&gt;</a></li>
			              </ul>
			            </div>
			          </div>
			        </div>
			        -->
			        
	    			</div><!-- END-->
	    			
	    			<!-- 
	    			<div class="col-lg-4 sidebar ftco-animate">
	            <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="#">Fashion <span>(6)</span></a></li>
	                <li><a href="#">Technology <span>(8)</span></a></li>
	                <li><a href="#">Travel <span>(2)</span></a></li>
	                <li><a href="#">Food <span>(2)</span></a></li>
	                <li><a href="#">Photography <span>(7)</span></a></li>
	              </ul>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Popular Articles</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	            </div>
	            
	             
	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Tag Cloud</h3>
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link">animals</a>
	                <a href="#" class="tag-cloud-link">human</a>
	                <a href="#" class="tag-cloud-link">people</a>
	                <a href="#" class="tag-cloud-link">cat</a>
	                <a href="#" class="tag-cloud-link">dog</a>
	                <a href="#" class="tag-cloud-link">nature</a>
	                <a href="#" class="tag-cloud-link">leaves</a>
	                <a href="#" class="tag-cloud-link">food</a>
	              </ul>
	            </div>

							<div class="sidebar-box subs-wrap img" style="background-image: url(images/bg_1.jpg);">
								<div class="overlay"></div>
								<h3 class="mb-4 sidebar-heading">Newsletter</h3>
								<p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia</p>
	              <form action="#" class="subscribe-form">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Email Address">
	                  <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
	                </div>
	              </form>
	            </div>

	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Archives</h3>
	              <ul class="categories">
	              	<li><a href="#">October 2018 <span>(10)</span></a></li>
	                <li><a href="#">September 2018 <span>(6)</span></a></li>
	                <li><a href="#">August 2018 <span>(8)</span></a></li>
	                <li><a href="#">July 2018 <span>(2)</span></a></li>
	                <li><a href="#">June 2018 <span>(7)</span></a></li>
	                <li><a href="#">May 2018 <span>(5)</span></a></li>
	              </ul>
	            </div>


	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Paragraph</h3>
	              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut.</p>
	            </div>
	          </div>
	          -->
	          
	    		</div>
	    	</div>
	    </section>
	    </div>
	    
	    </div>
	    
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../css/mypage/js/google-map.js"></script>
  <script src="../css/mypage/js/main.js"></script>
  <script src="../js/mypage/mypage.js"></script>
 
    
  </body>
</html>