<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<div id="colorlib-logo"><a href="/"><img alt="" src="../images/logo_w.png" style="width: 100%"></a></div>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="myPage?customerNum=<%=request.getParameter("customerNum") %>">Mypage</a></li>
					<li><a href="secretDiaryList?customerNum=<%=request.getParameter("customerNum") %>">Secret Diary</a></li>
					<li><a href="secretCalendar2?customerNum=<%=request.getParameter("customerNum") %>">Calendar</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				<ul>
					<li><a href="#"><i class="icon-facebook"></i></a></li>
					<li><a href="#"><i class="icon-twitter"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin"></i></a></li>
				</ul>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->