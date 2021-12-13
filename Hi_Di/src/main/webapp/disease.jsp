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
	
	
	<!-- 검색기능 --> 	
	<div class="container">
		<div class="row">
			<form id = "frm" action="diseaseSearch">
				<table class="pull-right">
					<tr>									
						<td>
							<input type="text" class="form-control"
							placeholder="질병 명 입력" name="searchText" maxlength="100"></td>
						<td>
							<input type="submit" value="검색">
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

	
	$(document).ready(function(){
		$("#submit").click(function(){
			
			if($("#id").val() == ''){
				
				return;
			}
			$("#frm").attr("action", "diseaseSearch.jsp"); // attribute setting
			$("#frm").submit();
		});
	});
	
	
	//옵션에서 값 받아오고
<%--	let code = $(".form-control").text();
	console.log(code);

	
	 	$('#submit').on('click', function(){
		<% 	ArrayList<DiseaseVO> disNameList = dao.SelectDiseaseName(null);%>
		
		<% 	ArrayList<DiseaseVO> disCodeList = dao.SelectDiseaseName(null);%>
		
	
	} --%>
	
	</script>
	
</body>
</html>