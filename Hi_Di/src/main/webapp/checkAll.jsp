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

	<!-- üũ����Ʈ �ҷ����� -->
	<%
	//�޼ҵ� ����ϱ� ���� dao��ü ����
	DAO dao = new DAO();
	
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	
	//�������������� ���� �� �޾ƿ�	
	String getname = request.getParameter("name");
	
	ChecklistVO cvo = dao.SelectCheckName(getname);
	String[] get_arr = cvo.getCheck_item().split("/");
	
	//���� ��ü �����Ϳ��� ������ �ߺ����� ���
	ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");
	
	//���� ��, ���� �ڵ� �ߺ����� ���
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
					<li class="nav-item"><a href="disease.jsp"
						class="nav-link"><span>�����˻�</span></a></li>
					<li class="nav-item"><a href="foodall.jsp"
						class="nav-link"><span>��ǰ�˻�</span></a></li>
					<li class="nav-item"><a href="poll.jsp"
						class="nav-link"><span>����</span></a></li>
					<li class="nav-item"><a href="statistics.jsp"
						class="nav-link"><span>�������</span></a></li>
					<li class="nav-item"><a href="mypage.jsp"
						class="nav-link"><span>����������</span></a></li>
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
				<h3><%=getname %>�ڰ�����</h3>
			</div>
			<div class="cl_body">
				<div class="cl_b_menu">
					<section>
						<a href="#" class="cl1_click"><p><%=getname %>�ڰ�����</p></a>
					</section>
				</div>
				<div class="cl_b_content">
					<div id="div2">
							<h2 class="checktitle"> üũ����Ʈ </h2>
							<table>
								<tr>
									<th class="disname" align="center" colspan=""><%= getname %></th>
								</tr>
								<tr>
									<td class="checklist" align="right">����</td>
									<td class="checklist" align="center">��</td>
									<td class="checklist" align="center">�ƴϿ�</td>
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
                    					<button type="button" id="submit">�������</button>
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
			console.log('üũ�� ���� ��ư : ' + cnt);
			return cnt;		
		}
	
	
		let num = 0;
		$('#submit').on('click', function(){
			
			// ���� �±� ���� ��������
			let radios = $('input[type="radio"]');
			if(radioChecked() >= <%=get_arr.length %>){
				
				for(let i = 0; i < radios.length; i++){
					
					if($(radios[i]).prop('checked')){
						console.log($(radios[i]).val());
						num += Number($(radios[i]).val());
					}
					
				}
				
				if(num >= <%=cvo.getCheck_std()%>){
					console.log("�����湮")
				}
				
				//üũ����Ʈ ������ �Ѿ� ���� �� �ٸ��������� �̵�
				
 				if(num >= <%= cvo.getCheck_std() %>){
 					// ajax �̿��ؼ� �����ص� num ���� ������� servlet���� ������
 					$.ajax({
 						type: "post", // get / post 
 						url:"checkResult.jsp",
 						success : function(res){
 							// res : Servlet���� ������ ��
 							// �� �ȿ� ó���� ����
 							// page�̵��� �Ͼ�� ���
 							// window��ü ��� : window��ü --> ��ä â�� ��������� ����
 							// window.location : ���� ������ �ּ�
 							// window.location = 'test.jsp' �̷������� �̵���ų �� ����
 							window.location = 'checkResult.jsp?name=<%= cvo.getCheck_name() %>&seq=<%= cvo.getCheck_seq() %>&result=y';
 						},
 						error : function() {
 							alert('���� ����');
 						}					
 					})
 				}else{
 		        	//üũ ��� db�� ����
 		        	<%=dao.InsertCheck(cvo.getCheck_seq(), "n", vo.getMb_id())%>
 		        	alert('���ܰ�� �����Դϴ�.');
 		         }
 		      }else{
 		         alert('��� ������ üũ�ϼ���.');
 		      }
 		      console.log(num);
 		         num = 0;
 		     });

	</script>


</body>
</html>