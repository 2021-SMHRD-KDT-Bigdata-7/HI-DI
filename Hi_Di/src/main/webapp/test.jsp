<%@page import="Model.ChecklistVO"%>
<%@page import="Model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");
	%>
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
			<table>
				<caption>
					<h2>회원관리페이지</h2>
				</caption>
				<tr>
					<td>연령대</td>
					<td>질병이름</td>
					<td>체크항목</td>
				</tr>
				<% for(int i=0 ; i<checklist.size() ; i++){%>
				<tr>
					<td><%= checklist.get(i).getCheck_age()%></td>
					<td><%= checklist.get(i).getCheck_item()%></td>
					<td><%= checklist.get(i).getCheck_name()%></td>
				</tr>
				<%} %>
			</table>
		</nav>
		<a href="main.jsp" class="button next scrolly">되돌아가기</a>
	</div>
</body>
</html>