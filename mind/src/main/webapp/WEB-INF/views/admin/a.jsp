<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Ultim8 - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="../css/admin/css/style.css">
    
        <link href="../css/admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

  </head>
  <body>
    
  
    <div class="hero-wrap hero-wrap-2" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="row no-gutters d-flex slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          	<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Team</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Team</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-5">
        
        </div>
        <div class="row">
        	
        </div>
        	<div class="col-lg-3 d-flex mb-sm-4 ftco-animate">
        		<table id="products" border="1" class="table">
	<caption>product list
		<form action="" id="setRows">
			<p>
				showing
				<input type="text" name="rowPerPage" value="5">
				item per page
			</p>
		</form>

	</caption>

	<thead class="thead-primary">
		<tr>
			<th>No</th>
			<th>Category</th>
			<th>Product</th>
		</tr>
	</thead>
	<tbody id="customerList">

	</tbody>

</table>
        	</div>
        </div>
    </section>

    
    <!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/admin/customerList.js"></script>
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
  <script>
  var $setRows = $('#setRows');

  $setRows.submit(function (e) {
  	e.preventDefault();
  	var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

//  		console.log(typeof rowPerPage);

  	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
  	if (!rowPerPage) {
  		alert(zeroWarning);
  		return;
  	}
  	$('#nav').remove();
  	var $products = $('#products');

  	$products.after('<div id="nav">');


  	var $tr = $($products).find('tbody tr');
  	var rowTotals = $tr.length;
//  	console.log(rowTotals);

  	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
  	var i = 0;

  	for (; i < pageTotal; i++) {
  		$('<a href="#"></a>')
  				.attr('rel', i)
  				.html(i + 1)
  				.appendTo('#nav');
  	}

  	$tr.addClass('off-screen')
  			.slice(0, rowPerPage)
  			.removeClass('off-screen');

  	var $pagingLink = $('#nav a');
  	$pagingLink.on('click', function (evt) {
  		evt.preventDefault();
  		var $this = $(this);
  		if ($this.hasClass('active')) {
  			return;
  		}
  		$pagingLink.removeClass('active');
  		$this.addClass('active');

  		// 0 => 0(0*4), 4(0*4+4)
  		// 1 => 4(1*4), 8(1*4+4)
  		// 2 => 8(2*4), 12(2*4+4)
  		// 시작 행 = 페이지 번호 * 페이지당 행수
  		// 끝 행 = 시작 행 + 페이지당 행수

  		var currPage = $this.attr('rel');
  		var startItem = currPage * rowPerPage;
  		var endItem = startItem + rowPerPage;

  		$tr.css('opacity', '0.0')
  				.addClass('off-screen')
  				.slice(startItem, endItem)
  				.removeClass('off-screen')
  				.animate({opacity: 1}, 300);

  	});

  	$pagingLink.filter(':first').addClass('active');

  });


  $setRows.submit();
  </script>
    
  </body>
</html>