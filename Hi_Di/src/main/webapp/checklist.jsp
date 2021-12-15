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
<!--
서울대 병원 병명 박스 스타일 --> /* 서울대 병원 박스 생성 */ 
#div1 {
	width: 900px;
	height: 530px;
	border: 1px solid;
	background-image: url("C:/Users/smhrd/Desktop/HTML/CSS/이미징.jpg");
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	padding: 50px 0;
}
/* div에서 ul태그로 상속 */
#div1>#ul1 {
	list-style: none;
}

#div1>#ul2 {
	list-style: none;
}

#div1>#ul3 {
	list-style: none;
}

#div1>#ul4 {
	list-style: none;
}

#div1>#ul5 {
	list-style: none;
}

#div1>#ul6 {
	list-style: none;
}

#div1>#ul7 {
	list-style: none;
}

#div1>#ul8 {
	list-style: none;
}

#div1>#ul9 {
	list-style: none;
}

#div1>#ul10 {
	list-style: none;
}

#div1>#ul11 {
	list-style: none;
}

#div1>#ul12 {
	list-style: none;
}

#div1>#ul13 {
	list-style: none;
}

#strong1 {
	color: blue;
	font-size: 20px;
	margin-left: 36px;
}

#ul1>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul2>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul3>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul4>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul5>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul6>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul7>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul8>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul9>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul10>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul11>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul12>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

#ul13>li {
	list-style-type: none;
	float: left;
	margin-left: 30px;
	width: 162px;
	list-style-type: disc;
}

a {
	color: black;
}

ul.ml-auto>li {
	
}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- 체크리스트 불러오기 -->
	<%
   //메소드 사용하기 위해 dao객체 생성
   DAO dao = new DAO();

   //연령을 받아오기 위한 객체생성
   MemberVO vo = (MemberVO)session.getAttribute("vo");
   
   LocalDate now = LocalDate.now();   // 현재 날짜
   int year = now.getYear();   // 연도만 가져옴
   
   int mb_age = Integer.parseInt(vo.getMb_birthdate().substring(0,4));   // 사용자의 출생년도
   String check_age = Integer.toString((year - mb_age)/10)+"0대";   //연령대 생성
   ArrayList<ChecklistVO> mb_checklist = dao.SelectCheckAge(check_age);   //연령대에 맞는 체크리스트 생성
   
   //연령별 랜덤으로 체크리스트 출력을 위해 랜덤 수 생성
   Random rd = new Random();
   int num = rd.nextInt(mb_checklist.size()+1);

   int check_seq = mb_checklist.get(num).getCheck_seq();	//랜덤 시퀀스
   String check_name = mb_checklist.get(num).getCheck_name();   //랜덤 질병명
   int check_std = mb_checklist.get(num).getCheck_std();   //랜덤 체크기준
   String dis_code = mb_checklist.get(num).getDis_code();   //랜덤 질병 코드
   String[] mb_arr = mb_checklist.get(num).getCheck_item().split("/");   //랜덤 체크리스트

   
   
   //질병 전체 데이터에서 질병명 중복없이 출력
   ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");
   
   //질병 명, 질병 코드 중복없이 출력
   ArrayList<String> name = new ArrayList<String>();
      ArrayList<String> disname = new ArrayList<String>();
      if(checklist != null){
         for(int i=0; i<checklist.size(); i++){
            name.add(checklist.get(i).getCheck_name());
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

					<h1 class="mb-0 bread">
						HI-DI로 자신의 건강정보를 <br> 체크해보자
					</h1>
				</div>
			</div>
		</div>
	</section>

	<div id="checklist_body">
		<div id="checklist1" class="open checklistMain">
			<div class="cl_word">
				<h3>데일리체크</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p>데일리체크</p></a>
					</section>
					<section>
						<a href="#" class="cl2_click"><p>자가진단</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div>

						<!-- 자가진단 서울대병원 -->
						<!-- div 아이디, strong 아이디, ul 아이디 값 주고 value값 작성함 -->
						<hr>
						<div id="div1">
							<strong id="strong1"> 일반적인 증상 </strong> <br> <br>
							<ul id="ul1">
								<li id="l1">불편감</li>
								<li>얼굴 통증</li>
								<li>인후통(목의통증)</li>
								<li>변비</li>
							</ul>
							<br>
							<ul id="ul2">
								<li>피로감</li>
								<li>언어 장애</li>
								<li>목쉼과 목소리 소실</li>
								<li>흉통</li>
							</ul>
							<br>
							<ul id="ul3">
								<li>체중감소 </a></li>
								<li>건망증과 혼돈 </a></li>
								<li><a
									href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> 기침
								</a></li>
								<li><a
									href="http://www.snuh.org/health/SelfDgs/chart/Ch47.do"> 가슴
										두근거림 </a></li>
							</ul>
							<br>
							<ul id="ul4">
								<li>체중증가</li>
								<li>우울증</li>
								<li>가쁜 호흡</li>
								<li>배뇨 조절 곤란</li>
							</ul>
							<br>
							<ul id="ul5">
								<li>수면 장애</li>
								<li>불안감</li>
								<li>천명음</li>
								<li>빈뇨</li>
							</ul>
							<br>
							<ul id="ul6">
								<li>열</li>
								<li>가려움증</li>
								<li>삼키기 장애</li>
								<li>배뇨통</li>
							</ul>
							<br>
							<ul id="ul7">
								<li>과도한 땀 흘림</li>
								<li>전반적인 피부문제</li>
								<li>구토</li>
								<li>요통</li>
							</ul>
							<br>
							<ul id="ul8">
								<li>종괴</li>
								<li>열이 있는 발진</li>
								<li>재발성 구토</li>
								<li>목의 통증 또는 경직</li>
							</ul>
							<br>
							<ul id="ul9">
								<li>실신감과 기절</li>
								<li>두발과 두피의 문제</li>
								<li>복통</li>
								<li>팔이나 손의 통증</li>
							</ul>
							<br>
							<ul id="ul10">
								<li>두통</li>
								<li>눈의 통증이나 자극</li>
								<li>재발성 복통</li>
								<li>다리의 통증</li>
							</ul>
							<br>
							<ul id="ul11">
								<li>어지럼증</li>
								<li>시력 장애 또는 소실</li>
								<li>복부 팽만</li>
								<li>관절통</li>
							</ul>
							<br>
							<ul id="ul12">
								<li>감각이 없고 저린 증상</li>
								<li>청력 장애 또는 소실</li>
								<li>항문과 직장 문제</li>
								<li>발목 종창</li>
							</ul>
							<br>
							<ul id="ul13">
								<li>경련과 떨림</li>
								<li>귀의 통증</li>
								<li>설사</li>
								<li>없음</li>
							</ul>
						</div>
						<br><br><br><br>
						
						<!-- 체크리스트 -->
						<div id="div2">
							<strong id="strong2"> 체크리스트 </strong> <br> <br>
							<table>
								<tr>
									<th><%= check_name %></th>
								</tr>
								<tr>
									<td>질문</td>
									<td>예</td>
									<td>아니오</td>
								</tr>
								<%for(int j=0; j<mb_arr.length; j++){ %>
								<tr>
									<td><%= mb_arr[j]%></td>
									<td><input type="radio" name="<%= "no"+j %>" value="1">
									</td>
									<td><input type="radio" name="<%= "no"+j %>" value="0">
									</td>
	
								</tr>
								<%} %>
							</table>
							<button type="button" id="submit">결과보기</button>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div id="checklist2" class="checklistMain">
			<div class="cl_word">
				<h3>자가진단</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p>데일리체크</p></a>
					</section>
					<section>
						<a href="#" class="cl2_click"><p>자가진단</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<%for(int i=0; i<disname.size(); i++){ %>
					<a href="checkAll.jsp?name=<%=disname.get(i) %>"><%=disname.get(i) %>
						자가진단 </a> <br> <br>
					<%} %>
				</div>
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
	<script type="text/javascript">      
      let radioChecked = function(){
         let cnt = 0;
         
         let radios = $('input[type="radio"]');
         
         for(let i = 0; i < radios.length; i++){
            if($(radios[i]).prop('checked')){
               cnt++;
            }
         }
         console.log('체크된 라디오 버튼 : ' + cnt);
         return cnt;      
      }
   
   
      let num = 0;
      $('#submit').on('click', function(){
         
         // 라디오 태그 전부 가져오기
         let radios = $('input[type="radio"]');
         if(radioChecked() >= <%=mb_arr.length %>){
            
            for(let i = 0; i < radios.length; i++){
               
               if($(radios[i]).prop('checked')){
                  console.log($(radios[i]).val());
                  num += Number($(radios[i]).val());
               }
               
            }
            
            if(num >= <%=check_std%>){
               console.log("병원방문")
            }
            
          	//체크리스트 기준을 넘어 섰을 때 다른페이지로 이동
			if(num >= <%= check_std %>){
				// ajax 이용해서 저장해둔 num 값을 사용해줄 servlet으로 보내줌
				$.ajax({
					type: "post", // get / post 
					url:"checkResult.jsp",
					success : function(res){
						// res : Servlet에서 돌려준 값
						// 이 안에 처리할 로직
						// page이동이 일어나는 경우
						// window객체 사용 : window객체 --> 현채 창의 모든정보를 가짐
						// window.location : 현재 페이지 주소
						// window.location = 'test.jsp' 이런식으로 이동시킬 수 있음
						window.location = 'checkResult.jsp?name=<%= check_name %>&seq=<%= check_seq %>&result=y';
					},
					error : function() {
						alert('전송 실패');
					}					
				})
			}else{
				// ajax 이용해서 저장해둔 num 값을 사용해줄 servlet으로 보내줌
				$.ajax({
					type: "post", // get / post 
					url:"checkResult.jsp",
					success : function(res){
						// res : Servlet에서 돌려준 값
						// 이 안에 처리할 로직
						// page이동이 일어나는 경우
						// window객체 사용 : window객체 --> 현채 창의 모든정보를 가짐
						// window.location : 현재 페이지 주소
						// window.location = 'test.jsp' 이런식으로 이동시킬 수 있음
						window.location = 'checkResult.jsp?name=<%= check_name %>&seq=<%= check_seq %>&result=n';
					},
					error : function() {
						alert('전송 실패');
					}					
				})
			}
		}else{
			alert('모든 문항을 체크하세요.');
		}
		console.log(num);
			num = 0;
  	});
      
      
      //데일리체크 페이지
	</script>


</body>
</html>