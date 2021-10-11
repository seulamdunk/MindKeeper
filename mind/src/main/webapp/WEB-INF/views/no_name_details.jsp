<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>상세보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/bootstrap.min2.css" type="text/css">
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
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="/">Home</a></span> <span>익명상담게시판</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">상세보기</h1>
          </div>
        </div>
      </div>
    </div>
	   <div class="board_wrap">
        <div class="board_title">
            <strong>익명상담게시판</strong>
			<p>익명으로 글이 작성되니 안심하고 상담하시기 바랍니다.</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                   		${noName.noNameTitle }
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                       <dd><span id="noNameNum">${noName.noNameNum }</span></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>익명</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${noName.noNameDate }</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${noName.noNameCount }</dd>
                    </dl>
                </div>
                <div class="cont textview">
                    ${noName.noNameCon }
                </div>
            </div>
            <br/>
            <button class="btn btn-primary" onclick="history.back()">돌아가기</button>
          <c:if test="${noName.customer.customerNum == tokenNum}"> 
            <a href="/n_details/edit/${noName.noNameNum}" class="btn btn-warning">수정</a>
            <button id="btn-delete" class="btn btn-danger" onclick="deleteById();">삭제</button>
          </c:if>
        </div>
        <hr/>
		<div class="card">
			<form>
			<input type="hidden" id="noNameNum2" value="${noName.noNameNum }" />
				<div class="car-body">
					<textarea id="reply-content" class="form-control" rows="1"></textarea>
				</div>
				<div class="car-footer">
					<button class="btn btn-primary" onclick="replySave();">등록</button>
				</div>
			</form>
		</div>
		<br/>
        <div>
        	<div class="card-header">댓글 목록</div>
			<ul class="list-group" id="reply--box">
				<c:forEach var="reply" items="${noName.noNameReply }">
					<li class="list-group-item d-flex justify-content-between"
						id="reply--1">
						<div>${reply.noNameReplyCon }</div>
						<div class="d-flex">
							<div>작성자: 익명 &nbsp;</div>
							<c:if test="${noName.customer.customerNum == tokenNum}"> 
							<input type="hidden" id="noNameReplyNum" value="${reply.noNameReplyNum }" />
							<button onClick="replyDelete();" class="badge btn btn-primary" >삭제</button>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
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
  <script src="../js/noname/delete.js"></script>
  <script src="../js/noname/reply_save.js"></script>
  <script src="../js/noname/reply_delete.js"></script>
  </body>
</html>