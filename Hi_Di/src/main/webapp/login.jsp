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
    }
</style>
</head>
<body>
	<div id="loginBody">
        <li class="loginWord"><h5>LOGIN</h5></li>
        <form action="LoginService" method="post" class="LoginService">
            <li><input name="id" type="text"  placeholder="ID�� �Է��ϼ���"></li>
            <li><input name="pw" type="password"  placeholder="PW�� �Է��ϼ���"></li>
            <li><input type="submit" value="LogIn" class="button fit"></li>
        </form>
    </div>
</body>
</html>