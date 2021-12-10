<%@page import="java.util.HashSet"%>
<%@page import="Model.DAO"%>
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
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
			<table>
				<caption>
					<h2>�ڰ�����</h2>
				</caption>
				<span>
					<%for(int i=0; i<disname.size(); i++) {%>
						<%=disname.get(i) %>
					<%} %>
					<%=disname.size() %>
				</span>
				<tr>
					<td>���ɴ�</td>
					<td>�����̸�</td>
					<td>üũ�׸�</td>
					<td>üũ����</td>
				</tr>
				<%if(checklist != null){ %>
				<%for(int i=0 ; i<checklist.size() ; i++){%>
				<tr>
					<td><%= checklist.get(i).getCheck_age()%></td>
					<td><%= checklist.get(i).getCheck_name()%></td>
					<td>
						<%String[] check_arr = checklist.get(i).getCheck_item().split("/"); %>
						<%for(int j=0; j<check_arr.length; j++){ %>
							<%= check_arr[j]%><br>
						<%} %><br>				
					</td>
					<td><%= checklist.get(i).getCheck_std()%></td>
				</tr>
				<%} %>
				<%} %>
			</table>
		</nav>
		<a href="main.jsp" class="button next scrolly">�ǵ��ư���</a>
	</div>
</body>
</html>