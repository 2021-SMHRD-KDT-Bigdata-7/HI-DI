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
		<li>���� ���� : <%=dvo.getDis_seq() %></li>
		<li>���� �ڵ� : <%=dvo.getDis_code() %></li>
		<li>���� �� : <%=dvo.getDis_name() %></li>
		<li>���� ���� : <%=dvo.getDis_content() %></li>
		<li>���� ���� : <%=dvo.getDis_symptom() %></li>
		<li>���� ����� : <%=dvo.getDis_dpt() %></li>
	</ul>
</body>
</html>