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
	.mp_check_go{
		display:block;
		width:150px;
	    line-height:50px;
	    text-align: center;
	    background:#111;
	    color:#fff !important;
	}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	%>

	<!-- �޴�(�ڰ�����, ����, ����������) -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<!-- �ΰ� hidi�� �ٲٱ� -->
			<a class="navbar-brand" href="main.jsp"><span>HI-DI</span></a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> ȸ������ <span class="oi oi-menu"></span>
				�α���
			</button>
			<!-- ��� �޴� -->
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a href="SelectAllService"
						class="nav-link"><span>�ڰ�����</span></a></li>
					<li class="nav-item"><a href="disease.jsp" class="nav-link"><span>�����˻�</span></a></li>
					<li class="nav-item"><a href="foodall.jsp" class="nav-link"><span>��ǰ�˻�</span></a></li>
					<li class="nav-item"><a href="poll.jsp" class="nav-link"><span>����</span></a></li>
					<li class="nav-item"><a href="statistics.jsp" class="nav-link"><span>�������</span></a></li>
					<li class="nav-item"><a href="mypage.jsp" class="nav-link"><span>����������</span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ��� -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-0 bread">����������</h1>
				</div>
			</div>
		</div>
	</section>

	<div id="mypage_body">
		<div id="mypage1" class="open mypageMain">
			<div class="mp_word">
				<h3>����������</h3>
			</div>
			<div class="mp_body">
				<div class="mp_b_menu">
					<section>
						<a href="#" class="mp1_click"><p>������������</p></a>
					</section>
				</div>
				<div class="mp_b_content">
					<h5>������������</h5>
					<ul>
						<form action="UpdateService" method="post">
							<li><input name="name" type="text"  placeholder="�̸��� �Է��ϼ���"></li>
							<li><%=vo.getMb_id() %></li>
							<li><input name="pw" type="password"  placeholder="PW�� �Է��ϼ���"></li>
							<li><input name="email" type="text"  placeholder="�̸����� �Է��ϼ���"></li>
							<li id="m">
								��<input type="radio" name="gender" value="m">
            					��<input type="radio" name="gender" value="w">
            				</li>
							<li><input name="tel" type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
							<li><input name="birthdate" type="date"  placeholder="������ �Է��ϼ���"></li>
							<li><input name="address" type="text"  placeholder="���ּҸ� �Է��ϼ���"></li>
							<li><input type="submit" value="JoinUs" class="mp_check_go"></li>
						</form>
					</ul>
				</div>
			</div>
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
	<script src="js/js_main.js"></script>
	<script src="js/script.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</body>
</html>	