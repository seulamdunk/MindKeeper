<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>수정하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/bootstrap.min2.css" type="text/css">
    <link rel="stylesheet" href="../../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../../css/animate.css">
    
    <link rel="stylesheet" href="../../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../../css/magnific-popup.css">

    <link rel="stylesheet" href="../../css/aos.css">

    <link rel="stylesheet" href="../../css/ionicons.min.css">

    <link rel="stylesheet" href="../../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../../css/flaticon.css">
    <link rel="stylesheet" href="../../css/icomoon.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../../css/css/noname/css.css">
    <link rel="stylesheet" href="../../css/css/noname/media.css">
    <link rel="stylesheet" href="../../css/css/noname/style.css">
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
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">수정하기</h1>
          </div>
        </div>
      </div>
    </div>


	<div class="board_wrap">
		<div class="board_title">
			 <strong>익명상담게시판</strong>
			<p>익명으로 글이 작성되니 안심하고 상담하시기 바랍니다.</p>
		</div>
		
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
				<form action="/n_details/edit/${noNameDTO.noNameNum }" method="post" >
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" placeholder="제목 입력" value="${noNameDTO.noNameTitle }" name="noNameTitle">
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>글쓴이</dt>
						<dd>
							<input type="text" placeholder="글쓴이 입력" value="익명" readonly>
						</dd>
					</dl>
				</div>
				<div class="cont">
					<textarea placeholder="내용 입력" name="noNameCon" >${noNameDTO.noNameCon }</textarea>
				</div>
			</div>
			<div class="bt_wrap">
				<input type="submit" value="수정하기" class="btn btn-primary bst">
				<input type="button" class="btn btn-primary" value="취소하기" onclick="location.href='/n_name'">
			</div>
			<input type="hidden" name="_method" value="put"/>
        	<input type="hidden" class="form-control" name="customerNum" value=1 />
        	<input type="hidden" class="form-control" name="noNameNum" value='${noNameDTO.noNameNum }' />
			</form>
		</div>
	</div>




	<!-- footer -->
  <jsp:include page="footer.jsp"></jsp:include>

  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../../js/popper.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/jquery.easing.1.3.js"></script>
  <script src="../../js/jquery.waypoints.min.js"></script>
  <script src="../../js/jquery.stellar.min.js"></script>
  <script src="../../js/owl.carousel.min.js"></script>
  <script src="../../js/jquery.magnific-popup.min.js"></script>
  <script src="../../js/aos.js"></script>
  <script src="../../js/jquery.animateNumber.min.js"></script>
  <script src="../../js/bootstrap-datepicker.js"></script>
  <script src="../../js/jquery.timepicker.min.js"></script>
  <script src="../../js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../../js/google-map.js"></script>
  <script src="../../js/main.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
   <script src="../../js/update.js"></script>
  
  <script>
 /* var date = $("#date").text()
 
 date=date.substring(0,19)
  alert(date);

 $("#datetime").val(date)
  */
 
</script>


  </body>
</html>