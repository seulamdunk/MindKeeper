<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String lastTalkNum="300"; %>
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
    
    <div class="hero-wrap hero-wrap-3" style="background-image: url(../images/banner_talktalk.jpg); background-position: 50% 50%;">
    </div>

    <section class="ftco-section">
    
  <div class="row">
    <!-- 로그인중인 고객번호 -->
	<input type="hidden" id="writer" value="${tokenNum }">
	<!--프로필   -->
		<div class="col-md-3">
			<div class="twPc-div">
			    <a class="twPc-bg twPc-block"></a>
			
				<div>
					
			
					<a title="Mert S. Kaplan" href="#" class="twPc-avatarLink">
						<img alt="Mert S. Kaplan" src="{user.customerNick }" width=72px height=72px class="twPc-avatarImg">
					</a>
			
					<div class="twPc-divUser">
						<div class="twPc-divName">
							<a href="#">${user.customerNick }</a>
						</div>
						<span>
							<a href="#">가입일<span>${fn:substring(user.createDate,0,10) }</span></a>
						</span>
					</div>
			
					<!-- div class="twPc-divStats">
						<ul class="twPc-Arrange">
							<li class="twPc-ArrangeSizeFit">
								<a href="https://twitter.com/mertskaplan" title="9.840 Tweet">
									<span class="twPc-StatLabel twPc-block">Tweets</span>
									<span class="twPc-StatValue">9.840</span>
								</a>
							</li>
							<li class="twPc-ArrangeSizeFit">
								<a href="https://twitter.com/mertskaplan/following" title="885 Following">
									<span class="twPc-StatLabel twPc-block">Following</span>
									<span class="twPc-StatValue">885</span>
								</a>
							</li>
							<li class="twPc-ArrangeSizeFit">
								<a href="https://twitter.com/mertskaplan/followers" title="1.810 Followers">
									<span class="twPc-StatLabel twPc-block">Followers</span>
									<span class="twPc-StatValue">1.810</span>
								</a>
							</li>
						</ul>
					</div> -->
					
					
				</div>
			</div>
		</div>
		
      <div class="container main-con only-desc-small col-md-6">
      	 <div class="row">
           
            <div class="col-md-12 gedf-main">

                <!--- \\\\\\\글쓰기-->
                <div class="card gedf-card">
                    <div class="card-header bg-blue-20">
                        
                    </div>
                    <form name="talk_frm" id="talk_frm" method="post" action="/insertTalk?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
	                    <div class="card-body">
	                        <div class="tab-content" id="myTabContent">
	                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
	                                <div class="form-group">
	                                    <label class="sr-only" for="message">post</label>
	                                    <textarea class="form-control" id="talkCon" name="talkCon" rows="10" placeholder="마음톡톡"></textarea>
	                                     <textarea class="form-control" id="tag" name="tag" rows="2" placeholder="#으로 구분"></textarea>
	                                </div>
	
	                            </div>
	                      
	                        </div>
	                        <div class="btn-toolbar justify-content-between">
	                      		  <div class="form-group">
	                                    <div class="custom-file">
	                                        <input type="file" class="custom-file-input" id="files" name="files" multiple="multiple">
	                                        <label class="custom-file-label" for="files">Upload image</label>
	                                    </div>
	                                    
	                               </div>
	                            <div class="btn-group">
	                                <!-- <button type="button" onclick="insertTalk()" class="btn btn-primary">올리기</button> -->
	                                 <button type="submit" class="btn btn-primary">올리기</button>
	                                  <%--   <button type="button" class="btn btn-primary">${tokenNum}</button>  --%>
	                            </div>
	                           
	                        </div>
	                        <div class="miribogi">
								<div class="select_img">
									<img src=""> <!-- 이곳에 타이틀 사진이미지가 보인다 -->
								</div>
								
							</div>
                    </div>
                    </form>
                </div>
     
  				<jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
				<div id="infinity">
				<!--  리스트 -->
				<c:forEach items="${talkList.content }" var="talk" varStatus="status">
				<div class="pageItem">
				 <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                <div class="bg-blue-20"></div>
                <input type ="hidden" class="talk-num" id="${talk.talkNum }"value="${talk.talkNum }">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center ">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                
                                    <div class="mindTalk-id m-0" data-toggle="dropdown">${talk.customer.customerNick }
                                    		<div class="dropdown-menu">
												<a onclick='location.href="/searchUser?userNum=${talk.customer.customerNum }"' class="dropdown-item searchUser" >게시글 보기</a>
											<c:if test="${talk.customer.customerNum != tokenNum  }"><a onclick='location.href="/invitation?userNum=${talk.customer.customerNum }&userName=${talk.customer.customerNick }"' class="dropdown-item goTalk" >톡하기</a></c:if>	
											</div>
                                    
                                   
                               </div>     

                                    
                                    <div class="h7 text-muted"><span>${talk.talkDate }</span></div>
               
                                </div>
                            </div>
                           
                        </div>

                    </div>
                    
                  
                    <div class="card-body">
                      <!--   <div class="text-muted h7 mb-2"> <span class="fa fa-clock-o"></span> Hace 40 min</div> -->
                        <!-- <a class="card-link" href="#">
                            <h5 class="card-title">Totam non adipisci hic! Possimus ducimus amet, dolores illo ipsum quoscum.</h5>
                        </a> -->

                        <p class="card-text">
                            ${talk.talkCon }
                            
                        </p>
                        <hr>
                        <p class="card-text">
                        <c:forEach items="${fn:split(fn:substring(talk.tag,1,fn:length(talk.tag)),'#')}" var='tag' >
                        		<a>#${tag }&nbsp</a>
                            </c:forEach>
                        </p>
                        <div class="img-display">
                        <img  src="${talk.talkImg[0].filePath }"/>
                        </div>
                    </div>
                  
                    
                    <div class="card-footer taklLikeArea${talk.talkNum }">
        
                     
                    	
					<jsp:include page="./likeTalk.jsp">
						<jsp:param value="${talk.talkNum }" name="talkNum"/>
						<jsp:param value="${tokenNum }" name="tokenNum"/>
						<jsp:param value="${talk.customer.customerNum }" name="writer"/>
					</jsp:include>
                    </div>
                      <!--댓글 입력 창  -->
				       		<div class="inser-area justify-content-center">
				       			<form class="review-frm" method="post" action="insertReview">
				       				<div class="review-group">
						       			 <!-- <div class="mr-2">
		                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
		                                </div> -->
						       			<div class="review-textarea-div">
						       		
						       			
											<div  class="review-textarea" contenteditable="true"placeholder="응원의 한마디" ></div>
						       				<div class="review-btn "><span>💌</span></div>
						       				
						       				
						       			</div>
						       			
						       		

						       		</div>	
				       			</form>
				       		</div>
				       		
				       	 <!--  댓글 시작 -->	
				     
                    <div class="cheerUPArea${talk.talkNum }">
                    	 <div class="card card-inner"> 
              <%--   <%@ include file="talkReview.jsp"  %>  --%>
              		  <jsp:include page="./talkReview.jsp" flush="false">
            			  		<jsp:param name="talkNum" value="${talk.talkNum }" />          
            			  		<jsp:param name="tokenNum" value="${tokenNum }" />                  
      					  </jsp:include>
				</div>



                  </div>
                      <!--댓글 종료  -->
                  
				</div>
		
				</div>
				   </c:forEach>
				   <div class="pageItem">
				   </div>
             </div>
                <a class="pageNation" href="#"></a>  
                <!-- Post /////-->
             
             
				<!--  test ///// -->
				
				 </div>	
	
                </div>
	</div>
    <div class="col-md-3 button-css">

    	
    	<div class="share">
  <i class="fa fa-plus"></i>
	</div>
	  <div class="one">
	   <i class="fas fa-video"></i>
	  </div>
	  <div class="two">
	    <i class="fa fa-twitter"></i>
	  </div>
	  <div class="three">
	    <i class="fa fa-instagram"></i>
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
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="../js/google-map.js"></script> -->
  <script src="../js/main.js"></script>
  <script src="../custom/mindTalk.js"></script>


  </body>
</html>


