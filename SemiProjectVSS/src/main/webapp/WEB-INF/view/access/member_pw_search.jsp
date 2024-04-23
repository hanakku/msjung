<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
</head>
<body>


 <section id="login">
  <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h4>비밀번호 검색</h4>
      </div>
      <div class="card-body">
       <form action="./PasswordSearch.me" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
        <fieldset>
         <div class="form-group">
          <label for="user_id"><i class="fas fa-user-check mr-sm-1"></i>ID</label>
          <input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디" required>
         </div>
         <div class="form-group">
          <label for="user_email"><i class="fas fa-envelope-open mr-sm-1"></i>이메일</label>
          <input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일" required>
         </div>         
         <button type="submit" id="register" class="btn btn-info btn-block">
          비밀번호 찾기
         </button>
        </fieldset>
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
      </span>
     </div>
    </div>
   </div>
  </div>
 </section>


</body>
</html>