<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Ultim8 - Free Bootstrap 4 Template by Colorlib</title>
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
    
      <!-- Vendor CSS Files -->
  <link href="../css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../css/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../css/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../css/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
  <!-- Template Main CSS File -->
  <link href="../css/assets/css/style.css" rel="stylesheet">
    
  </head>
  <body>
	<jsp:include page="../navbar.jsp">
	<jsp:param value="${user.customerNum }" name="customerNum" />
	</jsp:include>
    <!-- END nav -->
    
    <div class="hero-wrap" style="background-image: url(../images/bg_10.jpg);">
      <div class="overlay"></div>
      <div class="container-fluid">
        <div class="slider-text d-md-flex align-items-center" data-scrollax-parent="true">

          <div class="one-forth ftco-animate align-self-md-center" data-scrollax=" properties: { translateY: '70%' }">
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="/guest/signup" class="btn btn-primary px-4 py-3">Get a Quote</a></p>
          </div>
 
          
        </div>
      </div>
    </div>
    
    
    <!--  
    <section class="ftco-section ftco-section-2">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row">
    			<div class="col-md-8" style="align-self: center;">
    				<h3 class="heading-white">I AM YOUR MINDKEEPER</h3>
    			</div>
    		</div>
    	</div>
    </section>
  

    <section class="ftco-section ftco-services">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">Our Service Keeps you Happy</h2>
            <span class="subheading">Search Engine &amp; Social Media Optimization Experts</span>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-research"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Market Research</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-creativity"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Business Strategy</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-market"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Audience Analytics</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
      <div class="container-wrap mt-5">
      	<div class="row d-flex no-gutters">
      		<div class="col-md-6 img ftco-animate" style="background-image: url(../images/about.jpg);">
      		</div>
      		<div class="col-md-6 d-flex">
      			<div class="services-wrap">
      				<div class="heading-section mb-5 ftco-animate">
		            <h2 class="mb-2">Our Service Keeps you Happy</h2>
		            <span class="subheading">Search Engine &amp; Social Media Optimization Experts</span>
		          </div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-pencil"></span>
      					</div>
      					<div class="text">
	      					<h3>Logo Branding</h3>
	      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
      					</div>
      				</div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-web"></span>
      					</div>
      					<div class="text">
	      					<h3>Development</h3>
	      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
      					</div>
      				</div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-pie-chart"></span>
      					</div>
      					<div class="text">
	      					<h3>Online Marketing</h3>
	      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
      					</div>
      				</div>
      			</div>
      		</div>
      	</div>
      </div>
    </section>
    -->
 
 <!--  코로나
    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(../images/bg_1.jpg);" data-stellar-background-ratio="0.5">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-11">
		    		<div class="row">
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="6780">0</strong>
		                <span>확진환자</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="4500">0</strong>
		                <span>격리해제</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="4200">0</strong>
		                <span>사망자</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="320">0</strong>
		                <span>검사진행</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
     -->


    <section class="ftco-section ftco-work">
    	<div class="container-fluid">
    		<div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2" style="margin-top: 50px;">마음 건강 지키는 7가지 수칙</h2>
            <span class="subheading">마음지킴이는 보건복지부가 배포한 ‘코로나19와 함께하는 마음 건강 지키는 7가지 수칙’을<br>기반으로 맞춤형 컨텐츠를 제공합니다.</span>
          </div>
          
          <!-- 마음방역수칙 설명 ************************************************ -->
          <section id="services" class="services">
      <div class="container">

        <div class="row">
          <div class="col-lg-6 order-2 order-lg-1">
            <div class="icon-box mt-5 mt-lg-0 aos-init aos-animate" data-aos="fade-up">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>코로나로 인해 변화된 일상을 받아들이세요</h4>
              <p>코로나 장기화로 인해 피로감, 우울, 불안감을 느끼는것은 새로운 변화에 적응하기 위한 정상적인 과정입니다</p>
            </div>
            <div class="icon-box mt-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>지나친 걱정은 NO! 방역지침을 잘 알고 실천하면 됩니다</h4>
              <p>너무 많은 정보나 불확실한 정보는 불안과 스트레스를 가중시킬수 있습니다. 방역지침에 관심을 기울이고 생활 속에서 실천해주세요</p>
            </div>
            <div class="icon-box mt-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>규칙적인 생활을 하세요</h4>
              <p>규칙적인 생활을 통해 일상생활을 유지하면 몸과 마음의 면역력을 함께 높일 수 있습니다</p>
            </div>
            <div class="icon-box mt-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>마음이 즐거워지는 취미나 여가시간을 가져보세요</h4>
              <p>일상의 스트레스에서 벗어나 재충전의 시간을 가짐으로써 마음이 힘들어질때 극복할 수 있는 에너지를 쌓을 수 있습니다</p>
            </div>
            <div class="icon-box mt-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>스트레칭, 걷기, 운동 등 신체활동을 규칙적으로 하세요</h4>
              <p>적당한 신체활동은 마음의 건강을 유지하는 데도 도움이 됩니다. 몸의 건강을 통해 마음건강도 지키세요</p>
            </div>
            <div class="icon-box mt-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
              <i class="bx bxs-bookmark-heart"></i>
              <h4>가족, 친구 등 주변 사람들과 소통을 이어가세요</h4>
              <p>우리 모두 코로나와 함께 하고 있습니다. 영상통화, 이메일 등을 통해 친구, 동료 등 진심으로 마음을 주고받을 수 있는 사람들과 소통하세요</p>
            </div>
          </div>
          <div class="image col-lg-6 order-1 order-lg-2 aos-init aos-animate" style="background-image: url(../css/assets/img/logo_bogun.jpg);" data-aos="fade-left" data-aos-delay="100"></div>
        </div>

      </div>
    </section>
          <!-- end of 마음방역수칙 설명 ******************************************* -->

          
        </div>
        <div class="row">
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-1.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 01</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-2.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 02</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-3.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 03</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-4.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 01</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-5.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 02</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        	<div class="col-md-4 ftco-animate">
        		<div class="work-entry">
	        		<a href="#" class="img" style="background-image: url(../images/work-6.jpg);">
	        			<div class="text d-flex justify-content-center align-items-center">
		        			<div class="p-3">
		        				<span>Branding</span>
		        				<h3>Work 03</h3>
		        			</div>
	        			</div>
	        		</a>
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-3">Our Best Pricing</h2>
            <span class="subheading">Pricing Plans</span>
          </div>
        </div>
    		<div class="row">
	        <div class="col-md-3 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Free</h2>
	            <span class="price"><sup>$</sup> <span class="number">0</span></span>
	            <span class="excerpt d-block">100% free. Forever</span>
	            <a href="#" class="btn btn-primary d-block px-2 py-3 mb-4">Get Started</a>
	            
	            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text">
	              <li><strong>150 GB</strong> Bandwidth</li>
	              <li><strong>100 GB</strong> Storage</li>
	              <li><strong>$1.00 / GB</strong> Overages</li>
	              <li>All features</li>
	            </ul>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-3 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Startup</h2>
	            <span class="price"><sup>$</sup> <span class="number">19</span></span>
	            <span class="excerpt d-block">All features are included</span>
	            <a href="#" class="btn btn-primary btn-outline-primary d-block px-3 py-3 mb-4">Get Started</a>
	            
	            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text">
	              <li><strong>450 GB</strong> Bandwidth</li>
	              <li><strong>400 GB</strong> Storage</li>
	              <li><strong>$2.00 / GB</strong> Overages</li>
	              <li>All features</li>
	            </ul>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-3 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Premium</h2>
	            <span class="price"><sup>$</sup> <span class="number">49</span></span>
	            <span class="excerpt d-block">All features are included</span>
	            <a href="#" class="btn btn-primary btn-outline-primary d-block px-3 py-3 mb-4">Get Started</a>
	            
	            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text">
	              <li><strong>250 GB</strong> Bandwidth</li>
	              <li><strong>200 GB</strong> Storage</li>
	              <li><strong>$5.00 / GB</strong> Overages</li>
	              <li>All features</li>
	            </ul>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-3 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
	            <h2 class="heading">Pro</h2>
	            <span class="price"><sup>$</sup> <span class="number">99</span></span>
	            <span class="excerpt d-block">All features are included</span>
	            <a href="#" class="btn btn-primary btn-outline-primary d-block px-3 py-3 mb-4">Get Started</a>
	            
	            <h3 class="heading-2 mb-4">Enjoy All The Features</h3>
	            
	            <ul class="pricing-text">
	              <li><strong>450 GB</strong> Bandwidth</li>
	              <li><strong>400 GB</strong> Storage</li>
	              <li><strong>$20.00 / GB</strong> Overages</li>
	              <li>All features</li>
	            </ul>
	            </div>
	          </div>
	        </div>
	      </div>
    	</div>
    </section>

    <section class="ftco-quote">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-6 pr-md-5 aside-stretch py-5 choose">
    				<div class="heading-section heading-section-white mb-5 ftco-animate">
	            <h2 class="mb-2">Reasons for Choosing Us </h2>
	          </div>
	          <div class="ftco-animate">
	          	<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. Because there were thousands of bad Commas, wild Question Marks and devious Semikoli</p>
	          	<ul class="un-styled my-5">
	          		<li><span class="icon-check"></span>Consectetur adipisicing elit</li>
	          		<li><span class="icon-check"></span>Adipisci repellat accusamus</li>
	          		<li><span class="icon-check"></span>Tempore reprehenderit vitae</li>
	          	</ul>
	          </div>
    			</div>
    			<div class="col-md-6 py-5 pl-md-5">
    				<div class="heading-section mb-5 ftco-animate">
	            <h2 class="mb-2">Get a Free Quote</h2>
	          </div>
	          <form action="#" class="ftco-animate">
	          	<div class="row">
	          		<div class="col-md-6">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Full Name">
		              </div>
	              </div>
	              <div class="col-md-6">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Email">
		              </div>
	              </div>
	              <div class="col-md-6">
	              	<div class="form-group">
		                <input type="text" class="form-control" placeholder="Phone">
		              </div>
		            </div>
	              <div class="col-md-6">
	              	<div class="form-group">
		                <input type="text" class="form-control" placeholder="Website">
		              </div>
		            </div>
		            <div class="col-md-12">
		              <div class="form-group">
		                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
		              </div>
		            </div>
		            <div class="col-md-12">
		              <div class="form-group">
		                <input type="submit" value="Get a Quote" class="btn btn-primary py-3 px-5">
		              </div>
	              </div>
              </div>
            </form>
    			</div>
    		</div>
    	</div>
    </section>
		

		<section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">Testimony</h2>
            <span class="subheading">Our Happy Customer Says</span>
          </div>
        </div>
        <div class="row justify-content-center ftco-animate">
          <div class="col-md-8">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(../images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5">Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                    <p class="name">Dennis Green</p>
                    <span class="position">Marketing Manager</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(../images/person_2.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Dennis Green</p>
                    <span class="position">Interface Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(../images/person_3.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Dennis Green</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(../images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Dennis Green</p>
                    <span class="position">Web Developer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(../images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Dennis Green</p>
                    <span class="position">System Analytics</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">Latest Blog</h2>
            <span class="subheading">Read our blog</span>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 ftco-animate">
            <div class="blog-entry">
              <a href="blog-single.jsp" class="block-20" style="background-image: url('../images/image_1.jpg');">
              </a>
              <div class="text py-4">
                <div class="meta mb-3">
                  <div><a href="#">August 12, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="100">
              <a href="blog-single.jsp" class="block-20" style="background-image: url('../images/image_2.jpg');">
              </a>
              <div class="text py-4">
                <div class="meta mb-3">
                  <div><a href="#">August 12, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              <a href="blog-single.jsp" class="block-20" style="background-image: url('../images/image_3.jpg');">
              </a>
              <div class="text py-4">
                <div class="meta mb-3">
                  <div><a href="#">August 12, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
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
  
  <!-- Vendor JS Files -->
  <script src="../css/assets/vendor/aos/aos.js"></script>
  <script src="../css/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../css/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../css/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../css/assets/vendor/php-email-form/validate.js"></script>
  <script src="../css/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="../css/assets/js/main.js"></script>
  
    
  </body>
</html>