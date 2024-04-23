<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.user_id}">
		<script type="text/javascript">
			alert("회원 아이디 ${memberDTO.user_id})의 탈퇴가 완료되었습니다.")
			location.href="./MemberSelect.me"
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("탈퇴가 완료되었습니다.")
			location.href="./Logout.me";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>