<%@page import="Model.DAO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hi-Di</title>
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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/slidecss.css">

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- MemberVO, DAO ��ü����(������) -->
	<%
	//mebervo��ü ����
	MemberVO vo = (MemberVO) session.getAttribute("vo");

	//DAO��ü ����
	DAO dao = new DAO();
	%>


	<ul id="login">
		<%
		if (vo == null) {
		%>
		<li><a href="join.jsp">ȸ������</a></li>
		<li><a href="login.jsp">�α���</a></li>
		<%
		} else {
		%>
		<li><a href="LogoutService">�α׾ƿ�</a></li>
		<li><a href="mypage.jsp">����������</a></li>
		<%
		}
		%>
	</ul>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="main.jsp"><span>HI-DI</span></a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<%
					if (vo == null) {
					%>
						<li class="nav-item go-login"><a href="login.jsp" class="nav-link"><span>�ڰ�����</span></a></li>
					<%
					} else {
					%>
						<li class="nav-item"><a href="SelectAllService" class="nav-link"><span>�ڰ�����</span></a></li>
					<%
					}
					%>
					
					<li class="nav-item"><a href="disease.jsp" class="nav-link"><span>�����˻�</span></a></li>
					<li class="nav-item"><a href="foodall.jsp" class="nav-link"><span>��ǰ�˻�</span></a></li>
					
					<%
					if (vo == null) {
					%>
						<li class="nav-item go-login"><a href="login.jsp" class="nav-link"><span>����</span></a></li>
					<%
					} else {
					%>
						<li class="nav-item"><a href="poll.jsp" class="nav-link"><span>����</span></a></li>
					<%
					}
					%>
					
					<%
					if (vo == null) {
					%>
						<li class="nav-item go-login"><a href="login.jsp" class="nav-link"><span>�������</span></a></li>
					<%
					} else {
					%>
						<li class="nav-item"><a href="statistics.jsp" class="nav-link"><span>�������</span></a></li>
					<%
					}
					%>
					
					<%
					if (vo == null) {
					%>
						<li class="nav-item go-login"><a href="login.jsp" class="nav-link"><span>����������</span></a></li>
					<%
					} else {
					%>
						<li class="nav-item"><a href="mypage.jsp" class="nav-link"><span>����������</span></a></li>
					<%
					}
					%>
					
				</ul>
			</div>
		</div>
	</nav>

	<div id="home-section">
		<main>
			<section class="slides">

				<section class="slides-nav">
					<nav class="slides-nav__nav">
						<button class="slides-nav__prev js-prev">Prev</button>
						<button class="slides-nav__next js-next">Next</button>
					</nav>
				</section>

				<section class="slide is-active">
					<div class="slide__content">
						<figure class="slide__figure">
							<div class="slide__img slide__img1"
								style="background-image: url(https://source.unsplash.com/nfTA8pdaq9A/2000x1100)"></div>
						</figure>
						<header class="slide__header">
							<h2 class="slide__title">
								<span class="title-line"><span>hidi�� �ڽ��� �ǰ������� </span></span> <span
									class="title-line"><span>üũ�غ���</span></span>
							</h2>
							<h2 class="slide__title_info slide__title">
								<span class="title-line"> <span>hidi�� �ڰ������� ��Ȯ�ϰ�
										������ ����� </span>
								</span> <span class="title-line"> <span>������ ������ �� �ֽ��ϴ�.
										HiDi���� ���� </span>
								</span> <span class="title-line"> <span>�� ���� ������ ������!</span>
								</span>
							</h2>
							<a href="SelectAllService" class="slide-go">�ٷΰ���</a>
						</header>
					</div>
				</section>

				<section class="slide">
					<div class="slide__content">
						<figure class="slide__figure">
							<div class="slide__img slide__img2"
								style="background: url(./images/slide2.jpg) no-repeat center/cover;"></div>
						</figure>
						<header class="slide__header">
							<h2 class="slide__title">
								<span class="title-line"><span>����� �ǰ��ϰ� �ູ�� </span></span> <span
									class="title-line"><span>���� ���� �ǰ� ����</span></span>
							</h2>
							<h2 class="slide__title_info slide__title">
								<span class="title-line"> <span>����� ã�� ��� ������ ����
										������,</span>
								</span> <span class="title-line"> <span>���⿡�� ���� �� �ֽ��ϴ�.
										���ϴ�</span>
								</span> <span class="title-line"> <span>������ �Ѵ��� ã�ƺ�����!</span>
								</span>
							</h2>
							<div class="slide-go"><a href="disease.jsp">�ٷΰ���</a></div>
						</header>
					</div>
				</section>

				<section class="slide">
					<div class="slide__content">
						<figure class="slide__figure">
							<div class="slide__img slide__img3"
								style="background: url(./images/slide3.jpeg) no-repeat center/cover; transform: scaleX(-1);"></div>
						</figure>
						<header class="slide__header">
							<h2 class="slide__title">
								<span class="title-line"><span>�ڱ������ ���� ��ǰ</span></span> <span
									class="title-line"><span>������ �Ѱ���-</span></span>
							</h2>
							<h2 class="slide__title_info slide__title">
								<span class="title-line"> <span>�ǰ��� �Ĵܿ� �ູ�� �ϻ���
										���ϴ�.</span>
								</span> <span class="title-line"> <span>���簡 �ְ� �ǰ��� �Ĵ���
										���Ͻø�</span>
								</span> <span class="title-line"> <span>HiDi�� ���͵帮�ڽ��ϴ�.</span>
								</span>
							</h2>
							<div class="slide-go"><a href="foodall.jsp">�ٷΰ���</a></div>
						</header>
					</div>
				</section>

				<section class="slide">
					<div class="slide__content">
						<figure class="slide__figure">
							<div class="slide__img slide__img4"
								style="background: url(./images/slide4.jpg) no-repeat center/cover;"></div>
						</figure>
						<header class="slide__header">
							<h2 class="slide__title">
								<span class="title-line"><span>���� �ǰ��� ���� </span></span> <span
									class="title-line"><span>�������� �÷���</span></span>
							</h2>
							<h2 class="slide__title_info slide__title">
								<span class="title-line"> <span>������ �ʿ��� �Ƿ��������
										�����̵�!</span>
								</span> <span class="title-line"> <span>�˸��� �������� ��� �����ôٸ�</span>
								</span> <span class="title-line"> <span>�̿����ֽʽÿ�.</span>
								</span>
							</h2>
							<div class="slide-go"><a href="poll.jsp">�ٷΰ���</a></div>
						</header>
					</div>
				</section>

				<section class="slide">
					<div class="slide__content">
						<figure class="slide__figure">
							<div class="slide__img slide__img5"
								style="background: url(./images/slide5.jpg) no-repeat center/cover;"></div>
						</figure>
						<header class="slide__header">
							<h2 class="slide__title">
								<span class="title-line"><span>�ڰ������� ����� ���� </span></span> <span
									class="title-line"><span>�Ѵ��� �˾ƺ���</span></span>
							</h2>
							<h2 class="slide__title_info slide__title">
								<span class="title-line"> <span>�ڰ������� ����� ���� </span>
								</span> <span class="title-line"> <span>��Ȯ�� ������ ��� �����ôٸ�</span>
								</span> <span class="title-line"> <span>�̿����ֽʽÿ�.</span>
								</span>
							</h2>
							<div class="slide-go"><a href="statistics.jsp">�ٷΰ���</a></div>
						</header>
					</div>
				</section>
			</section>
		</main>
	</div>

	<section class="ftco-counter img bg-light" id="section-counter">
		<div class="container">
			<div class="row">
				<div
					class="col-md-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 d-flex">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-suitcase"></span>
						</div>
						<div class="text">
							<strong class="number" data-number="750">0</strong> <span>Covid
								19</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 d-flex">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-loyalty"></span>
						</div>
						<div class="text">
							<strong class="number" data-number="568">0</strong> <span>Ȯ����
								��</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 d-flex">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-coffee"></span>
						</div>
						<div class="text">
							<strong class="number" data-number="478">0</strong> <span>�����
								��</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18 d-flex">
						<div class="icon d-flex justify-content-center align-items-center">
							<span class="flaticon-calendar"></span>
						</div>
						<div class="text">
							<strong class="number" data-number="780">0</strong> <span>������</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-about ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row d-flex no-gutters">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img-about img d-flex align-items-stretch">
						<div class="overlay"></div>
						<div class="img d-flex align-self-stretch align-items-center"
							style="background-image: url(images/about-1.jpg);"></div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- <section class="ftco-section" id="services-section">
		<div class="containercheck">
			<div class="justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading"></span>
					<h2 class="mb-4">�ڰ�����</h2>
					<p>hidi�� �ڽ��� �ǰ������� üũ�غ���</p>
				</div>
			</div>
			a�±�, �̹��� �޾��� ����
			<div class="rowcheck">
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check1.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">�ڷγ�19</h3>
								<p>�ڷγ�19 �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check2.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">���</h3>
								<p>��� �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check3.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">�ڱð�ξ�</h3>
								<p>�ڱð�ξ� �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>

				</div>

			</div>

			<div class="rowcheck">
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check4.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">����</h3>
								<p>���� �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>

				</div>
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check5.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">�����</h3>
								<p>����� �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>

				</div>
				<div class="col-md-6 col-lg-3">
					<form action="#">
						<div
							class="media block-6 services d-block bg-white rounded-lg shadow ftco-animate"
							style="background-image : url(./images/check6.jpg); background-size:cover;">
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-3d-design"></span>
							</div>
							<div class="media-body">
								<h3 class="heading mb-3">����</h3>
								<p>���� �ڰ������� �����غ�����!</p>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section> -->

	<section class="ftco-section testimony-section bg-primary">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div
					class="col-md-12 heading-section heading-section-white text-center ftco-animate">
					<span class="subheading"></span>
					<span class="subheading">Diagnosis</span>
					<h2 class="mb-4">�ڰ�����</h2>
					<p>hidi�� �ڽ��� �ǰ������� üũ�غ���</p>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<div class="item "
							style="background-image: url(./images/check1.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-1">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=�ڷγ�19">�ڷγ�19</a>
											<span class="position">Covid19</span>
										</div>
									</div>
									<p class="mb-4 pl-5">�ڷγ��� ���� ������ �������� �������θ� ������ �� �ֽ��ϴ�.</p>

								</div>
							</div>
						</div>
						<div class="item"
							style="background-image: url(./images/check2.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-2">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=���">���</a>
											<span class="position">lung cancer</span>
										</div>
									</div>
									<p class="mb-4 pl-5">��Ͽ� ���� ������ �������� ���󿩺θ� ������ �� �ֽ��ϴ�.</p>

								</div>
							</div>
						</div>
						<div class="item"
							style="background-image: url(./images/check3.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-3">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=�ڱð�ξ�">�ڱð�ξ�</a>
											<span class="position">cervical cancer</span>
										</div>
									</div>
									<p class="mb-4 pl-5">�ڱð�ξϿ� ���� ������ �������� ���󿩺θ� ������ �� �ֽ��ϴ�.</p>
								</div>
							</div>
						</div>
						<div class="item"
							style="background-image: url(./images/check4.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-4">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=����">����</a>
											<span class="position">stomach cancer</span>
										</div>
									</div>
									<p class="mb-4 pl-5">���Ͽ� ���� ������ �������� ���󿩺θ� ������ �� �ֽ��ϴ�.</p>
								</div>
							</div>
						</div>
						<div class="item"
							style="background-image: url(./images/check5.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-5">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=�����">�����</a>
											<span class="position">colorectal cancer</span>
										</div>
									</div>
									<p class="mb-4 pl-5">����Ͽ� ���� ������ �������� ���󿩺θ� ������ �� �ֽ��ϴ�.</p>
								</div>
							</div>
						</div>
						<div class="item"
							style="background-image: url(./images/check6.jpg); background-size: cover;">
							<div class="testimony-wrap py-4 tw-6">
								<div class="text">
									<div class="d-flex align-items-center">
										<!-- <div class="user-img" style="background-image: url()"></div> -->
										<div class="pl-3">
											<a class="name" href="checkAll.jsp?name=����">����</a>
											<span class="position">liver cancer</span>
										</div>
									</div>
									<p class="mb-4 pl-5">���Ͽ� ���� ������ �������� ���󿩺θ� ������ �� �ֽ��ϴ�.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-hireme">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-md-8 col-lg-8 d-flex align-items-center">
					<div class="w-100 py-4">
						<h2>���� ���� �˾ƺ���</h2>
						<p>�˸��� �������� ��� �����ôٸ� �̿����ּ���!</p>
						<p class="mb-0">
							<a href="disease.jsp" id="dInfo-btn" class="btn btn-white py-3 px-4">�ٷΰ���</a>
						</p>
					</div>
				</div>
				<div class="col-md-4 col-lg-4 d-flex align-items-end">
					<img src="images/doctor.png" class="img-fluid" alt="">
					<!-- <a href="#" style="background-image:url(images/doctor.png)"></a> -->
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-project" id="projects-section">
		<div class="container-fluid px-md-4">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Nutritious</span>
					<h2 class="mb-4">�ǰ� & ��ǰ</h2>
					<p>�ǰ��ϰ� �������� �Ļ縦 ���� ����</p>
				</div>
			</div>
			<div id="food_body">
				<!-- <section class="f_tab">
					<div>
						<a href="#none" class="t_on">�ǰ���ɽ�ǰ</a>
						<a href="#none">��ǰ</a>
					</div>
				</section>
				<section class="health_con f_section on">
					<div class="row">
						<h2>�ǰ���ɽ�ǰ</h2>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
							
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<div class="overlay"></div>
							
							</div>
						</div>
					</div>
				</section> -->
				<section class="food_con f_section on">
					<div class="row">
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
								<!-- <div class="overlay"></div> -->
							
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
								
							</div>
						</div>
					</div>
				</section>
			</div>


		</div>
	</section>

	<!-- <section class="ftco-section testimony-section bg-primary">
      <div class="container">
         <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section heading-section-white text-center ftco-animate">
               <span class="subheading">Testimonies</span>
               <h2 class="mb-4">What client says about?</h2>
               <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            </div>
         </div>
         <div class="row ftco-animate">
            <div class="col-md-12">
               <div class="carousel-testimony owl-carousel">
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="item">
                     <div class="testimony-wrap py-4">
                        <div class="text">
                           <span class="fa fa-quote-left"></span>
                           <p class="mb-4 pl-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                           <div class="d-flex align-items-center">
                              <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>
                              <div class="pl-3">
                                 <p class="name">Roger Scott</p>
                                 <span class="position">Marketing Manager</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section> -->


	<section class="ftco-section bg-light" id="blog-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">statistics</span>
					<h2 class="mb-4">���� ���</h2>
					<p>������� ���� ��Ȳ�� Ȯ���ϰ� �ʹٸ� HiDi��!</p>
				</div>
			</div>
		</div>
	</section>




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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script>
		// �α����϶�� �˾�â ����
		$(".go-login a").click(
			function(){
				alert("�α����� ���ּ���.");
				console.log("�ܼ�â ���");
			}
		);
	</script>

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
	<script src="js/script.js"></script>
	<script src="js/js_main.js"></script>
	<script src="js/slidejs.js"></script>
</body>
</html>