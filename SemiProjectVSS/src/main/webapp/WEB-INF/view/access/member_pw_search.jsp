<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>

<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 310px;
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

.form-group input {
    width: 300px; /* 버튼 너비를 고려하여 입력 필드 너비 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    margin-bottom: 10px; /* 각 버튼의 하단 여백을 10px로 설정 */
}

button[type="submit"], button[type="reset"], button[type="button"] {
    width: 100px; /* 너비를 크게 설정 */
    height: 30px; /* 높이를 크게 설정 */
    background-color: green;
   color: white;
   text-decoration: none;
   border-radius: 5px;
   transition: background-color 0.3s ease;
   margin-bottom: 10px; /* 각 버튼의 하단 여백을 10px로 설정 */
   border: 1px solid #ccc;
   cursor: pointer;
}

#register {
    display: block; /* 블록 레벨 요소로 표시하여 중앙 정렬 적용 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    width: 200px; /* 원하는 너비로 설정 */
    margin-bottom: 10px; /* 각 버튼의 하단 여백을 10px로 설정 */
    border: 1px solid #ccc;
    cursor: pointer;
}
</style>

</head>
<body>


 <section id="login">
  <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h2>비밀번호 검색</h2>
      </div>
      <div class="card-body">
       <form action="./PasswordSearch.me" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
     

         <div class="form-group">
          <label for="user_id"><i class="fas fa-user-check mr-sm-1"></i>아이디</label>
          <input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디" required>
         </div>
         <div class="form-group">
          <label for="user_email"><i class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
          <input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일" required>
         </div>         
         <button type="submit" id="register" class="btn btn-info btn-block">
          비밀번호 찾기
         </button>
       
       
       </form>
      </div>
     </div>
    </div>
    <div class="col-9 mx-auto py-3 mb-3">
     <div>      
      <span>
       <button type="button" class="btn btn-outline-success" onclick="location.href='./IdSearchView.me'">
        <i class="fas fa-user-check mr-sm-1"></i>아이디 찾기
       </button>
      </span>

      <span>
       <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsertView.me'">
        <i class="fas fa-user-plus mr-sm-1"></i>회원 가입
       </button>
       
       <button type="button" class="btn btn-outline-info" onclick="location.href='./LoginView.me'">
        <i class="fas fa-user-plus mr-sm-1"></i>로그인
       </button>
       
      </span>
     </div>
    </div>
   </div>
  </div>
 </section>


</body>
</html>