<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDate"%>
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
<script src="js/jquery-3.6.0.min.js"></script>

    <style>
        #radio_area {
            width: 600px;
            height: 820px;
            background-color: lightgray;
            padding: 10px;

            display: none;
        }

        #text_area {
            width: 80%;
            float: left;
            display: block;
        }

        #btn_area {
            width: 20%;
            float: right;
            text-align: right;
            display: block;
        }

        .display_score {
            float: right;
            font-size: 0.7em;
            font-style: italic;
            text-align: right;
        }

        #end_btn {
            display: none;
        }
    </style>
</head>

<body>
  
	<%
	//�޼ҵ� ����ϱ� ���� dao��ü ����
	DAO dao = new DAO();
	

	
	//������ �޾ƿ��� ���� ��ü����
	MemberVO vo = (MemberVO)session.getAttribute("vo");
	
	LocalDate now = LocalDate.now();	// ���� ��¥
	
	int year = now.getYear();	// ������ ������
	int mb_age = Integer.parseInt(vo.getMb_birthdate().substring(0,4));	// ������� ����⵵
	String check_age = Integer.toString((year - mb_age)/10)+"0��";
	ArrayList<ChecklistVO> mb_checklist = dao.SelectCheckAge(check_age);
	
	//���ɺ� �������� üũ����Ʈ ����� ���� ���� �� ����
	Random rd = new Random();
	
	int num = rd.nextInt(mb_checklist.size()+1);
	
	
	//���� ��ü �����Ϳ��� ������ �ߺ����� ���
	ArrayList<ChecklistVO> checklist = (ArrayList<ChecklistVO>) request.getAttribute("checklist");
	
	//���� �� �ߺ����� ���
	ArrayList<String> name = new ArrayList<String>();
	ArrayList<String> disname = new ArrayList<String>();
	if(checklist != null){
		for(int i=0; i<checklist.size(); i++){
			name.add(checklist.get(i).getCheck_name());
		}
	}
	HashSet<String> name2 = new HashSet<String>(name);
	disname = new ArrayList<String>(name2);
	
	
	//�����ڵ� �ߺ����� ���
	ArrayList<String> code = new ArrayList<String>();
	ArrayList<String> discode = new ArrayList<String>();
	if(checklist != null){
		for(int i=0; i<checklist.size(); i++){
			code.add(checklist.get(i).getDis_code());
		}
	}
	HashSet<String> code2 = new HashSet<String>(code);
	discode = new ArrayList<String>(code2);
	
	%>
	<%=discode %>
	
    <h2>����� �ڰ� ����</h2>
    <button id="start_btn" onclick="create_radio_button()">���� ����</button>
    <br><br>
    <div id="radio_area">
    	<div class="display_score">
            * �亯 ���<br>
            ��(1) / �ƴϿ�(0)
        </div>
    	<br><br>
        <div id="text_area"></div> <!-- ���� ��� div -->
        <div id="btn_area"></div> <!-- ���� ��ư ��� div -->
    </div>
    <br>
    <button id="end_btn" onclick="check_gloomy()">��� ����</button>
	
	
	
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
		
		
			<table>
				<caption>
					<h2>�ڰ�����</h2>
				</caption>
				<span> 
				<!-- ������ üũ����Ʈ ��� -->
					<%= year %>
					<%= mb_age %>					
					<%= check_age %>
					<br><br><br><br><br><br><br><br><br><br><br>
					<%= mb_checklist.get(num).getCheck_name() %><br>
					<%= mb_checklist.get(num).getCheck_std() %><br>
					<%String[] mb_arr = mb_checklist.get(num).getCheck_item().split("/"); %>
					<%for(int j=0; j<mb_arr.length; j++){ %> 
						<%= mb_arr[j]%><br>
					<%} %><br>
					<br><br><br><br><br><br><br><br><br><br><br>
					<%for(int i=0; i<mb_checklist.size(); i++) {%> 
						<%= mb_checklist.get(i).getCheck_name() %><br>
						<%= mb_checklist.get(i).getCheck_std() %><br>
						<%String[] check_arr = mb_checklist.get(i).getCheck_item().split("/"); %>
						<%for(int j=0; j<check_arr.length; j++){ %> 
							<%= check_arr[j]%><br>
						<%} %><br>
						<br>
					<%} %>
					
					<br><br><br><br><br><br><br><br><br><br><br>
					<%=dao.SelectCheckName("����").getCheck_name() %>
					<br>
					<%for(int i=0; i<disname.size(); i++) {%> 
						<%= dao.SelectCheckName(disname.get(i)).getCheck_name() %><br>
						<%= dao.SelectCheckName(disname.get(i)).getCheck_std() %><br>
						<%String[] check_arr = checklist.get(i).getCheck_item().split("/"); %>
						<%for(int j=0; j<check_arr.length; j++){ %> 
							<%= check_arr[j]%><br>
						<%} %><br>
						<br>
					<%} %>
				</span>
				<tr>
					<td>���ɴ�</td>
					<td>�����̸�</td>
					<td>üũ�׸�</td>
					<td>üũ����</td>
				</tr>
				<!-- ��ü��� -->
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