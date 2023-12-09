<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script>
$(function () {
	$('#navbarNavAltMarkup div a:last').addClass( 'active' );
	//인증번호 발송 버튼 클릭시
	$("#findPassNumBtn").click(function(){
		$.ajax({
			type: "POST",
			url: "/rest/findPass",
			data: {
				id : $("#findPassId").val(),
			},
			dataType: 'json',
			
			success: function(findPassMap) {
				if(findPassMap.findPassIdSuc == "0") {
					$("#findPassId").attr("class", "form-control is-invalid");
				} else if(findPassMap.findPassIdSuc == "1") {
					console.log("아이디 조회 성공 data : "+findPassMap);
					$("#findPassId").attr("class", "form-control is-valid");
					$("#findPassId").attr("readonly", true);
				}
			}
		})
	})
	//확인 버튼 클릭시
	$("#infdPassCheckBtn").click(function(){
		$.ajax({
			type: "POST",
			url: "/rest/findPassCheck",
			data: {
				id : $("#findPassId").val(),
				FindPassNum : $("#userFindPassNum").val(),
			},
			dataType: 'json',
			success: function(findPassCheckMap) {
				console.log("비교성공. checkSuc : "+findPassCheckMap.findPassCheckSuc);
				if(findPassCheckMap.findPassCheckSuc == "0") {
					$("#passNumInvalidFeedback").text("인증번호가 일치하지 않습니다.");
					$("#userFindPassNum").attr("class", "form-control is-invalid");
				} else if(findPassCheckMap.findPassCheckSuc == "1") {
					console.log("인증 data : "+findPassCheckMap);
					$("#findPassPass").attr("class", "text-center");
					$("#findPassLogBtn").attr("class", "text-center");
					$("#userFindPassNum").attr("readonly", true);
					$("#userFindPassNum").attr("class", "form-control is-valid");
					$('#suc1').attr('class', 'text-center text-primary');
					$('#idAndPass').html(
								findPassCheckMap.m_name+"님의 비밀번호는 <br/>"+findPassCheckMap.pass+"<br/>입니다."
							);
				} else if(findPassCheckMap.findPassCheckSuc == "-1"){
					$("#userFindPassNum").attr("class", "form-control is-invalid");
					$("#passNumInvalidFeedback").text("인증번호를 발송해주세요.");
				} else if(findPassCheckMap.findPassCheckSuc == "-2"){
					$("#userFindPassNum").attr("class", "form-control is-invalid");
					$("#passNumInvalidFeedback").text("인증번호를 입력해주세요.");
				} else if(findPassCheckMap.findPassCheckSuc == "-3"){
					$("#userFindPassNum").attr("class", "form-control is-invalid");
					$("#passNumInvalidFeedback").text("인증번호가 일치하지 않습니다.");
				}
			}
		})
	})
	
})
/* 참고용
<tr id="suc1" class="text-center text-primary d-none"> */
</script>
<style>
.btn-outline-danger {float:right !important;}
input {width:90%;}
</style>
</head>
<body>
<%@include file="../include/header.jsp"%>
	<div class="container mx-auto m-5 p-5 text-center d-grid mx-auto">
					<h2 class="fw-bolder p-3" id="findPassTitle">비밀번호 찾기</h2>
					<p>가입시 등록하신 이메일을 입력해 주세요.</p>
					<!-- <p class="mx-auto">이메일로 비밀번호 재설정 링크가 발송됩니다.</p> -->
				
					<table class="table table-borderless m-5 mx-auto" novalidate style="width:600px;" >
					<colgroup><col width=70%><col width=30%></colgroup>
						<tr>
							<td>
							<input type="hidden" id="findPassSubject" value="atelier 비밀번호 찾기 인증번호 입니다." />
							<input type="email" class="form-control" name="findPassId" id="findPassId" placeholder="EMAIL">
							<div class="valid-feedback">인증번호가 발송되었습니다.</div><div class="invalid-feedback">가입된 아이디가 없습니다.</div></td>
							<td><button id="findPassNumBtn" class="btn btn-outline-danger">인증번호 발송</button></td>
						</tr>
						<tr>
							<td><input type="text" id="userFindPassNum" class="form-control" placeholder="수신이메일 내 인증번호를 입력하세요.">
							<div id="passNumInvalidFeedback" class="invalid-feedback">인증번호가 일치하지 않습니다.</div></td>
							<td><button id="infdPassCheckBtn" class="btn btn-outline-danger">인증번호 확인</button></td>
						</tr>
						<tr id="findPassPass" class="d-none text-center">
							<td colspan="2" id="idAndPass"></td>
						</tr>
						<tr id="findPassLogBtn" class="d-none text-center">
							<td colspan="2"><button type="button" id="findPassLogBtn" class="btn btn-outline-danger" onClick="location.href='login'">로그인 하기</button></td>
						</tr>
					</table>
		</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>