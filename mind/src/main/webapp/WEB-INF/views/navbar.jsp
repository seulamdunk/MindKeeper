<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/">마음지킴이</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/corona" class="nav-link">코로나현황</a></li>
	          <li class="nav-item"><a href="/weather" class="nav-link">날씨 현황</a></li>
	          <li class="nav-item"><a href="/guest/park" class="nav-link">마음기르기</a></li>
	          <li class="nav-item"><a href="/no_name" class="nav-link">익명게시판</a></li>
	          <li class="nav-item"><a href="/guest/mindTalk" class="nav-link">마음톡톡</a></li>
	          <li class="nav-item"><a href="/guest/mindGrow"class="nav-link">마음가꾸기</a></li>
	          <c:choose>
			    <c:when test="${cookie.token.value==null}">
		          	<li class="nav-item cta"><a href="/guest/signin" class="nav-link" ><span>로그인</span></a></li>
			    </c:when>
			    <c:otherwise>
			    	<li class="nav-item"><a href="/user/myPage?customerNum=<%=request.getParameter("customerNum") %>" class="nav-link">마이페이지</a></li>
		          	<li class="nav-item cta"><a href="/user/signout" class="nav-link" ><span>로그아웃</span></a></li>
			    </c:otherwise>
	          </c:choose>
	          <li id="admin" class="nav-item cta"></li>
	        	
	        </ul>
	      </div>
	    </div>
	  </nav>

<script src="js/admin/jquery/jquery.min.js"></script>
<script>
userCheck()

function userCheck(){
	$.ajax({
	type:"POST",
	url:"/user/userCheck",
	success:function(result){
        if(result=="ROLE_ADMIN"){
        	$('#admin').html('<a href="/admin/adminindex" class="nav-link" ><span>관리자페이지</span></a>')
        }
	},
	error:function(err){
		console.log(err)
	}
	})	
}
</script>