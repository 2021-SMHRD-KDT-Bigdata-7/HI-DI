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
</style>
</head>
<body>
	<%
	DAO dao = new DAO();
	
	//세션에서 아이디 받아오기
	HttpSession session2 = request.getSession();
	MemberVO vo = (MemberVO)session2.getAttribute("vo");
	
	//시퀀스 받아오기
	int seq = 0;
	try{
		seq = Integer.parseInt(request.getParameter("seq"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//result값 받아오기
	String result = request.getParameter("result");
	
	//체크 결과 db에 저장
	dao.InsertCheck(seq, result, vo.getMb_id());

	
	//이름값 받아오기
	String name = request.getParameter("name");
	
	ArrayList<HospitalVO> hoslist = null;
	ArrayList<RawVO> rawlist = dao.RawSelect();	//영양성분 정보 출력
	ArrayList<String> raw_name = new ArrayList<String>();	//영양성분 이름
	ArrayList<String> raw_func = new ArrayList<String>();	//영양성분 기능
	
	//받아온 질병이름으로 질병 전체 정보 받아오기
	DiseaseVO dvo =  dao.SelectDiseaseName(name);
	
	if(dvo != null){		
		hoslist = dao.HospitalAll(dvo.getDis_dpt());
		
		String[] tags = dvo.getDis_tag().replace(" ", "").split(",");	//태그가 여러개일 때 한개씩 배열에 저장

		out.print(tags.length+"/");	//삭제가능
		
		for(int i=0; i<tags.length;i++){
			out.print(tags[i]+"/");
			
		}	//삭제
		

		
		
		for(int i =0; i<tags.length; i++){	//질병에 대한 태그 검색하기 위한 tag
			
			for(int j=0; j<rawlist.size(); j++){	//전체 영양성분에서 질병에 대한 tag 찾기
				
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
		out.print("지도 로딩 실패");
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
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg');" data-stellar-background-ratio="0.5">
	  <div class="overlay"></div>
	  <div class="container">
	    <div class="row no-gutters slider-text align-items-end justify-content-center">
	      <div class="col-md-9 ftco-animate pb-5 text-center">
	        <h1 class="mb-0 bread">진단 결과</h1>
	        <p class="breadcrumbs">진단 결과를 확인 하세용</p>
	      </div>
	    </div>
	  </div>
	</section>

<!-- 자가진단 결과 출력 -->
<span> <%= name %> (이)가 의심 됩니다.</span><br>
<%if(dvo != null){ %>	
	<span><%= name %>는 <%=dvo.getDis_content() %> 이고</span><br>
	<span><%=dvo.getDis_symptom() %> 과 같은 증상이 있을 수 있습니다.</span><br>
	<%if(rawlist != null){ %>
		<span>도움이 되는 영양 성분은 
		<!-- 
		raw_name.add(rawlist.get(j).getRaw_name());
		raw_func.add(rawlist.get(j).getRaw_func()); -->
			<%for(int i=0; i<raw_name.size(); i++){ %>
				<%=raw_name.get(i) %>
				(기능 : <%= raw_func.get(i)%>),<br>       
			<%} %>
			입니다.
		</span><br>
	<%} %>		
	
	<span><%=dvo.getDis_dpt() %> 에 방문 하는 것을 추천 합니다.</span><br>
<%}else{ %>
	<span>병원에 방문 하는 것을 추천 합니다.</span>
<%} %>


<!-- 지도 띄우기 -->
<%if(hoslist != null){ %>

	<div id="map" style="width: 50%; height: 400px; top: 300px; position:relative; left:50%; transform : translate(-50%,0)"></div>
	
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
		            if("<%=hoslist.get(j).getHos_dpt()%>" == dpt[i]){
		               marker[<%=j%>] = new kakao.maps.Marker({
		                  map : map, // 마커를 표시할 지도
		                  position : positions[<%=j%>].latlng, // 마커를 표시할 위치
		                  title : positions[<%=j%>].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		                  
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
		         overlay[<%=j%>].setMap(null)
		         
		         
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
<%} %>
	<!-- 지도 끝 -->


	
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