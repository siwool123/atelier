<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
var cName, cValue;
var setCookie = function(name, value, exp){
    var date = new Date();
    console.log("1970-01-01부터 지금까지의 밀리초 : "+date.getTime());
    date.setTime(date.getTime()+exp*24*60*60*1000);
    console.log("유효시간", date.toUTCString());
    document.cookie = name+"="+value+";expires="+date.toUTCString()+";path =/";
};
var getCookie = function(name){
    var values = document.cookie.split(";");
    for(var i=0; i<values.length; i++){
        var value = values[i].trim().split("=");
        if(value[0]==name){
            return unescape(value[1]);
        }
    }
    return null;
};
function mCookie(cName, cValue){
    // var cName = document.getElementById("cName").value;
    // var cValue = document.getElementById("cValue").value;
    setCookie(cName, cValue, 1);
    alert("쿠키가 생성되었습니다.");
    location.reload();
}
function rCookie(){
    var cName = document.getElementById("cName").value;
    if(getCookie(cName)==null){ alert("해당 이름으로 생성된 쿠키가 없습니다.");}
    else { alert("쿠키값 : "+getCookie(cName)); }
}
function dCookie(){
    var cName = document.getElementById("cName").value;
    var cValue = document.getElementById("cValue").value;
    setCookie(cName, cValue, -2);
    alert("쿠키가 삭제되었습니다.");
    location.reload();
}
function closeWin(){ mCookie("popupWin", "off1");}
onload = function(){
    var popupWinValue = getCookie("popupWin");
    if(popupWinValue=="off1") document.getElementById("popupWin").style.display = "none";
    else document.getElementById("popupWin").style.display = "block";
}
</script>
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
			<label style="line-height:50px; padding-left:10px;"> 
			<input name="saveid" id="saveid" type="checkbox" onclick="saveid('${user_id}');"> 아이디저장</label>
			
			<div class="form-floating mt-3 mb-3">
				<input type="password" class="form-control" id="user_pwd" placeholder="Enter password" name="my_pass">
				<label for="user_pwd">비밀번호</label>
			</div>	
			<%-- <div th:if="${param.error}" class="alert alert-danger">메일 혹은 비밀번호를 다시 확인해 주세요.</div> --%>
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
