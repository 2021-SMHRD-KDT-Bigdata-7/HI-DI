<%@page import="Model.RecommendVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="Model.FoodVO"%>
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
body {
	color: #111 !important;
}

#foodtb {
	width: 90%;
	margin: 5%;
	position:relative;
}

.f_t_name {
	border-top: 2px #1303ee solid;
	background: #fafafa;
}
#foodtb{
text-align: center;
}
#foodtb tr {
	border-bottom: 1px #ddd solid;
}
#foodtb td{
	line-height:5vh;
}
#foodtb .f_t_name th{
	line-height:7vh;
}
#foodtb th,td{
	font-size: 1rem;
}
#foodtb .f_t_name th:nth-child(1) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(2) {
	width: 7%;
}

#foodtb .f_t_name th:nth-child(3) {
	width: 8%;
}

#foodtb .f_t_name th:nth-child(4) {
	width: 10%;
}

#foodtb .f_t_name th:nth-child(5) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(6) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(7) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(8) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(9) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(10) {
	width: 5%;
}

#foodtb .f_t_name th:nth-child(11) {
	width: 8%;
}

#foodtb .f_t_name th:nth-child(12) {
	width: 7%;
}

#foodtb .f_t_name th:nth-child(13) {
	width: 7%;
}

#foodtb::after{
	content:"< 1회 제공량 >";
	position:absolute;
	top:-3.5vh;
	right:0;
	color:#111;
	font-size: 0.9rem;
}

</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
<%
	DAO dao = new DAO();
	ArrayList<FoodVO> foods = dao.SelectAllfood();
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	RecommendVO rvo = (RecommendVO) session.getAttribute("rvo");
	
%>
<%
	String select = "";
		if (request.getParameter("food")!=null){
			select = request.getParameter("food");
		}
%>



	<!-- 메뉴(자가진단, 설문, 마이페이지) -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<!-- 로고 hidi로 바꾸기 -->
			<a class="navbar-brand" href="main.jsp"><span>HI-DI</span></a>
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
					<li class="nav-item"><a href="SelectAllService"
						class="nav-link"><span>자가진단</span></a></li>
					<li class="nav-item"><a href="disease.jsp" class="nav-link"><span>질병검색</span></a></li>
					<li class="nav-item"><a href="foodall.jsp" class="nav-link"><span>식품검색</span></a></li>
					<li class="nav-item"><a href="poll.jsp" class="nav-link"><span>설문</span></a></li>
					<li class="nav-item"><a href="statistics.jsp" class="nav-link"><span>질병통계</span></a></li>
					<li class="nav-item"><a href="mypage.jsp" class="nav-link"><span>마이페이지</span></a></li>
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
					<h1 class="mb-0 bread">식품검색</h1>
					<p class="breadcrumbs">자기관리를 위한 식품정보들은 모두 여기에</p>
				</div>
			</div>
		</div>
	</section>
	<!-- ===================================== 추천페이지 ========================================= -->
		<div class="container-fluid px-md-4">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Nutritious</span>
					<h2 class="mb-4">추천식품</h2>
					<p><%=vo.getMb_name() %>님의 추천 식품</p>
				</div>
			</div>
			<div id="food_body">
				<section class="food_con f_section on">
					<div class="row">
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
							
								<img src="./foodimg/<%=URLEncoder.encode("감귤.jpg", "euc-kr")%>"> 
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
							
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
							
							</div>
						</div>
						
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
</section>

	<!-- ================================ 검색창 ========================================= -->
	<form action="foodall.jsp" align="center">
		<div>
			<input name="food" type="text" placeholder="식품명을 입력하세요.">
			<button id="searchBtn" type="submit">검색</button>
		</div>
	</form>
	<!-- ============================식품데이터 불러오기======================================== -->
	
	<div id="fooddiv">
		<table id="foodtb">

			<tr class="f_t_name">
				<th id="col">번호</th>
				<th id="col">식품이름</th>
				<th id="col">조사년도</th>
				<th id="col">자료출처</th>
				<th id="col">열량(kcal)</th>
				<th id="col">탄수화물(g)</th>
				<th id="col">단백질(g)</th>
				<th id="col">지방(g)</th>
				<th id="col">당류(g)</th>
				<th id="col">나트륨(mg)</th>
				<th id="col">콜레스테롤(mg)</th>
				<th id="col">포화지방산(g)</th>
				<th id="col">트랜스지방(g)</th>
			</tr>
			<% for( FoodVO fvo : foods ){
						if (fvo.getFood_name().contains(select)){
				%>
			<tr>
				<td id="row"><%= fvo.getFood_seq() %></td>
				<td id="row"><%= fvo.getFood_name() %></td>
				<td id="row"><%= fvo.getFood_year() %></td>
				<td id="row"><%= fvo.getFood_source() %></td>
				<td id="row"><%= fvo.getFood_calory() %></td>
				<td id="row"><%= fvo.getFood_carvohydrate() %></td>
				<td id="row"><%= fvo.getFood_protein()%></td>
				<td id="row"><%= fvo.getFood_fat()%></td>
				<td id="row"><%= fvo.getFood_sugars()%></td>
				<td id="row"><%= fvo.getFood_sodium()%></td>
				<td id="row"><%= fvo.getFood_cholesterol()%></td>
				<td id="row"><%= fvo.getFood_saturated_fatty()%></td>
				<td id="row"><%= fvo.getFood_transfat()%></td>
			</tr>
			<% }} %>
		</table>
	</div>


















	<!-- ================================================================================== -->

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
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Web
									Design</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Web
									Development</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Business
									Strategy</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Data
									Analysis</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Graphic
									Design</a></li>
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

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

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
	<script src="js/js_main.js"></script>
	<script src="js/script.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
</body>
</html>