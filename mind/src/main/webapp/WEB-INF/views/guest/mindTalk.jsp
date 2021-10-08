<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<!-- 마음톡톡 -->
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
    
<!-- 메인 배너 -->
<div class="hero-wrap hero-wrap-2" style="background-image: url(../images/banner_talktalk.jpg);" data-stellar-background-ratio="0.5">
</div>
<!-- 메인 배너 종료 -->

    <section class="ftco-section">
    
  <div class="row">
    <!-- 로그인중인 고객번호 -->
	<input type="hidden" id="writer" value="${tokenNum }">
	<!--프로필   -->
		<div class="col-md-3">
			<div class="twPc-div">
			    <a class="twPc-bg twPc-block"></a>
			
				<div>
					
			
					<a title="Mert S. Kaplan" href="https://twitter.com/mertskaplan" class="twPc-avatarLink">
						<img alt="Mert S. Kaplan" src="https://mertskaplan.com/wp-content/plugins/msk-twprofilecard/img/mertskaplan.jpg" class="twPc-avatarImg">
					</a>
			
					<div class="twPc-divUser">
						<div class="twPc-divName">
							<a href="https://twitter.com/mertskaplan">Mert S. Kaplan</a>
						</div>
						<span>
							<a href="https://twitter.com/mertskaplan">@<span>mertskaplan</span></a>
						</span>
					</div>
			
					<div class="twPc-divStats">
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
					</div>
				</div>
			</div>
		</div>
		
      <div class="container only-desc-small col-md-6">
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
				<div class="infinity">
				<!--  리스트 -->
				<c:forEach items="${talkList.content }" var="talk">
				
				 <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                <div class="bg-blue-20"></div>
                <input type ="hidden" class="talk-num" value="${talk.talkNum }">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center ">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                
                                    <div class="h5 m-0" data-toggle="dropdown">${talk.customer.customerName }
                                    		<div class="dropdown-menu">
												<a onclick='location.href="/searchUser?userNum=${talk.customer.customerNum }"' class="dropdown-item searchUser" >게시글 보기</a>
												<a onclick='location.href="/invitation?userNum=${talk.customer.customerNum }&userName=${talk.customer.customerName }"' class="dropdown-item goTalk" >톡하기</a>
											</div>
                                    
                                   
                               </div>     
                            <%--         <c:set var="dateData" value="${fn:replace(talk.talkDate,'T',' ') }"></c:set>
                                    <fmt:parseDate value="${dateData }" pattern="yyyy-MM-dd HH:mm:ss" var="w_date">
                                    <fmt:formatDate value="${w_date }" pattern="yyyy-MM-dd HH:mm:ss"  var="a_date" /> 
                                    </fmt:parseDate>
 --%>
								<%-- 	<c:out value="${today}"/> --%>
                                <%--    	 <c:out value ="${w_date }"></c:out> --%>


                                    
                                    <div class="h7 text-muted"><span>${talk.talkDate }</span></div>
                                     <%-- <div class="h7 text-muted"><span>
                                     
                                     
                                     </span></div>
                                     <div>
                                     	<c:set var="now" value="<%=new java.util.Date()%>" />
                                     	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd'T'hh:mm:ss" />
                                     <fmt:parseDate value="${talk.talkDate }" var="strPlanDate" pattern="yyyy-MM-dd'T'hh:mm:ss"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${now }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
									${endDate - strDate }
									

</div> --%>
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
          <%--           	
                    	<c:choose>
                    		<c:when test="${likeTalkCheck  }">
                    			<span class="btn btn-primary">❤ ${talk.talkCnt}</span> 
                    		</c:when>
                    		
                    		<c:otherwise>
                    			<span class="btn btn-primary">🤍  ${talk.talkCnt}</span>  
                    		</c:otherwise>
                    		
           
                     
                     
                     
                     </c:choose> --%>
                     
                    	<%--  <span class="btn btn-primary talkHeart">🤍  </span>  <span class="talkLikeCount">${talk.talkCnt}</span>
                    	
                       <span class="btn btn-primary cheerUPBtn">🗨  
                       <input class="talkNum" type="hidden" value="${talk.talkNum }"></span>
                       <c:if test="${ tokenNum eq talk.customer.customerNum }">

                       <span class="btn btn-primary deleteTalkBtn">❌ </span>
                       </c:if> --%>
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


                
                   
                   
               <%--  <div class="card card-inner"> 
                    <c:forEach items="${talkReviewList}" var="review" varStatus="status">
                   	<c:if test="${review.talk.talkNum eq talk.talkNum }">
	                    <div class="card-body"  style="margin-left:${review.tkClass * 5}%">
					        <div class="row" style="margin-left:10px">        	 
		                            <div class="d-flex justify-content-between align-items-center" >
		                                <div class="mr-2">
		                                	<div class="col-12">
		                                    	<img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
		                                    </div>
		                                    <div class="col-12">
		                                    	<span>시간</span>
		                                    </div>
		                                </div>
		                                <div class="ml-2">
		                                    <div class="inline-div " style="width=100%">
		                                    	<div class=" text-bk">
		                                    		<p><strong>${review.customer.customerName }</strong> &nbsp;&nbsp;${review.talkReviewCon }</p>
		                                    	</div>
		                                    	<div class="h7 text-muted">
		                                    		
		                                    	</div>
		                                    	<div class="">
							                       <span class="btn btn-primary">🤍${review.talkReviewCnt }  </span>  
							                       <span class="btn btn-primary cheerUPBtn2">🗨  </span>	
							                       <input type="hidden" class="tkClass" value="${review.tkClass}">	
							                        <input type="hidden" class="groupNum" value="${review.groupNum}">
							                         <input type="hidden" class="talkReviewNum" value="${review.talkReviewNum}">
							                         <c:if test="${ tokenNum eq talk.customer.customerNum }">
							                          <span class="btn btn-primary deleteReviewBtn">❌ </span>	
							                         </c:if>				                       
							                    </div>
							                    <div class="insert-group-area"></div>		                                    
		                                    </div>      
		                                </div>
		                                
	                            	</div>
				       			 </div>
				       		</div> 
				       		</c:if>
				       		 	</c:forEach>
            
				       		  </div>   --%>
				       		

                  </div>
                      <!--댓글 종료  -->
                  
				</div>
				   </c:forEach>
             </div>
                <div class="pageNation"></div>  
                <!-- Post /////-->
                
             
				<!--  test ///// -->
				
				 </div>	
	
                </div>
	</div>
    <div class="col-md-3">
   <%--  	<jsp:include page="./chat.jsp">
    		<jsp:param value="${tokenNum }" name=""/>
    	</jsp:include> --%>
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
  <script src="../custom/mindTalk.js"></script>
  </body>
</html>


<!-- 
 <c:forEach items="${talk.talkReview}" var="review" varStatus="status">
                   	
	                    <div class="card-body"  style="margin-left:${review.tkClass * 5}%">
					        <div class="row" style="margin-left:10px">        	 
		                            <div class="d-flex justify-content-between align-items-center" >
		                                <div class="mr-2">
		                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
		                                </div>
		                                <div class="ml-2">
		                                    <div class="inline-div " style="width=100%">
		                                    	<div class=" text-bk">
		                                    		<p><strong>${review.customer.customerName }</strong>		<span>시간</span></p>
		                                    	</div>
		                                    	<div class="h7 text-muted">
		                                    		<p>${review.talkReviewCon }</p>
		                                    	</div>
		                                    	<div class="">
							                       <span class="btn btn-primary">🤍  힘내요</span>  <span>0</span>
							                       <span class="btn btn-primary cheerUPBtn2">🗨  응원</span>	
							                       <input type="hidden" class="tkClass" value="${review.tkClass}">	
							                        <input type="hidden" class="groupNum" value="${review.groupNum}">
							                         <input type="hidden" class="talkReviewNum" value="${review.talkReviewNum}">
							                         <c:if test="${ tokenNum eq talk.customer.customerNum }">
							                          <span class="btn btn-primary deleteReviewBtn">❌삭제 </span>	
							                         </c:if>				                       
							                    </div>
							                    <div class="insert-group-area"></div>		                                    
		                                    </div>      
		                                </div>
		                                
	                            	</div>
				       			 </div>
				       		</div> 
				       		 	</c:forEach>


 -->