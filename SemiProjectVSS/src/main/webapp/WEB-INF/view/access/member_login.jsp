<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>

<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>

<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 300px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 50px;
}

h2 {
	text-align: center;
}

.error-message {
	color: red;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

a:link {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
 
a:active {
	text-decoration: underline;
}



</style>

</head>
<body>
      
 <div class="container">
        <h2>Login</h2>
  <form action="./Login.me" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
        <label for="user_id">아이디</label>
        <input type="text" id="user_id" name="user_id" required>
        <label for="user_pw">비밀번호</label>
        <input type="password" id="user_pw" name="user_pw" required>
        <input type="submit" value="로그인">
    </form>  
        <div align="center">    
        <a href="./MemberInsertView.me" class="btn btn-success btn-block">회원 가입</a> | 
        <a href="./IdSearchView.me" class="btn btn-success btn-block">아이디 찾기</a> | 
        <a href="./PasswordSearchView.me" class="btn btn-success btn-block">비밀번호 찾기</a>     
        </div>
    </div>     

</body>
</html>