<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기 결과</title>

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
</style>

</head>
<body>



 <section id="login">
  <div class="container">
   <div class="row">
    <div class="col-9 mx-auto">
     <div class="card">
      <div class="card-header">
       <h2>비밀번호 찾기 결과</h2>
      </div>
      <div class="card-body">
      

       <div class="row pb-1 justify-content-center">
        <div class="col-10 col-sm-8">
         <hr class="list_hr">
        </div>
       </div>
      
      <c:choose>
       <c:when test="${!empty user_pw}">
        <div class="row pb-1 justify-content-center">
        <p class="text-success"> 찾으시는 비밀번호는
         <b class="text-info">${user_pw}</b>
        입니다. </p>
         
        </div>
       </c:when>
       <c:otherwise>
       <div class="row pb-1 justify-content-center">
       <p class="text-danger"> 찾으시는 비밀번호가 존재하지 않습니다. </p>
        
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
      <button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsertView.me'">
       <i class="fas fa-user-plus mr-sm-1"></i>
       회원 가입
      </button>
      
      <span>
      <button type="button" class="btn btn-outline-info" onclick="location.href='./LoginView.me'">
       <i class="fas fa-user-lock mr-sm-1"></i>
       로그인
      </button>
     </span>
          
     </span>
    </div>
   </div>
  </div>
 </section>

</body>
</html>