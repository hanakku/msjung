<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>

<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>

<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>

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

a:hover {
   text-decoration: underline;
}

a:active {
   text-decoration: underline;
}

.form-group {
    margin-bottom: 10px;
}

.form-group label {
    
    margin-bottom: 5px;
    color: #333;
}

.form-group input {
    width: calc(100% - 40px); /* 버튼 너비를 고려하여 입력 필드 너비 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

button[type="submit"], button[type="reset"], button[onclick="window.location.href='index.jsp'"] {
    width: 80px; /* 너비를 크게 설정 */
    height: 30px; /* 높이를 크게 설정 */
    background-color: green;
   color: white;
   text-decoration: none;
   border-radius: 5px;
   transition: background-color 0.3s ease;
   border: 1px solid #ccc;
   cursor: pointer;
}

</style>

<script type="text/javascript">
   $(function() {   
    $("#dbidCheck").click(function() {
       var user_id = $('#user_id').val();
       $.ajax({
        url : './IdCheck.me',
        type : 'get',
        data : {
           id : user_id
        },
        success : function(result) {
           console.log("아이디 값 - " + result);
           //alert(result);
           if ($.trim(result) == 1) {
              alert("이미 등록된 아이디입니다.");
              $("#user_id").focus();
           } else {
              alert("등록할 수 있는 아이디입니다.");
              $('#idCheck').val("1");
              $("#name").focus();
           }
        }
       });
    });
$("input[id='user_id']").on("change", function() {      
         $("#idCheck").val(0);    
      });   
 });
</script>

</head>
<body>

<div class="container" style="text-align: center;">
    <div style="max-width: 800px; display: inline-block; text-align: left;">
        <h1 style="text-align: center">회원 가입</h1>
        
        
        <form action="./MemberInsert.me" method="post" id="signupForm" class="" enctype="application/x-www-form-urlencoded">
      
            <div class="form-group row">
            <label for="user_id" class="col-4 col-form-label pr-0">
             <i class="fas fa-user-check mr-sm-1"></i>
             아이디
            </label>
            <div class="col-8 pl-0">       
               <input type="text" name="user_id" id="user_id" class="form-control">
              </div>
              <div class="pl-0">
               <button type="button" class="btn btn-outline-secondary" id="dbidCheck">중복체크</button>
               <input type="hidden" name="idCheck" id="idCheck">
              </div>
           </div>
            
            <div class="form-group">
                <label for="user_pw">비밀번호 *</label>
                <input type="password" id="user_pw" name="user_pw" required>
            </div>
            
            <div class="form-group">
                <label for="pwdre" class="col-4 col-form-label pr-0">
                <i class="fas fa-lock mr-sm-1"></i>         
                비밀번호 확인 *</label>
                <input type="password" id="pwdre" name="pwdre" required>
            </div>
            
            <div class="form-group">
                <label for="user_name">이름 *</label>
                <input type="text" id="user_name" name="user_name" required>
            </div>
            
            <div class="form-group">
                <label for="user_age">나이 *</label>
                <input type="number" id="user_age" name="user_age" required>
            </div>
            <div class="form-group">
                <label for="user_email">이메일 *</label>
                <input type="email" id="user_email" name="user_email" required>
            </div>
            <div class="form-group">
                <label for="user_nickname">닉네임</label>
                <input type="text" id="user_nickname" name="user_nickname">
            </div>
            <div class="form-group">
                <label for="user_bdate">생년월일 *</label >
                <input type="date" id="user_bdate" name="user_bdate" required>
            </div>
            <div class="form-group">
                <label for="user_phone_num">전화번호 *</label>
                <input type="tel" id="user_phone_num" name="user_phone_num" required>
            </div>
            
            <div class="form-group" style="text-align: left">
                <button type="submit">가입</button>
             <button type="reset">취소</button>
             <button onclick="window.location.href='index.jsp'">로그인</button>
            </div>           	
        </form>
      
    </div>
</div>

</body>
</html>