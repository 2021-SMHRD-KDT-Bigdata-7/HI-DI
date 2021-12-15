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
   font-family: 'Malgun Gothic', dotum, '����', sans-serif;
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
</style>
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
	ArrayList<RawVO> rawlist = dao.RawSelect();	//���缺�� ���� ���
	ArrayList<String> raw_name = new ArrayList<String>();	//���缺�� �̸�
	ArrayList<String> raw_func = new ArrayList<String>();	//���缺�� ���
	
	//�޾ƿ� �����̸����� ���� ��ü ���� �޾ƿ���
	DiseaseVO dvo =  dao.SelectDiseaseName(name);
	
	if(dvo != null){		
		hoslist = dao.HospitalAll(dvo.getDis_dpt());
		
		String[] tags = dvo.getDis_tag().replace(" ", "").split(",");	//�±װ� �������� �� �Ѱ��� �迭�� ����

		out.print(tags.length+"/");	//��������
		
		for(int i=0; i<tags.length;i++){
			out.print(tags[i]+"/");
			
		}	//����
		

		
		
		for(int i =0; i<tags.length; i++){	//������ ���� �±� �˻��ϱ� ���� tag
			
			for(int j=0; j<rawlist.size(); j++){	//��ü ���缺�п��� ������ ���� tag ã��
				
				String taglist = rawlist.get(j).getDis_tag();
				
				if(taglist.contains(tags[i])==true){
					out.print(tags[i]+"/");
					out.print(rawlist.get(j).getRaw_name());
					raw_name.add(rawlist.get(j).getRaw_name());
					raw_func.add(rawlist.get(j).getRaw_func());
					
					
				}
			}
			
		}
		
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
		<!-- 
		raw_name.add(rawlist.get(j).getRaw_name());
		raw_func.add(rawlist.get(j).getRaw_func()); -->
			<%for(int i=0; i<raw_name.size(); i++){ %>
				<%=raw_name.get(i) %>
				(��� : <%= raw_func.get(i)%>),<br>       
			<%} %>
			�Դϴ�.
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
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b3a32b355a4dc98f4a07c93f17a9fb"></script>


	<script type="text/javascript">
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
		var content = [];
		var overlay = [];
		var marker = [];
		var markerImage = [];   //��Ŀ �̹���+ũ�� �迭
		var imageSize = new kakao.maps.Size(30, 30);   //��Ŀũ��
		var dpt = ["�Ȱ�", "����", "����", "��ġ�������а�", "����ΰ�", "�����ܰ�", "�Ҿư�", "�Ҿ�û�ҳ��", "�񴢱��", "�����а�", "�Ű��", "�Ű�ܰ�", "�ܰ�",
		   "�������а�", "���Ű�", "�����ܰ�", "ġ��", "�Ǻΰ�", "�ѹ��"];
	
		//��Ŀ �̹����� �̹��� �ּ��Դϴ�
		for(let i=1; i<20; i++){
		   var imageSrc = "./mapimages/hospital"+i+".png";
		   markerImage[i-1] = new kakao.maps.MarkerImage(imageSrc, imageSize);
		}
		
		// positions�� push�޼���� ��ü �־��ֱ�
		<%for (int j = 0; j < hoslist.size(); j++) {%>

		      positions.push({
		               title : '<%=hoslist.get(j).getHos_name()%>',
		               latlng : new kakao.maps.LatLng( <%=hoslist.get(j).getHos_longitude()%>, <%=hoslist.get(j).getHos_latitude()%>)
		         });

		      //Ŀ���� �������̿� ǥ���� ������
		      content[<%=j%>]='<div class="wrap">' + 
		                '    <div class="info">' + 
		                '        <div class="title">' + 
		                '            <%=hoslist.get(j).getHos_name()%>' + 
		                '            <div class="close" title="�ݱ�"></div>' + 
		                '        </div>' + 
		                '        <div class="body">' +
		                '            <div class="desc">' + 
		                '                <div class="ellipsis"><%=hoslist.get(j).getHos_addr()%></div>' + 
		                '                <div class="jibun ellipsis"><%=hoslist.get(j).getHos_phone()%></div>' + 
		                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">Ȩ������</a></div>' + 
		                '            </div>' + 
		                '        </div>' + 
		                '    </div>' +    
		                '</div>';
		         
		         // ��Ŀ�� �����մϴ�
		         for(let i=0; i<19; i++){
		            if("<%=hoslist.get(j).getHos_dpt()%>" == dpt[i]){
		               marker[<%=j%>] = new kakao.maps.Marker({
		                  map : map, // ��Ŀ�� ǥ���� ����
		                  position : positions[<%=j%>].latlng, // ��Ŀ�� ǥ���� ��ġ
		                  title : positions[<%=j%>].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
		                  
		                  image : markerImage[i]
		               // image : markerImage // ��Ŀ �̹��� 
		               });            
		            }            
		         }
		         // ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
		         // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
		         overlay[<%=j%>] = new kakao.maps.CustomOverlay({
		            content : content[<%=j%>],
		            map : map,
		            position : marker[<%=j%>].getPosition()
		         });
		         overlay[<%=j%>].setMap(null)
		         
		         
		         // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
		         kakao.maps.event.addListener(marker[<%=j%>], 'mouseover', function() {
		            overlay[<%=j%>].setMap(map);
		         });
		         kakao.maps.event.addListener(marker[<%=j%>], 'mouseout', function() {
		            overlay[<%=j%>].setMap(null);
		         });
		      
		         
		<%}%>

		      
		      //HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		      if (navigator.geolocation) {

		         // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		         navigator.geolocation.getCurrentPosition(function(position) {

		            lat = position.coords.latitude; // ����
		            lon = position.coords.longitude; // �浵

		            var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
		            message = '<div style="padding:5px;">���� ��ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�

		            // ��Ŀ�� ���������츦 ǥ���մϴ�
		            displayMarker(locPosition, message);

		         });

		      } else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

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