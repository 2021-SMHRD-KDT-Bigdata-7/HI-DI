<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<style>
    li{
        list-style: none;
		color: black;
    }
	ul{
		list-style:none;
	}/* ������ �Ǵ� �ּ� */
</style>
</head>
<body>
	<div id="joinBody">
        <div class="logoWord"><p>HI - DI</p></div>
        <div class="joinWord"><p>JOIN US</p></div>
        <form action="JoinService" method="post" class="joinService">
            <li><input name="id" type="text"  placeholder="ID�� �Է��ϼ���"></li>
            <li><input name="pw" type="password"  placeholder="PW�� �Է��ϼ���"></li>
            <li><input name="email" type="text"  placeholder="�̸��ϸ� �Է��ϼ���"></li>
            <li><input name="name" type="text"  placeholder="�̸��� �Է��ϼ���"></li>
            <li id="m">
            	<p>��</p><input type="radio" name="gender" value="m">
            	<p>��</p><input type="radio" name="gender" value="w">
            </li>
            <li><input name="phone" type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
            <li><input name="birthdate" type="date"  placeholder="���� �Է��ϼ���"></li>
            <li><input name="addr" type="text"  placeholder="�ּҸ� �Է��ϼ���"></li>
            <li><input type="submit" value="JoinUs" class="button fit"></li>
        </form>
    </div>
</body>
</html>