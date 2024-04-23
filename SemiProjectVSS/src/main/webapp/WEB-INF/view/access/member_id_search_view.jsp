<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 확인</title>

<script src="./js/jquery.cookie.js" type="text/javascript"></script>
<script src="./js/cookie_login.js" type="text/javascript"></script>

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
        <div class="links">
            <a href="LoginView.me">로그인</a>
        </div>
    </div>

 <section id="login">
  <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h4>아이디 찾기 결과</h4>
      </div>
      <div class="card-body">
       <div class="row  pt-3 pb-1 justify-content-center">
        <div class="col col-sm-8 text_strong text-center">검색한 아이디의 정보입니다.</div>
       </div>
       <div class="row pb-1 justify-content-center">
        <div class="col-10 col-sm-8">
         <hr class="list_hr">
        </div>
       </div>
      
      <c:choose>
       <c:when test="${!empty user_id}">
        <div class="row pb-1 justify-content-center">
        <p class="text-success"> 찾으시는 아이디는
         <b class="text-info">${user_id}</b>
        입니다. </p>
         
        </div>
       </c:when>
       <c:otherwise>
       <div class="row pb-1 justify-content-center">
       <p class="text-danger"> 찾으시는 아이디가 존재하지 않습니다. </p>
        
        </div>
       </c:otherwise>
      </c:choose>
       <div class="row pb-1 justify-content-center">
        <div class="col-10 col-sm-8">
         <hr class="base_hr">
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div class="col-9 mx-auto py-3 mb-3">
    <div>
     <span>
      <button type="button" class="btn btn-outline-warning" onclick="location.href='./PasswordSearchView.me'">
       <i class="fas fa-user-lock mr-sm-1"></i>
       비밀번호 찾기
      </button>
      </span>
      
      <span>
      <button type="button" class="btn btn-outline-info" onclick="location.href='./IdSearchView.me'">
       <i class="fas fa-user-lock mr-sm-1"></i>
       다시 시도
      </button>
     </span>
     
     <span>
      <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsertView.me'">
       <i class="fas fa-user-plus mr-sm-1"></i>
       회원 가입
      </button>
     </span>
    </div>
   </div>
  </div>
 </section>


</body>
</html>