<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>

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

.table {
	width: 100%;
	border-collapse: collapse;
}

.table td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

.table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table tr:hover {
	background-color: #ddd;
}

.table td:first-child {
	width: 110px; /* 첫 번째 열의 너비 설정 */
}

.table td:first-child i {
	margin-right: 5px;
}
</style>

<script type="text/javascript">
   function memberDelete() {
      if (confirm("${memberDTO.user_name}님 회원을 탈퇴 하시겠습니까?")) {
         location.href = "./MemberDelete.me?user_id=${user_id}"
      }
   }

</script>

</head>
<body>


	<section id="member">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="text-muted">
								<i class="fas fa-user-tag mr-sm-1"></i>회원 정보 수정
							</h3>
						</div>
						<div class="card-body">
							<form action="./MemberUpdateView.me" method="get" id="signupForm"
								enctype="application/x-www-form-urlencoded">
								<table class="table">
									<tbody>
										<tr>
											<td><label for="user_id"><i
													class="fas fa-user-check mr-sm-1"></i>아이디</label></td>
											<td><input type="text" name="user_id" id="user_id"
												class="form-control bg-white" value="${memberDTO.user_id}"
												readonly></td>
										</tr>
										<tr>
											<td><label for="user_name"><i
													class="fas fa-user-plus mr-sm-1"></i>이름</label></td>
											<td><input type="text" name="user_name" id="user_name"
												class="form-control" value="${memberDTO.user_name}" required></td>
										</tr>
										<tr>
											<td><label for="user_pw"><i
													class="fas fa-unlock-alt mr-sm-1"></i>비밀번호</label></td>
											<td><input type="password" name="user_pw" id="user_pw"
												class="form-control" required></td>
										</tr>
										<tr>
											<td><label for="pwdre"><i
													class="fas fa-lock mr-sm-1"></i>비밀번호 확인</label></td>
											<td><input type="password" name="pwdre" id="pwdre"
												class="form-control" required></td>
										</tr>
										<tr>
											<td><label for="user_email"><i
													class="fas fa-envelope-open mr-sm-1"></i>이메일</label></td>
											<td><input type="email" name="user_email"
												id="user_email" class="form-control"
												value="${memberDTO.user_email}" required></td>
										</tr>
										<tr>
											<td><label for="user_age"><i
													class="fas fa-user-clock mr-sm-1"></i>나이</label></td>
											<td><input type="text" name="user_age" id="user_age"
												class="form-control" value="${memberDTO.user_age}" required></td>
										</tr>
										<tr>
											<td><label for="user_phone_num"><i
													class="fas fa-user-clock mr-sm-1"></i>전화번호</label></td>
											<td><input type="tel" name="user_phone_num"
												id="user_phone_num" class="form-control"
												value="${memberDTO.user_phone_num}" required></td>
										</tr>
										<tr>
											<td><label for="user_bdate"><i
													class="fas fa-birthday-cake mr-sm-2"></i>생일</label></td>
											<td><input type="date" name="user_bdate" id="user_bdate"
												class="form-control" value="${memberDTO.user_bdate}" required></td>
										</tr>


										<tr>
											<td colspan="2" class="text-center">
												<div class="button-group">
													<button type="submit"
														class="btn btn-outline-primary mr-sm-1">
														<i class="fas fa-save mr-sm-1"></i>정보 수정
													</button>
													<button type="reset" id="clear"
														class="btn btn-outline-warning mr-sm-1">
														<i class="fas fa-share-square mr-sm-1"></i>수정 취소
													</button>
													<button type="button"
														class="btn btn-outline-danger mr-sm-1"
														onclick="memberDelete()">
														<i class="fas fa-user-times mr-sm-1"></i>회원 탈퇴
													</button>
													
													<button type="button" class="btn btn-outline-info" onclick="location.href='./LoginHome.me'">
   													<i class="fas fa-home mr-sm-1"></i>홈으로
													</button>
													
												</div>
											</td>
										</tr>

									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

</body>
</html>