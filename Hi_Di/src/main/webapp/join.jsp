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
	}
</style>
</head>
<body>
	<div id="joinBody">
        <li class="joinWord"><h5>JOIN US</h5></li>
        <form action="JoinService" method="post" class="joinService">
            <li><input name="id" type="text"  placeholder="ID�� �Է��ϼ���"></li>
            <li><input name="pw" type="password"  placeholder="PW�� �Է��ϼ���"></li>
            <li><input name="email" type="text"  placeholder="�̸��ϸ� �Է��ϼ���"></li>
            <li><input name="name" type="text"  placeholder="�̸��� �Է��ϼ���"></li>
            <li id="m">��<input type="radio" name="gender" value="m">
            ��<input type="radio" name="gender" value="w"></li>
            <li><input name="phone" type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
            <li><input name="birthdate" type="date"  placeholder="���� �Է��ϼ���"></li>
            <li><input name="addr" type="text"  placeholder="�ּҸ� �Է��ϼ���"></li>
            <li><input type="submit" value="JoinUs" class="button fit"></li>
        </form>
    </div>
</body>
</html>