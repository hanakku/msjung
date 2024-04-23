<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 상세 조회</title>

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
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
    width: 100px; /* 첫 번째 열의 너비 설정 */
}

.table td:first-child i {
    margin-right: 5px;
}

</style>

<script type="text/javascript">
   function memberDelete() {
    if (confirm("${memberDTO.user_name}님 회원 탈퇴 하시겠습니까?")) {
       location.href = "./MemberDelete.me?user_id=${memberDTO.user_id}"
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
                    <div class="card-header"> <h3 class="text-muted">
                            <i class="fas fa-user-tag mr-sm-1"></i>내 회원 정보
                        </h3>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><i class="fas fa-user-check mr-sm-1"></i> 아이디</td>
                                    <td>${memberDTO.user_id}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-user-plus mr-sm-1"></i> 이름</td>
                                    <td>${memberDTO.user_name}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-unlock-alt mr-sm-1"></i> 비밀번호</td>
                                    <td>${memberDTO.user_pw}</td>  
                                </tr>
                                <tr>
                                    <td><i class="fas fa-envelope-open mr-sm-1"></i> 이메일</td>
                                    <td>${memberDTO.user_email}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-user-clock mr-sm-1"></i> 나이</td>
                                    <td>${memberDTO.user_age}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-birthday-cake mr-sm-1"></i> 생일</td>
                                    <td>${memberDTO.user_bdate}</td>
                                </tr>
                                <tr>
                                    <td><i class="fas fa-birthday-cake mr-sm-1"></i>전화번호</td>
                                    <td>${memberDTO.user_phone_num}</td>
                                </tr>
                                <tr>
                                    <td><i class="fa fa-calendar mr-sm-1"></i> 가입일</td>
                                    <td>${memberDTO.user_reg_date}</td>
                                </tr>  
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   
   <div class="links">
      <a href="./MemberUpdate.me?user_id=${memberDTO.user_id}"
         class="btn btn-outline-secondary mr-sm-1"> <i
         class="fas fa-user-tag mr-sm-1"></i>정보 수정
      </a>
      <a href="#" class="btn btn-outline-danger mr-sm-1"
         onclick="memberDelete()"> <i class="fas fa-user-times mr-sm-1"></i>회원탈퇴</a>
    
      <a href="./LoginHome.me" class="btn btn-outline-danger mr-sm-1">
      <i class="fas fa-user-times mr-sm-1"></i>홈으로</a>

   </div> 
    
</section>
</body>

</body>
</html>