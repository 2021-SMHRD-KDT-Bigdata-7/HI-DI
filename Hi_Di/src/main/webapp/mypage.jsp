<%@page import="Model.PointVO"%>
<%@page import="Model.CalendarVO"%>
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

<link href='./FullCalendar/main.css' rel='stylesheet' />

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


<!-- 캘린더 -->
<style>
#nosibal {
	margin: 100px 200px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 23px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%
	DAO dao = new DAO();
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	ArrayList<CalendarVO> CheckCalendar = new ArrayList<CalendarVO>();
	ChecklistVO cvo = null;
	
	if(vo != null){
		CheckCalendar = dao.CheckResult(vo.getMb_id());
	}
	ArrayList<PointVO> polist = dao.SelectAllPoint(vo.getMb_id());
	%>

	<!-- 메뉴(자가진단, 설문, 마이페이지) -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container sub_container">
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
		style="background-image: url('images/bg_4.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</section>

	<div id="mypage_body">
		<div id="mypage1" class="open mypageMain">
			<div class="mp_word">
				<h3>마이페이지</h3>
			</div>
			<div class="mp_body">
				<div class="mp_b_menu">
					<section>
						<a href="#" class="mp1_click"><p>개인정보수정</p></a>
					</section>
					<section>
						<a href="#" class="mp2_click"><p>MyCalendar</p></a>
					</section>
					<section>
						<a href="#" class="mp3_click"><p>Point</p></a>
					</section>
				</div>
				<div class="mp_b_content">
					<h5>개인정보수정</h5>
					<ul>
						<li>이름  : <%=vo.getMb_name() %> </li>
						<li>ID  : <%=vo.getMb_id() %></li>
						<li>PW  : <%=vo.getMb_pw() %></li>
						<li>E-mail  : <%=vo.getMb_email() %></li>
						<li>성별  : <%=vo.getMb_gender() %></li>
						<li>전화번호  : <%=vo.getMb_phone() %></li>
						<li>생일  : <%=vo.getMb_birthdate() %></li>
						<li>주소  : <%=vo.getMb_addr() %></li>
					</ul>
					<a href="mypage_check.jsp" class="mp_check_go">수정</a>
				</div>
			</div>
		</div>
		
		<div id="mypage2" class="mypageMain">
			<div class="mp_word">
				<h3>MyCalendar</h3>
			</div>
			<div class="mp_body">
				<div class="mp_b_menu">
					<section>
						<a href="#" class="mp1_click"><p>개인정보수정</p></a>
					</section>
					<section>
						<a href="#" class="mp2_click"><p>MyCalendar</p></a>
					</section>
					<section>
						<a href="#" class="mp3_click"><p>Point</p></a>
					</section>
				</div>
				<div id = "nosibal">
				<h5>MyCalendar</h5>
					<div id='calendar-container'>
						<div id='calendar' class="mp_b_content"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="mypage3" class="mypageMain">
			<div class="mp_word">
				<h3>마이페이지</h3>
			</div>
			<div class="mp_body">
				<div class="mp_b_menu">
					<section>
						<a href="#" class="mp1_click"><p>개인정보수정</p></a>
					</section>
					<section>
						<a href="#" class="mp2_click"><p>MyCalendar</p></a>
					</section>
					<section>
						<a href="#" class="mp3_click"><p>Point</p></a>
					</section>
				</div>
				<div class="mp_b_content">
					<h5>Point</h5>
					
					<table>
						<%for(int i=0; i<polist.size(); i++){ %>
							<tr>
								<td><%=polist.get(i).getPoint_memo() %></td>
								<td><%=polist.get(i).getPoint_kind() %></td>
								<td><%=polist.get(i).getPoint() %></td>
								<td><%=polist.get(i).getReg_date() %></td>
							</tr>
						<%} %>
					</table>
					
					<a href="mypage_check.jsp" class="mp_check_go">수정</a>
				</div>
			</div>
		</div>
	</div>

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
	<script src='./FullCalendar/main.js'></script>
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
	<!-- 캘린더 -->
	<script>
    	var calendarEl = document.getElementById('calendar');

    	var calendar = new FullCalendar.Calendar(calendarEl, {
    		expendRows: true,
    		height: '700px',
    		headerToolbar: {
        	left: 'prevYear,prev,next,nextYear today',
        	center: 'title',
        	right: 'dayGridMonth,dayGridWeek,dayGridDay'
      	},
      	navLinks: true, // can click day/week names to navigate views
      	editable: true,
      	dayMaxEvents: true, // allow "more" link when too many events
      	events: [
    	  // 이벤트 들어갈 자리 ex) 자가진단 질병명 같은거

      	]
    	});
	
    	calendar.render();
	</script>
	
<%if(CheckCalendar != null){ %>
	<script type="text/javascript">
		
		<%for(int i=0; i<CheckCalendar.size(); i++){%>
			<%if(CheckCalendar.get(i).getUser_check_result().equals("y")){%>
				<%int seq=CheckCalendar.get(i).getCheck_seq();%>
				<%cvo = dao.SelectSeqCheck(seq); %>
				<%if (cvo != null){%>
					calendar.addEvent({
						title: "<%=cvo.getCheck_name()%>",
						start: "<%=CheckCalendar.get(i).getReg_date().substring(0,10)%>",
						allDay: true
					});
				<%}%>
			<%}%>
		<%}%>
	</script>
<%} %>
</body>
</html>	