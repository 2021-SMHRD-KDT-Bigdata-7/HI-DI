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
            <li><input name="id" type="text"  placeholder="ID을 입력하세요"></li>
            <li><input name="pw" type="password"  placeholder="PW를 입력하세요"></li>
            <li><input name="email" type="text"  placeholder="이메일를 입력하세요"></li>
            <li><input name="name" type="text"  placeholder="이름을 입력하세요"></li>
            <li id="m">남<input type="radio" name="gender" value="m">
            여<input type="radio" name="gender" value="w"></li>
            <li><input name="phone" type="text"  placeholder="전화번호를 입력하세요"></li>
            <li><input name="birthdate" type="date"  placeholder="생일 입력하세요"></li>
            <li><input name="addr" type="text"  placeholder="주소를 입력하세요"></li>
            <li><input type="submit" value="JoinUs" class="button fit"></li>
        </form>
    </div>
</body>
</html>