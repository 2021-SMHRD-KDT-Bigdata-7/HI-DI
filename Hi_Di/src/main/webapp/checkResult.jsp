<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="Model.RecommendVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Random"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.RawVO"%>
<%@page import="Model.HospitalVO"%>
<%@page import="Model.DiseaseVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<script src="jquery-3.6.0.min.js"></script>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
.cl_b_content{
	padding:8vh 0 0 5vw;
	margin:0;
}
.cl_con1 .cl_result{
	font-size : 2.5rem;
	font-weight: 600;
	margin-bottom:20px;
}
.result_word{
	font-size: 1.2rem;	
}
.result_nutri{
	width:100%;
	line-height:18vh;
	background: linear-gradient( rgba(0, 0, 0, 0), rgba(0, 0, 0, 0) ), url('./images/result_nutri.jpg');
	background-size:cover;
	background-position: 300px -20px;
	display: block;
	margin-top:6vh;
	position: relative;
	background-attachment: fixed;
	transform: scaleX(-1);
	padding-right:6vw;
}

.result_nutri p{
	font-size: 1.7rem;
	color:#6E8B91;
	font-weight: 600;
	transform: scaleX(-1);
}
.result_nutri:hover{
	opacity:0.7;
}
#map{
	width:100%;
	height:40vh;
}
.cl_con2_word{
	line-height: 10vh;
    font-size: 1.8rem;
    font-weight: 600;
    margin-top:7vh;
}
#popup{
	display:none;
	position:fixed;
	top:0;
	left:0;	
	background:rgba(0,0,0,.7);
	width:100%;
	height:100%;
	z-index: 9999999999;
}
/* #popup.show{
	display:block;
} */
.popupbody{
	width: 50%;
	/* height: 60%; */
	padding:10vh 5vw 5vh 5vw;
	background:#fff;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	border-radius: 5px;
	overflow-y:scroll;
}
#raw{
	width:100%;
	border-top: 3px #748CAA solid;
}
#raw tr{
	line-height:3vh;
	border-bottom: 1px #ddd solid;
}
#raw tr td{
	padding:10px 0 ;
}
#raw tr td:nth-child(1) {
	text-align: center;
	background:#fafafa;
	padding:10px 15px;
	width:30%;
}
#raw tr td:nth-child(2){
	padding:10px 15px;
}
.outpopup{
	line-height: 15vh;
	text-align: center;
}
#hide{
	width:10vw;
	line-height:5vh;
	background: #111;
	border:none;
	color:#fff;
}
</style>
</head>
<body>
	<%
	DAO dao = new DAO();
	Random rd = new Random();

	//세션에서 아이디 받아오기
	HttpSession session2 = request.getSession();
	MemberVO vo = (MemberVO) session2.getAttribute("vo");
	String[] reco_food = null;
	RecommendVO revo = null;


	//체크 결과 db에 저장
	/* dao.InsertCheck(seq, result, vo.getMb_id()); */

	//이름값 받아오기
	
	String name = URLDecoder.decode(request.getParameter("name"), "euc-kr");
	System.out.println(name);
	
	ArrayList<HospitalVO> hoslist = null;
	ArrayList<RawVO> rawlist = dao.RawSelect(); //영양성분 정보 출력
	ArrayList<String> raw_name = new ArrayList< String>(); //영양성분 이름
	ArrayList<String> raw_func = new ArrayList<String>(); //영양성분 기능

	//받아온 질병이름으로 질병 전체 정보 받아오기
	DiseaseVO dvo = dao.SelectDiseaseName(name);

	if (dvo != null) {
		hoslist = dao.HospitalAll(dvo.getDis_dpt());

		String[] tags = dvo.getDis_tag().replace(" ", "").split(","); //태그가 여러개일 때 한개씩 배열에 저장

		for (int i = 0; i < tags.length; i++) { //질병에 대한 태그 검색하기 위한 tag

			for (int j = 0; j < rawlist.size(); j++) { //전체 영양성분에서 질병에 대한 tag 찾기

		String taglist = rawlist.get(j).getDis_tag();

		if (taglist.contains(tags[i]) == true) {
			raw_name.add(rawlist.get(j).getRaw_name());
			raw_func.add(rawlist.get(j).getRaw_func());
		}
			}

		}

	} else {
		out.print("지도 로딩 실패");
	}
	
	//중복없이 난수 4개 생성
	int count = 4; // 난수 생성 갯수
	int num[] = new int[count];

	if(vo!=null){
		revo = dao.SelectDisRecommend(name);
		if(revo !=null){
			reco_food = revo.getReco_food().split(",");			
			//난수 생성
			for(int i=0; i<count; i++){
				num[i] = rd.nextInt(reco_food.length); // 추천식품 개수만큼 랜덤으로 난수 생성 
				for(int j=0; j<i; j++){
					if(num[i] == num[j]){
						i--;
					}
				}
			} 
		}
		
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
					<h1 class="mb-0 bread">진단 결과</h1>
					<p class="breadcrumbs">진단 결과를 확인 하세용</p>
				</div>
			</div>
		</div>
	</section>

	<div id="checklist_body">
		<div id="checklist1" class="open checklistMain">
			<div class="cl_word">
				<h3>자가진단결과</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#none" class="cl1_click"><p>자가진단결과</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div class="cl_con1">
						<!-- 자가진단 결과 출력 -->
						<div class="cl_result"> <%=name%> <p>(이)가 의심 됩니다.</p>
						</div>

						<%
						if (dvo != null) {
						%>
							<div class="result_word"> 
								<%=name%>는 <%=dvo.getDis_content()%> 이고 
								<%=dvo.getDis_symptom()%> 과 같은 증상이 있을 수 있습니다.
							</div>
							<div class="result_word"> 
								<strong><%=dvo.getDis_dpt()%></strong> 에 방문 하는 것을 추천 합니다.
							</div>
							<%
							if (rawlist != null) {
							%>
								<a href="#none" class="result_nutri"> <p>도움이 되는 영양 성분을 보려면 ></p> </a>
								<div id="popup">
									<div class="popupbody">
										<table id="raw">
											<%
											for (int i = 0; i < raw_name.size(); i++) {
											%>
											<tr>
												<td><%=raw_name.get(i)%></td>
												<td><%=raw_func.get(i)%></td>
											</tr>
											<%
											}
											%>
											
										</table>
										<div class="outpopup">
											<td colspan="2"><button type="button" id="hide">나가기</button></td>
										</div>
									</div>
								</div>
							<%
							}
							%>
							
						<%
						} else {
						%>
							<div>병원에 방문 하는 것을 추천 합니다.</div>
						<%
						}
						%>
					</div>
<!-- 식품추천 -->
<!-- ===================================== 추천페이지 ========================================= -->
	<%if(reco_food != null){ %>
		<div class="container-fluid px-md-4">
		
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Nutritious</span>
					<h2 class="mb-4">추천식품</h2>
					<p><%=name %>에 좋은 식품</p>
				</div>
			</div>
			<div id="food_body">
				<section class="food_con f_section on">
					<div class="row">
						<div class="col-md-3">
						<%String food = null; %>
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
								<!-- 랜덤으로 식품 추천 -->
								<%food = reco_food[num[0]]+".jpg"; %>
								<img src="./foodimg/<%=URLEncoder.encode(food, "euc-kr")%>"> 								
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
								<!-- 랜덤으로 식품 추천 -->
								<%food = reco_food[num[1]]+".jpg"; %>
								<img src="./foodimg/<%=URLEncoder.encode(food, "euc-kr")%>"> 
							</div>
						</div>
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
								<!-- 랜덤으로 식품 추천 -->
								<%food = reco_food[num[2]]+".jpg"; %>
								<img src="./foodimg/<%=URLEncoder.encode(food, "euc-kr")%>">
							</div>
						</div>
						
						<div class="col-md-3">
							<div
								class="project img shadow ftco-animate d-flex justify-content-center align-items-center">
								<!-- <div class="overlay"></div> -->
								<!-- 랜덤으로 식품 추천 -->
								<%food = reco_food[num[3]]+".jpg"; %>
								<img src="./foodimg/<%=URLEncoder.encode(food, "euc-kr")%>">
							</div>
						</div>
				</div>
				</section>
			</div>
		</div>
	<%} %>
<!--  -->		
					<div class="cl_con2">
						<div class="cl_con2_word">병원 위치</div>
						<!-- 지도 띄우기 -->
						<%
						if (hoslist != null) {
						%>
						<div id="map" ></div>
					</div>
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

	<!-- 영양성분 정보 숨기기 -->
	<script type="text/javascript">
		document.getElementById("show").addEventListener("click",function(){
			document.getElementById("raw").style.display="";
		})
		
		document.getElementById("hide").addEventListener("click",function(){
			document.getElementById("raw").style.display="none";
		})
	</script>
	<!-- 영양성분 정보 숨기기 끝-->
	
	<!-- 지도 스크립트 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b3a32b355a4dc98f4a07c93f17a9fb"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b3a32b355a4dc98f4a07c93f17a9fb"></script>


	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    	mapOption = { 
	        	center: new kakao.maps.LatLng(35.11154588685366, 126.87755807671306), // 지도의 중심좌표
	        	level: 5 // 지도의 확대 레벨
	    	};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
		// 마커를 표시할 위치와 title , cotnents 객체 배열입니다 
		var lat = null;
		var lon = null;
		var positions = [];
		var title = [];
		var content = [];
		var overlay = [];
		var marker = [];
		var markerImage = [];   //마커 이미지+크기 배열
		var imageSize = new kakao.maps.Size(30, 30);   //마커크기
		var dpt = ["안과", "종합", "내과", "마치통증의학과", "산부인과", "성형외과", "소아과", "소아청소년과", "비뇨기과", "비뇨의학과", "신경과", "신경외과", "외과",
		   "영상의학과", "정신과", "정형외과", "치과", "피부과", "한방과"];
	
		//마커 이미지의 이미지 주소입니다
		for(let i=1; i<20; i++){
		   var imageSrc = "./mapimages/hospital"+i+".png";
		   markerImage[i-1] = new kakao.maps.MarkerImage(imageSrc, imageSize);
		}
		
		// positions에 push메서드로 객체 넣어주기
		<%for (int j = 0; j < hoslist.size(); j++) {%>

			positions.push({
				title : '<%=hoslist.get(j).getHos_name()%>',
				latlng : new kakao.maps.LatLng( <%=hoslist.get(j).getHos_longitude()%>, <%=hoslist.get(j).getHos_latitude()%>)
			});

			//커스텀 오버레이에 표시할 컨텐츠
			content[<%=j%>]='<div class="wrap">' + 
		                '    <div class="info">' + 
		                '        <div class="title">' + 
		                '            <%=hoslist.get(j).getHos_name()%>' + 
		                '            <div class="close" title="닫기"></div>' + 
		                '        </div>' + 
		                '        <div class="body">' +
		                '            <div class="desc">' + 
		                '                <div class="ellipsis"><%=hoslist.get(j).getHos_addr()%></div>' + 
		                '                <div class="jibun ellipsis"><%=hoslist.get(j).getHos_phone()%></div>' + 
		                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
		                '            </div>' + 
		                '        </div>' + 
		                '    </div>' +    
		                '</div>';
		         
			// 마커를 생성합니다
			for(let i=0; i<19; i++){
				if("<%=hoslist.get(j).getHos_dpt()%>" == dpt[i]) {
					marker[<%=j%>] = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[<%=j%>].latlng, 
						// 마커를 표시할 위치
						title : positions[<%=j%>].title, 
						// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage[i]
						// image : markerImage // 마커 이미지 
					});
				}				
			}
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			overlay[<%=j%>] = new kakao.maps.CustomOverlay({
				content : content[<%=j%>],
				map : map,
				position : marker[<%=j%>].getPosition()
			});
			overlay[<%=j%>].setMap(null);

			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker[<%=j%>], 'mouseover', function() {
				overlay[<%=j%>].setMap(map);
			});
			kakao.maps.event.addListener(marker[<%=j%>], 'mouseout', function() {
				overlay[<%=j%>].setMap(null);
			});
		<%}%>
		     //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		    if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	</script>
<%}%>
	<!-- 지도 끝 -->

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