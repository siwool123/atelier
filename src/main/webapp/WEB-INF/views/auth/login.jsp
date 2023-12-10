<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script src="./js/atelier.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script>
$(document).ready( function() {
	$('#navbarNavAltMarkup div a:last').addClass( 'active' );
  });

var setCookie = function(name, value, exp){
    var date = new Date();
    date.setTime(date.getTime()+exp*24*60*60*1000);
    document.cookie = name+"="+value+";expires="+date.toUTCString()+";path =/";
};
var getCookie = function(name){
    var values = document.cookie.split(";");
    for(var i=0; i<values.length; i++){
        var value = values[i].trim().split("=");
        if(value[0]==name){ return unescape(value[1]);}
    }
    return null;
};

function rCookie(){
    if(getCookie("saveid")==null){ alert("해당 이름으로 생성된 쿠키가 없습니다.");}
    else { alert("쿠키값 : "+getCookie("saveid")); }
}  

function saveId(){ 
	 var saveid2 = document.getElementById("saveid");
	 var user_id2 = document.getElementById("user_id");
	 
	 if(saveid2.checked) {
		 setCookie("saveid", user_id2.value, 1);
		//alert("쿠키가 생성되었습니다.");
		//location.reload();
		 user_id2.value = userid;
	 }else {
		 var user_id2 = document.getElementById("user_id");
		 setCookie("saveid", user_id2.value, -2);
		//alert("쿠키가 삭제되었습니다.");
	 }
	 
}
onload = function(){
    var saveidval = getCookie("saveid");
    var saveid2 = document.getElementById("saveid");
    var user_id2 = document.getElementById("user_id");
    
    if(saveidval!=null) {
    	saveid2.checked = true;
    	user_id2.value = saveidval;
    } else {
    	saveid2.checked = false;
    	setCookie("saveid", user_id2.value, -2);
    }
    
    document.querySelector('#navbarNavAltMarkup div a:last').classList.add('active');
    
}
</script>
<style>
@media (max-width: 600px) {
  .loginbox {width:100% !important;}
}	
.leftmenu li:nth-child(1) {background-color: black;}
.leftmenu li:nth-child(1) a, .leftmenu li:nth-child(1) a i {color:white}
input, button {font-size:14px !important;}
button {padding:10px !important;}
#agreeCheck {margin-right:10px;}
.btn-outline-secondary {width:100% !important; float:left;}
.btn-outline-danger {padding:10px; width:45% }
#user_id, #user_pwd {height:50px !important;}
#navbarNavAltMarkup div.navbar-nav a.nav-link:last {padding-bottom:17px !important; border-bottom: 3px solid black !important; }
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container mx-auto m-5 p-5 text-center">
<div class="row">
	<div class="col-sm-2"><%@ include file="../include/loginSidebar.jsp" %></div>
	<div class="col-sm-10">
	
	<div style="width:600px;" class="loginbox mx-auto">
	<!-- 로그인한아이디 없다면 로그인폼 표시 > 매개변수에 error가 있다면 에러메세지표시 -->	
	<c:if test="${empty user_id }" var="loginResult">
		<c:if test="${param.error != null}">
		<p>Login Error! <br />${errorMsg}</p>
		</c:if>
		<!-- 시큐리티 설정파일에 지정된 요청명으로 action 속성값기술 -->
		<form action="/loginAction" method="post">
		<h3 class="mx-auto pb-5 fw-bolder">로그인</h3>
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="user_id" placeholder="Enter email" name="my_id">
				<label for="user_id">아이디</label>
			</div>	
		<div class="my-3 pb-5">	<label style="padding-left:10px; float:left;"> 
			<input name="saveid" id="saveid" type="checkbox" onclick="saveId();"> 아이디저장</label> <a href="guest/resetPass" style="float:right;">임시 비밀번호 받기</a> </div>
			
			<div class="form-floating my-5">
				<input type="password" class="form-control" id="user_pwd" placeholder="Enter password" name="my_pass">
				<label for="user_pwd">비밀번호</label>
			</div>	
			<%-- <div th:if="${param.error}" class="alert alert-danger">메일 혹은 비밀번호를 다시 확인해 주세요.</div> --%>
			<div class="d-grid mt-5"><button type="submit" class="btn btn-primary btn-block">LOGIN</button></div>
		</form>
	</c:if>
	<!-- 로그인되었을때 출력되는 부분. 로그인아이디와 로그아웃버튼 출력 -->
	<c:if test="${not loginResult }">
		 ${user_id } 님, 좋은 아침입니다. <br />
		<a href="/">Root</a>
		<a href="/logout">Logout</a>	
	</c:if>	
	</div>
	
	</div>
</div>
</div>	
<%@ include file="../include/footer.jsp" %>

</body>
</html>
