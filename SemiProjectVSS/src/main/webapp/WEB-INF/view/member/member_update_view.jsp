<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정 확인</title>
</head>
<body>

<script type="text/javascript">
alert("\"${memberDTO.user_id}\"님의 개인 정보가 수정되었습니다.")
location.href="./MemberSelectDetail.me?user_id=${memberDTO.user_id}";
</script>

</body>
</html>