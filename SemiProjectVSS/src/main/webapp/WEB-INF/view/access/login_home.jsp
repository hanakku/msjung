<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 홈</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	text-align: center;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
}

.links {
	margin-top: 30px;
}

.links a {
	display: inline-block;
	margin: 10px;
	padding: 10px 20px;
	background-color: green;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.links a:hover {
	background-color: #0056b3;
}

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
        <h1 style="text-align: center;">동영상 스트리밍 서비스</h1>
        <div class="links">
            <a href="MemberSelectDetail.me?user_id=${user_id}">내 회원 정보</a>
            <a href="Logout.me">로그 아웃</a>
        </div>
    </div>

</html>