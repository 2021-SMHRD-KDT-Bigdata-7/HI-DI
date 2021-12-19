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

	#div2 {
    margin-bottom: 4vh;
    }
   
    
    /* ��ħ ���â CSS */
    
    .white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
    color: black;
	}
	.white_content:target {
    opacity:1;
    pointer-events: auto;
	}
	.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	overflow: auto;	
	}
	
	/* ��ħ ���â CSS �� */
	
	/* ���� �αٰŸ� ���â CSS */
    
    .white_content1 {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
    color: black;
	}
	.white_content1:target {
    opacity:1;
    pointer-events: auto;
	}
	.white_content1 > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	overflow: auto;	
	}
	
	/* ���� �αٰŸ� ���â CSS �� */
	
 
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<!-- üũ����Ʈ �ҷ����� -->
	<%
   //�޼ҵ� ����ϱ� ���� dao��ü ����
   DAO dao = new DAO();

   //������ �޾ƿ��� ���� ��ü����
   MemberVO vo = (MemberVO) session.getAttribute("vo");

   LocalDate now = LocalDate.now(); // ���� ��¥
   int year = now.getYear(); // ������ ������
   
   String mb_birth = vo.getMb_birthdate();
   int mb_age = Integer.parseInt(vo.getMb_birthdate().substring(0, 4)); // ������� ����⵵
   String check_age = Integer.toString((year - mb_age) / 10) + "0��"; //���ɴ� ����
   ArrayList<ChecklistVO> mb_checklist = dao.SelectCheckAge(check_age); //���ɴ뿡 �´� üũ����Ʈ ����

   //���ɺ� �������� üũ����Ʈ ����� ���� ���� �� ����
   Random rd = new Random();
   int num = rd.nextInt(mb_checklist.size());

   int check_seq = mb_checklist.get(num).getCheck_seq(); //���� ������
   String check_name = mb_checklist.get(num).getCheck_name(); //���� ������
   int check_std = mb_checklist.get(num).getCheck_std(); //���� üũ����
   String dis_code = mb_checklist.get(num).getDis_code(); //���� ���� �ڵ�
   String[] mb_arr = mb_checklist.get(num).getCheck_item().split("/"); //���� üũ����Ʈ

   //���� ��ü �����Ϳ��� ������ �ߺ����� ���
   ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");

   //���� �� �ߺ����� ���
   ArrayList<String> name = new ArrayList<String>();
   ArrayList<String> disname = new ArrayList<String>();
   if (checklist != null) {
      for (int i = 0; i < checklist.size(); i++) {
         name.add(checklist.get(i).getCheck_name());
      }
   }
   HashSet<String> name2 = new HashSet<String>(name);
   disname = new ArrayList<String>(name2);
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

					<h1 class="mb-0 bread">
						HI-DI�� �ڽ��� �ǰ������� <br> üũ�غ���
					</h1>
				</div>
			</div>
		</div>
	</section>

	<div id="checklist_body">
		<div id="checklist1" class="open checklistMain">
			<div class="cl_word">
				<h3>���ϸ�üũ</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p>���ϸ�üũ</p></a>
					</section>
					<section>
						<a href="#" class="cl2_click"><p>�ڰ�����</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div>
						<!-- �ڰ����� ����뺴�� -->
						<!-- div ���̵�, strong ���̵�, ul ���̵� �� �ְ� value�� �ۼ��� -->
						<div id="div1">
							<h2 class="checktitle">�Ϲ����� ����</h2>
							<div class="check_content">
								<ul class="sysmtom">
									<li id="l1">����</li>
									<li>�� ����</li>
									<li>������(��������)</li>
									<li>����</li>
									<li>�Ƿΰ�</li>
								</ul>
								<ul class="sysmtom">
									<li>��� ���</li>
									<li>�񽰰� ��Ҹ� �ҽ�</li>
									<li>����</li>
									<li>ü�߰��� </a></li>
									<li>�Ǹ����� ȥ�� </a></li>
								</ul>
								<ul class="sysmtom">
									<!-- ��ħ �˾�â HTML  -->
									<li>
										 <p><a href="http://www.snuh.org/health/SelfDgs/chart/Ch29.do">��ħ</a></p>
    										<div class="white_content" id="open">
            											<a href="#close">�ݱ�</a>	
            								</div>
									</li>
									<!-- ��ħ �˾�â HTML ��  -->
									
									<!-- ���� �αٰŸ� HTML -->
									<li>
										<p><a href="http://www.snuh.org/health/SelfDgs/chart/Ch42.do">���� �αٰŸ�</a></p>
    										<div class="white_content1" id="open1">
            									<a href="#close">�ݱ�</a>
            								</div>
									</li>
									<!-- ���� �αٰŸ� HTML -->
									<li>ü������</li>
									<li>�����</li>
									<li>���� ȣ��</li>
								</ul>
								<ul class="sysmtom">
									<li>�财 ���� ���</li>
									<li>���� ���</li>
									<li>�ҾȰ�</li>
									<li>õ����</li>
									<li>��</li>
								</ul>
								<ul class="sysmtom">
									<li>��</li>
									<li>��������</li>
									<li>��Ű�� ���</li>
									<li>�财��</li>
									<li>������ �� �긲</li>
								</ul>
								<ul class="sysmtom">
									<li>�������� �Ǻι���</li>
									<li>����</li>
									<li>����</li>
									<li>����</li>
									<li>���� �ִ� ����</li>
								</ul>
								<ul class="sysmtom">
									<li>��߼� ����</li>
									<li>���� ���� �Ǵ� ����</li>
									<li>�ǽŰ��� ����</li>
									<li>�ι߰� ������ ����</li>
									<li>����</li>
								</ul>
								<ul class="sysmtom">
									<li>���̳� ���� ����</li>
									<li>����</li>
									<li>���� �����̳� �ڱ�</li>
									<li>��߼� ����</li>
									<li>�ٸ��� ����</li>
								</ul>
								<ul class="sysmtom">
									<li>��������</li>
									<li>�÷� ��� �Ǵ� �ҽ�</li>
									<li>���� �ظ�</li>
									<li>������</li>
									<li>������ ���� ���� ����</li>
								</ul>
								<ul class="sysmtom">
									<li>û�� ��� �Ǵ� �ҽ�</li>
									<li>�׹��� ���� ����</li>
									<li>�߸� ��â</li>
									<li>��ð� ����</li>
									<li>���� ����</li>
								</ul>
								<ul class="sysmtom">
									<li>����</li>
									<li>����</li>
								</ul>
							</div>
						</div>
						<!-- üũ����Ʈ -->
						<div id="div2">
							<h2 class="checktitle">üũ����Ʈ</h2>
							<table>
								<tr>
									<th class="disname" align="center" colspan=""><%= check_name %></th>
								</tr>
								<tr>
									<td class="checklist" align="right">����</td>
									<td class="checklist" align="center">��</td>
									<td class="checklist" align="center">�ƴϿ�</td>
								</tr>
								<%for(int j=0; j<mb_arr.length; j++){ %>
								<tr>
									<td class="checklist"><%= mb_arr[j]%></td>
									<td class="checklist" align="center"><input type="radio"
										name="<%= "no"+j %>" value="1"></td>
									<td class="checklist" align="center"><input type="radio"
										name="<%= "no"+j %>" value="0"></td>

								</tr>
								<%} %>
								<tr>
									<td colspan="3" align="right">
										<button type="button" id="submit">�������</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="checklist2" class="checklistMain">
			<div class="cl_word">
				<h3>�ڰ�����</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p>���ϸ�üũ</p></a>
					</section>
					<section>
						<a href="#" class="cl2_click"><p>�ڰ�����</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div id="div3">
						<h2 class="selfchecktitle">�ڰ�����</h2>
						<div class="list_content">
							<ul class="symall">
								<%for(int i=0; i<disname.size(); i++){ %>
									<li>
										<a href="checkAll.jsp?name=<%=disname.get(i)%>" style="color:black"><%=disname.get(i)%>�ڰ�����</a>
									</li>
									<%if((i+1)%4==0 && i>0){ %>
										</ul><ul class="symall">
									<%} %>
								<%} %>						
							</ul>
						</div>
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
		console.log('üũ�� ���� ��ư : ' + cnt);
			return cnt;      
		}
   
   
		let num = 0;
		$('#submit').on('click', function(){
			// ���� �±� ���� ��������
			let radios = $('input[type="radio"]');
			if(radioChecked() >= <%=mb_arr.length%>){
            
			for(let i = 0; i < radios.length; i++){
				if($(radios[i]).prop('checked')){
					console.log($(radios[i]).val());
					num += Number($(radios[i]).val());
				}  
			}
			
			console.log("num : "+num);
			console.log("check_std : "+<%=check_std%>);
			//üũ����Ʈ ������ �Ѿ� ���� �� �ٸ��������� �̵�
			let result = "";
			if(num >= <%=check_std%>){
				// ajax �̿��ؼ� �����ص� num ���� ������� servlet���� ������
				result = "y";	
			}else{
				alert('���ܰ�� �����Դϴ�.');
				result = "n";
			}
			window.location = 'checkResultService?point=o&id=<%=vo.getMb_id()%>&name=<%=check_name%>&seq=<%=check_seq%>&result='+result;
       		
			
	    	
		}else{
			alert('��� ������ üũ�ϼ���.');
		}
		console.log(num);
		num = 0;
	});
   </script>


</body>
</html>