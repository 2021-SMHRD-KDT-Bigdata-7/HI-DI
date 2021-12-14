<%@page import="Model.DiseaseVO"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.DAO"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.ChecklistVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Clyde - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<style>

	.con_search{
		position:relative;
		left:50%;
		transform:translate(-50%,0);
	    width: 300px;
	}
	
	.con_search .row{
		margin:0 !important;
	}
	
	.form-control{
		height: 400px;
		width: 400px;
	}
	

</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


	
	<%
	//메소드 사용하기 위해 dao객체 생성
	DAO dao = new DAO();
	
	//질병 전체 데이터에서 질병명 중복없이 출력
	ArrayList<DiseaseVO> diseaselist = (ArrayList<DiseaseVO>) request.getAttribute("diseaselist"); 
		
		
	//질병 명 중복없이 출력
	ArrayList<String> name = new ArrayList<String>();
	ArrayList<String> disname = new ArrayList<String>();
		if(diseaselist != null){
			for(int i=0; i<diseaselist.size(); i++){
				name.add(diseaselist.get(i).getDis_code());
			}
		}
		HashSet<String> name2 = new HashSet<String>(name);
		disname = new ArrayList<String>(name2);
	%>
	
	
	<!-- 메뉴(자가진단, 설문, 마이페이지) -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<!-- 로고 hidi로 바꾸기 -->
			<a class="navbar-brand" href="index.html"><span>HI-DI</span></a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> 회원가입 <span class="oi oi-menu"></span>
				로그인
			</button>
			<!-- 상단 메뉴 -->
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a href="index.html#home-section"
						class="nav-link"><span>자가진단</span></a></li>
					<li class="nav-item"><a href="index.html#about-section"
						class="nav-link"><span>질병검색</span></a></li>
					<li class="nav-item"><a href="index.html#skills-section"
						class="nav-link"><span>식품검색</span></a></li>
					<li class="nav-item"><a href="index.html#services-section"
						class="nav-link"><span>설문</span></a></li>
					<li class="nav-item"><a href="index.html#projects-section"
						class="nav-link"><span>질병통계</span></a></li>
					<li class="nav-item"><a href="index.html#blog-section"
						class="nav-link"><span>마이페이지</span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 배너 -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">

					<h1 class="mb-0 bread">
						원하는 모든 질병정보를 <br> 알아보자
					</h1>
				</div>
			</div>
		</div>
	</section>
	
	<br><br><br><br><br><br><br>
	<!-- 검색기능 --> 	
	<div class="con_search">
		<div class="row">
			<form id = "frm" action="diseaseSearch">
				<table class="pull-right">
					<tr>
																											
						<td>
							<input type="text" class="form-control"
							placeholder="궁금하신 '질병'을 이곳에 입력하세요" name="searchText" maxlength="100"></td>
						<td>
							<input type="image" class="btn" src= "./images/search.jpg" width="50px" height="50px">
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>	


	
	
	


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>
	
	
	<br><br><br><br><br><br><br><br><br><br><br>
	
	
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Lets talk about</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<p>
							<a href="#" class="btn btn-primary">Learn more</a>
						</p>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Links</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Home</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Services</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Projects</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Services</h2>
						<ul class="list-unstyled">
							<li><a href="main.jsp"><span class="fa fa-chevron-right mr-2"></span>Home
									</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>self-diagnosis
									</a></li>
							<li><a href="disease.jsp"><span class="fa fa-chevron-right mr-2"></span>disease-search
									</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>food-search
									</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>survey
									</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span
										class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
						<ul class="ftco-footer-social list-unstyled mt-2">
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>

	<script src="js/js_main.js"></script>
	<script src="js/script.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">


	</script>
	
</body>
</html>