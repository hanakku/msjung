<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>

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

 <section id="login">
  <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h4>아이디 검색</h4>
      </div>
      <div class="card-body">
       <form action="./IdSearch.me" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
        <fieldset>
         <div class="form-group">
          <label for="user_name"><i class="fas fa-user mr-sm-1"></i>이름</label>
          <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름" required>
         </div>
         <div class="form-group">
          <label for="user_email"><i class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
          <input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일" required>
         </div>
         <button type="submit" id="register" class="btn btn-info btn-block">
          아이디 찾기
         </button>
        </fieldset>
       </form>
      </div>
     </div>
    </div>
    <div class="col-9 mx-auto py-3 mb-3">
     <div>
      
      <span>
       <button type="button" class="btn btn-outline-warning" onclick="location.href='./PasswordSearchView.me'">
        <i class="fas fa-user-lock mr-sm-1"></i>비밀번호 찾기
       </button>
      </span>     
      <span>
       <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsertView.me'">
        <i class="fas fa-user-plus mr-sm-1"></i>회원 가입
       </button>
      </span>
     </div>
    </div>
   </div>
  </div>
 </section>


</body>
</html>