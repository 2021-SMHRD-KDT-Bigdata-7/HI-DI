<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="Model.ChecklistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.MemberVO"%>
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
<style>
        #div2 {
            width: 85%;
            margin:0;
        }

        .checktitle {
            color: #81A3AA;
            margin: 3vh 5vw;
        }
        .disname, .checklist {
            border-left: 1px solid #81A3AA;
            padding: 10px;
        }
        
        .disname:first-child, .checklist:first-child {
            border-left: none;
        }
        #div2 table{
        	margin-left:5vw;
        	width:100%;
        }
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- 체크리스트 불러오기 -->
	<%
	//메소드 사용하기 위해 dao객체 생성
	DAO dao = new DAO();
	
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	
	//이전페이지에서 질병 명 받아옴	
	String getname = request.getParameter("name");
	
	ChecklistVO cvo = dao.SelectCheckName(getname);
	String[] get_arr = cvo.getCheck_item().split("/");
	
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
					<li class="nav-item"><a href="disease.jsp"
						class="nav-link"><span>질병검색</span></a></li>
					<li class="nav-item"><a href="foodall.jsp"
						class="nav-link"><span>식품검색</span></a></li>
					<li class="nav-item"><a href="poll.jsp"
						class="nav-link"><span>설문</span></a></li>
					<li class="nav-item"><a href="statistics.jsp"
						class="nav-link"><span>질병통계</span></a></li>
					<li class="nav-item"><a href="mypage.jsp"
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
						HI-DI로 자신의 건강정보를 <br> 체크해보자
					</h1>
				</div>
			</div>
		</div>
	</section>

	<div id="checklist_body">
		<div id="checklist1" class="open checklistMain">
			<div class="cl_word">
				<h3><%=getname %>자가진단</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p><%=getname %>자가진단</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div id="div2">
							<h2 class="checktitle"> 체크리스트 </h2>
							<table>
								<tr>
									<th class="disname" align="center" colspan=""><%= getname %></th>
								</tr>
								<tr>
									<td class="checklist" align="right">질문</td>
									<td class="checklist" align="center">예</td>
									<td class="checklist" align="center">아니오</td>
								</tr>
								<%for(int j=0; j<get_arr.length; j++){ %>
								<tr>
									<td class="checklist"><%= get_arr[j]%></td>
									<td class="checklist" align="center"><input type="radio" name="<%= "no"+j %>" value="1">
									</td>
									<td class="checklist" align="center"><input type="radio" name="<%= "no"+j %>" value="0">
									</td>
	
								</tr>
								<%} %>
								<tr>
									<td colspan="3" align="center">
                    					<button type="button" id="submit">결과보기</button>
                					</td>
								</tr>
							</table>
						</div><!--  -->
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
			if(radioChecked() >= <%=get_arr.length %>){
				for(let i = 0; i < radios.length; i++){
					if($(radios[i]).prop('checked')){
						console.log($(radios[i]).val());
						num += Number($(radios[i]).val());
					}
				}
				if(num >= <%=cvo.getCheck_std()%>){
					console.log("병원방문")
				}
				
				console.log("num : "+num);
				console.log("check_std : "+<%=cvo.getCheck_std()%>);
				//체크리스트 기준을 넘어 섰을 때 다른페이지로 이동
				let result = "";
				if(num >= <%=cvo.getCheck_std()%>){
					// ajax 이용해서 저장해둔 num 값을 사용해줄 servlet으로 보내줌
					result = "y";	
				}else{
					alert('진단결과 정상입니다.');
					result = "n";
				}
				window.location = 'checkResultService?point=x&id=<%=vo.getMb_id()%>&name=<%=cvo.getCheck_name()%>&seq=<%=cvo.getCheck_seq()%>&result='+result;
				
				
 		      }else{
 		         alert('모든 문항을 체크하세요.');
 		      }
 		      console.log(num);
 		         num = 0;
 		     });

	</script>


</body>
</html>