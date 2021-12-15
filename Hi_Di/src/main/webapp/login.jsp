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
		<div class="logoWord"><p>HI - DI</p></div>
        <div class="loginWord"><p>LOGIN</p></div>
        <form action="LoginService" method="post" class="LoginService">
            <li><input name="id" type="text"  placeholder="ID을 입력하세요"></li>
            <li><input name="pw" type="password"  placeholder="PW를 입력하세요"></li>
            <li><input type="submit" value="LogIn" class="button fit"></li>
        </form>
    </div>
</body>
</html>