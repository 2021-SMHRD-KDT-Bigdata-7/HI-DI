<%@page import="Model.DiseaseVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% DiseaseVO dvo=(DiseaseVO)request.getAttribute("dvo"); 
	%>
	<ul>
		<li>질병 순번 : <%=dvo.getDis_seq() %></li>
		<li>질병 코드 : <%=dvo.getDis_code() %></li>
		<li>질병 명 : <%=dvo.getDis_name() %></li>
		<li>질병 설명 : <%=dvo.getDis_content() %></li>
		<li>질병 증상 : <%=dvo.getDis_symptom() %></li>
		<li>질병 진료과 : <%=dvo.getDis_dpt() %></li>
	</ul>
</body>
</html>