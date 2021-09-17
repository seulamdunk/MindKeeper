<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>마음 지킴이</title>
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
    <link rel="stylesheet" href="../custom/mindtalk.css" />
  </head>
  <body>
    
	<jsp:include page="../navbar.jsp"></jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap hero-wrap-2" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>마음톡톡</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">마음톡톡</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
      <div class="container">
      	 <div class="row">
           
            <div class="col-md-12 gedf-main">

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header bg-blue">
                        
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" id="message" rows="3" placeholder="마음톡톡"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                      		  <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                               </div>
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">올리기</button>
                            </div>
                           
                        </div>
                    </div>
                </div>
                <!-- Post /////-->
				<div><a href="/getTest">데이터 확인</a></div>
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@LeeCross</div>
                                    <div class="h7 text-muted">Miracles Lee Cross <span> 몇분전</span></div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        
                        
                        <p class="card-text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos ipsa praesentium esse magnam nemo dolor
                            sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>
                <!-- Post /////-->




                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header bg-blue">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center ">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">작성자 이름</div>
                                    <div class="h7 text-muted">시간<span>(몇분전)</span></div>
                                </div>
                            </div>
                           
                        </div>

                    </div>
                    
                  
                    <div class="card-body">
                      <!--   <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> Hace 40 min</div> -->
                        <!-- <a class="card-link" href="#">
                            <h5 class="card-title">Totam non adipisci hic! Possimus ducimus amet, dolores illo ipsum quoscum.</h5>
                        </a> -->

                        <p class="card-text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam sunt fugit reprehenderit consectetur exercitationem odio,
                            quam nobis? Officiis, similique, harum voluptate, facilis voluptas pariatur dolorum tempora sapiente
                            eius maxime quaerat.
                            <a href="https://mega.nz/#!1J01nRIb!lMZ4B_DR2UWi9SRQK5TTzU1PmQpDtbZkMZjAIbv97hU" target="_blank">https://mega.nz/#!1J01nRIb!lMZ4B_DR2UWi9SRQK5TTzU1PmQpDtbZkMZjAIbv97hU</a>
                        </p>
                    </div>
                    <div class="card-footer">
                       <i class="btn btn-primary">🤍  힘내요</i>  <i>0</i>
                       <i class="btn btn-primary">🗨  응원</i>
                       <i class="btn btn-primary">🔽 응원 보기 </i>
                    </div>
                    
                      <!--  댓글 시작 -->
                     <div class="card card-inner"> 
	                    <div class="card-body">
					        <div class="row">        	 
		                            <div class="d-flex justify-content-between align-items-center">
		                                <div class="mr-2">
		                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
		                                </div>
		                                <div class="ml-2">
		                                    <div class="inline-div">
		                                    	<div class=" text-bk">
		                                    		<p><strong>작성자 이름</strong>		<span>시간</span></p>
		                                    	</div>
		                                    	<div class="h7 text-muted">
		                                    		<p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting</p>
		                                    	</div>
		                                    	<div class="">
							                       <i class="btn btn-primary">🤍  힘내요</i>  <i>0</i>
							                       <i class="btn btn-primary">🗨  응원</i>					                       
							                    </div>		                                    
		                                    </div>      
		                                </div>
	                            	</div>
				       		 </div>
				        	<div class="card card-inner">
			            	    <div class="card-body">
			            	        <div class="row">        	 
			                            <div class="d-flex justify-content-between align-items-center">
			                                <div class="mr-2">
			                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
			                                </div>
			                                <div class="ml-2">
			                                    <div class="inline-div">
			                                    	<div class=" text-bk">
			                                    		<p><strong>작성자 이름</strong>		<span>시간</span></p>
			                                    	</div>
			                                    	<div class="h7 text-muted">
			                                    		<p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting</p>
			                                    	</div>
			                                    	<div class="">
								                       <i class="btn btn-primary">🤍  힘내요</i>  <i>0</i>
								                       <i class="btn btn-primary">🗨  응원</i>					                       
								                    </div>		                                    
			                                    </div>      
			                                </div>
		                            	</div>
					       			 </div>
			            	    </div>
				            </div>
				    	</div>
				    </div>
				</div>
                </div>
                <!-- Post /////-->

				 <c:forEach items="${customers}" var="customer" >
			      	customer.customerName
			      
			      </c:forEach>

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
    
  </body>
</html>