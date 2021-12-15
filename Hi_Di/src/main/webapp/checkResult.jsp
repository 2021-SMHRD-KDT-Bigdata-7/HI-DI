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
</head>
<body>
	<%
	DAO dao = new DAO();
	
	//���ǿ��� ���̵� �޾ƿ���
	HttpSession session2 = request.getSession();
	MemberVO vo = (MemberVO)session2.getAttribute("vo");
	
	//������ �޾ƿ���
	int seq = 0;
	try{
		seq = Integer.parseInt(request.getParameter("seq"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//result�� �޾ƿ���
	String result = request.getParameter("result");
	
	//üũ ��� db�� ����
	dao.InsertCheck(seq, result, vo.getMb_id());

	
	//�̸��� �޾ƿ���
	String name = request.getParameter("name");
	
	ArrayList<HospitalVO> hoslist = null;
	ArrayList<RawVO> rawlist = null;
	
	DiseaseVO dvo =  dao.SelectDiseaseName(name);
	if(dvo != null){		
		hoslist = dao.HospitalAll(dvo.getDis_dpt());
		String[] tags = dvo.getDis_tag().split(",");
		rawlist = dao.RawSelect(dvo.getDis_tag());
	}else{
		out.print("���� �ε� ����");
	}
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
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg');" data-stellar-background-ratio="0.5">
	  <div class="overlay"></div>
	  <div class="container">
	    <div class="row no-gutters slider-text align-items-end justify-content-center">
	      <div class="col-md-9 ftco-animate pb-5 text-center">
	        <h1 class="mb-0 bread">���� ���</h1>
	        <p class="breadcrumbs">���� ����� Ȯ�� �ϼ���</p>
	      </div>
	    </div>
	  </div>
	</section>

<!-- �ڰ����� ��� ��� -->
<span> <%= name %> (��)�� �ǽ� �˴ϴ�.</span><br>
<%if(dvo != null){ %>	
	<span><%= name %>�� <%=dvo.getDis_content() %> �̰�</span><br>
	<span><%=dvo.getDis_symptom() %> �� ���� ������ ���� �� �ֽ��ϴ�.</span><br>
	<%if(rawlist != null){ %>
		<span>������ �Ǵ� ���� ������ 
			<%for(int i=0; i<rawlist.size(); i++){ %>
				<%=rawlist.get(i).getRaw_name() %>
				(��� : <%= rawlist.get(i).getRaw_func()%>) �Դϴ�.       
			<%} %>
		</span><br>
	<%} %>		
	
	<span><%=dvo.getDis_dpt() %> �� �湮 �ϴ� ���� ��õ �մϴ�.</span><br>
<%}else{ %>
	<span>������ �湮 �ϴ� ���� ��õ �մϴ�.</span>
<%} %>


<!-- ���� ���� -->
<%if(hoslist != null){ %>

	<div id="map" style="width: 50%; height: 400px; top: 300px; position:relative; left:50%; transform : translate(-50%,0)"></div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b3a32b355a4dc98f4a07c93f17a9fb"></script>
	
	<div id="map" style="width: 100%; height: 350px;"></div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b3a32b355a4dc98f4a07c93f17a9fb"></script>


	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
	    	mapOption = { 
	        	center: new kakao.maps.LatLng(35.11154588685366, 126.87755807671306), // ������ �߽���ǥ
	        	level: 5 // ������ Ȯ�� ����
	    	};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
	 
		// ��Ŀ�� ǥ���� ��ġ�� title , cotnents ��ü �迭�Դϴ� 
		var lat = null;
		var lon = null;
		var positions = [];
		var title = [];
		var content=[{}];
	
		
		// positions�� push�޼���� ��ü �־��ֱ�
		<%for (int i = 0; i < hoslist.size(); i++) {%>
			positions.push({
				title : '<%=hoslist.get(i).getHos_name()%>',
				latlng : new kakao.maps.LatLng(
					<%=hoslist.get(i).getHos_longitude()%>,
					<%=hoslist.get(i).getHos_latitude()%>
				)
			})
		<%}%>
		
		// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png";
	
		for (var i = 0; i < positions.length; i++) {
	
			// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
			var imageSize = new kakao.maps.Size(24, 35);
	
			// ��Ŀ �̹����� �����մϴ�    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
			// ��Ŀ�� �����մϴ�
			var marker = new kakao.maps.Marker({
				map : map, // ��Ŀ�� ǥ���� ����
				position : positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
				title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
				image : markerImage
				// ��Ŀ �̹��� 
				});
			};
			
					
		//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {
	
			// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
			navigator.geolocation.getCurrentPosition(function(position) {
	
				lat = position.coords.latitude, // ����
				lon = position.coords.longitude; // �浵
				
				var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
				message = '<div style="padding:3px;">������ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
									
				// ��Ŀ�� ���������츦 ǥ���մϴ�
				displayMarker(locPosition, message);
					
			});
		} else { 
			// HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
	
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation�� ����Ҽ� �����..'
	
				displayMarker(locPosition, message);
		}
	
		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition, message) {
	
			// ��Ŀ�� �����մϴ�
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});
	
			var iwContent = message, // ���������쿡 ǥ���� ����
			iwRemoveable = true;
		
			// ���������츦 �����մϴ�
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});
				
			// ���������츦 ��Ŀ���� ǥ���մϴ� 
			infowindow.open(map, marker);
				
			// ���� �߽���ǥ�� ������ġ�� �����մϴ�
			map.setCenter(locPosition);
				
		}
		
		
		
	</script>
<%} %>
	<!-- ���� �� -->


	
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