<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty sessionScope.id}">
<script type="text/javascript">
location.href="./LoginView.me"
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>회원 가입</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 300px;
	margin: 0 auto;
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
</style>

<script type="text/javascript">
$(function() {
 $("#limit").change(function() {
  location.href="./MemberSelect.me?limit="+$(this).val();
 });
 if ("${!empty limit}") {
  $("#limit").val("${limit}").prop('selected', true);
 };
});
</script>

</head>
<body>
 
<body>
 <nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
  <div class="container">
   
   <div id="toggle" class="navbar-collapse collapse">
    <ul class="navbar-nav">
    </ul>
    <ul class="navbar-nav ml-auto">
     <li class="nav-item dropdown mr-3">
      <c:if test="${!empty sessionScope.user_id}">
       <p class="nav-link dropdown-toggle" data-toggle="dropdown">
        <i class="fas fa-user mr-sm-1"></i>
        ${sessionScope.user_id} 님
       </p>
      </c:if>
      <div class="dropdown-menu">
       <c:choose>
   
         <a>기타</a>
 
       </c:choose>
      </div>
      <c:choose>
       <c:when test="${empty sessionScope.user_id}">
        <li class="nav-item">
         <a href="./LoginView.me" class="nav-link">
          <i class="fas fa-user-circle mr-sm-1"></i>
          로그인
         </a>
       </c:when>
       <c:otherwise>
        <li class="nav-item">
         <a href="./LoginView.me" class="nav-link">
          <i class="fas fa-user-times mr-sm-1"></i>
          로그아웃
         </a>
       </c:otherwise>
      </c:choose>
    </ul>
    <ul class="navbar-nav py-3 mb-3 pl-3 pr-3">
    <li> <a href="./index.jsp" class="navbar-brand">
    <i class="fa fa-home"></i>홈
   </a>    
   </li> 
    </ul>
   </div>
  </div>
 </nav> 
 <header id="main-header" class="py-2 bg-secondary"> </header>
 <section id="search" class="py-3 mb-3 bg-light">
  <div class="container">
   <div class="row col-md-12">   
    <div class="col-md-6 ml-auto">
     <form action="./MemberSearch.me" method="post" name="searchForm" id="signupForm" enctype="application/x-www-form-urlencoded" >
      <fieldset>
       <div class="input-group">
        <select name="limit" id="limit" class="form-control mr-sm-1">
         <option value="10">10명씩 보기
		<option value="20">20명씩 보기
        </select>        
        <input type="search" id="keyword" name="keyword" class="form-control mr-sm-1" placeholder="아이디 입력">
        <button class="btn btn-outline-success" type="submit">
         <i class="fas fa-search mr-sm-1"></i>검색
        </button>
       </div>
      </fieldset>
     </form>
    </div>
   </div>
  </div>
 </section>
 <section id="member">
  <div class="container">
   <div class="row">
    <div class="col-md-12">
     <div class="card">
      <div class="card-header">       
       <h3 class="text-muted"><i class="fas fa-users-cog mr-sm-1"></i>회원 목록</h3>
       <p align="right">
        전체 회원: ${memberCount}명
       </p>  
      
      </div>
      <table class="table table-bordered">
       <thead class="thead-light">
        <tr class="text-center">
         <th>번호</th>
         <th>아이디</th>         
         <th>이름</th>          
         <th>이메일</th>
         <th>나이</th>
         
         <th>생일</th>
         <th>가입일</th>
                
        </tr>
       </thead>
       <tbody>
       <c:choose>
    <c:when test="${listCount > 0}">
     <c:forEach var="arrayList" items="${arrayList}">
      <tr class="text-center">
       <td>${arrayList.num}</td>
       <td><a href="./MemberSelectDetail.me?id=${arrayList.user_id}">${arrayList.user_id}</a></td>           
         <td> 
         <c:set var="now" value="<%=new java.util.Date( )%>"/>
         <fmt:formatDate var="nowDay" value="${now}" type="date" pattern="yyyy-MM-dd"/>
<c:if test="${arrayList.user_reg_date == nowDay}">
         <span class="badge badge-danger mr-sm-1"> new </span> </c:if>
         
         ${arrayList.name}</td>          
           <td>${arrayList.user_email}</td>
            <td>${arrayList.user_age}</td>            
       <td>${arrayList.user_bdate}</td>
       <td>${arrayList.user_reg_date}</td>
    
      </tr>
     </c:forEach>    
    </c:when>
    <c:otherwise>
     <tr><td colspan="8" align="center">등록된 회원이 없습니다.</td></tr> 
    </c:otherwise>
   </c:choose>        
       </tbody>
      </table>      
      <nav class="ml-4">
      <ul class="pagination justify-content-center">      
      <c:choose>
  <c:when test="${page <= 1}">
  <li class="page-item disabled">
         <a class="page-link">이전</a>
        </li>
  </c:when>
  <c:otherwise>   
   <li class="page-item">
         <a href="./MemberSelect.me?page=${page-1}&limit=${limit}" class="page-link">이전</a>
        </li>
  </c:otherwise>
 </c:choose> 
 <c:forEach var="start" begin="${startpage}" end="${endpage}" step="1">
  <c:choose>
   <c:when test="${start==page}">
    <li class="page-item active">
         <a class="page-link">${start}</a>
        </li>   
  </c:when>
   <c:otherwise>      
    <li class="page-item">
         <a href="./MemberSelect.me?page=${start}&limit=${limit}" class="page-link">${start}</a>
        </li>    
   </c:otherwise>
  </c:choose>
 </c:forEach> 
 <c:choose>
  <c:when test="${page >= maxpage}">
  <li class="page-item">
         <a class="page-link"> 다음 </a>
        </li>
        </c:when>
  <c:otherwise>
   <a href="./MemberSelect.me?page=${page+1}&limit=${limit}">
   <li class="page-item">
         <a href="./MemberSelect.me?page=${page+1}&limit=${limit}" class="page-link"> 다음 </a>
        </li>   
   </a>
  </c:otherwise>
 </c:choose>
 </ul>
      
      </nav>
      <nav class="navbar justify-content-end">
       <div class="btn-group">
        <button type="button" class="btn btn-outline-info mr-sm-1" onclick="location.href='./MemberInsertView.me'">
         <i class="fas fa-user-edit mr-sm-1"></i>회원 등록
        </button>
       </div>
      </nav>
     </div>
    </div>
   </div>
  </div>
 </section>
 

</body>
</body>
</html>