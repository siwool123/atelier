<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="m-5">
	<h2>로그인 폼</h2>
	<div style="width:600px;" class="border border-2 border-success rounded p-5">
	<!-- 로그인한아이디 없다면 로그인폼 표시 > 매개변수에 error가 있다면 에러메세지표시 -->	
	<c:if test="${empty user_id }" var="loginResult">
		<c:if test="${param.error != null}">
		<p>
			Login Error! <br />
			${errorMsg}
		</p>
		</c:if>
		<!-- 시큐리티 설정파일에 지정된 요청명으로 action 속성값기술 -->
		<form action="/loginAction" method="post">
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="user_id" placeholder="Enter email" name="my_id">
				<label for="user_id">아이디</label>
			</div>	
			<div class="form-floating mt-3 mb-3">
				<input type="password" class="form-control" id="user_pwd" placeholder="Enter password" name="my_pass">
				<label for="user_pwd">비밀번호</label>
			</div>	
			<div class="d-grid"><button type="submit" class="btn btn-primary btn-block">Submit</button></div>
		</form>
	</c:if>
	<!-- 로그인되었을때 출력되는 부분. 로그인아이디와 로그아웃버튼 출력 -->
	<c:if test="${not loginResult }">
		 ${user_id } 님, 좋은 아침입니다. <br />
		<a href="/">Root</a>
		<a href="/logout">Logout</a>	
	</c:if>	
	</div>
</body>
</html>
