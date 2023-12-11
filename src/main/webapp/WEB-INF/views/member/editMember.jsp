<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 에이잭스 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!-- 레프트메뉴 등... -->
<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(1) {background-color: black;}
.leftmenu li:nth-child(1) a, .leftmenu li:nth-child(1) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
</style>

<script>
//다음 주소 찾기 api
function postOpen() {
	new daum.Postcode({
		oncomplete : function(data) {
			console.log(data);
			console.log(data.zonecode);
			console.log(data.address);

			let frm = document.updateForm;
			frm.zip.value = data.zonecode;
			frm.addr1.value = data.address;
			frm.addr2.focus();
		}
	}).open();
}

function uploadProfile() {
	var popupWidth = 600;
	var popupHeight = 320;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/editWindow', 'upload', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

function updateValidate(frm) {
	// 비밀번호 정규식 검증
	var newPass = document.getElementById('newPass').value;
	var pass = document.getElementById('pass').value;
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	if (passwordRegex.test(newPass)) {
		if (newPass != pass) {
			alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
			//입력상자로 포커싱 한다. 
			document.getElementById('newPass').focus();
			return false;
		}
	} else {
		alert("비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.");
		//입력상자로 포커싱 한다. 
		document.getElementById('newPass').focus();
		return false;
	}

	//이름 입력 확인
	if (frm.m_name.value == '') {
		alert('이름을 입력해 주세요');
		return false;
	}

	// 휴대전화 입력 확인
	if (frm.phone.value == '') {
		alert("휴대전화를 인증해주세요.");
		return false;
	}

	// 주소 입력 확인
	if (frm.zip.value == '') {
		alert("주소를 입력해 주세요.");
		return false;
	}

	if (frm.addr1.value == '') {
		alert("주소를 입력해 주세요.");
		return false;
	}

	if (frm.addr2.value == '') {
		alert("상세주소를 입력해 주세요.");
		return false;
	}

	if (frm.agreeCheck.checked == false) {
		alert("이용약관과 개인정보취급방침에 동의해주세요.");
		return false;
	}

	
	return "/member/edit.do";

}

//실시간 유효성 검증
$(function () {
	
	// 비밀번호 정규식 검증
	$("#newPass").keyup(function() {
		var newPass = document.getElementById('newPass').value;
		var pass = document.getElementById('pass').value;
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
		if (passwordRegex.test(newPass)) {
			$("#newPass").attr("class", "form-control is-valid");
			$("#pass").attr("disabled", false);
		} else {
			$("#newPass").attr("class", "form-control is-invalid");
			$("#pass").attr("disabled", true);
			$("#pass").attr("class", "form-control");
		}
	});
	
	//비밀번호 일치 검증
	$("#pass").keyup(function () {
        if ($("#pass").val() == $("#newPass").val()) {
			$("#newPass").attr("class", "form-control is-valid");
        	$("#pass").attr("class", "form-control is-valid");
			$("#newPassInvalidFeedback").text("비밀번호는 8~16자 길이로 영문자, 숫자 및 특수기호를 모두 포함해야 합니다.");
        } else {
        	$("#newPassInvalidFeedback").text("");
        	$("#newPass").attr("class", "form-control is-invalid");
			$("#pass").attr("class", "form-control is-invalid");
		}
    });
    
    // 이름 유효성 검사
    $('#m_name').keyup(function() {
    	var n_RegExp = /^[가-힣a-zA-Z]{2,15}$/;
    	var m_name = $('#m_name').val(); 
		if (n_RegExp.test(m_name)) {
			$("#m_name").attr("class", "form-control is-valid");
		} else {
			$("#m_name").attr("class", "form-control is-invalid");
		}
		
	})
});
</script>
<%@ include file="index.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
		
			<div class="headerL2" style="margin-top:10px;">정보수정</div>
			<div class="col-sm-6" style="padding-top:10px;">
				<table class="table table-borderless">
				<c:choose>
				<c:when test="${mdto.profiles != null }">
					<tr><td rowspan="3"><img src="/uploads/${mdto.profiles }" id="mypageProfileImage" class="me-4" style="border-radius: 50%; -moz-border-radius: 50%; -khtml-border-radius: 50%; -webkit-border-radius: 50%; width:100%; vertical-align: top; "/>
				</c:when>
				<c:when test="${mdto.profiles == null }">
					<tr><td rowspan="3"><img src="/images/noprofile.png" id="mypageProfileImage" class="me-4" style="border-radius: 50%; -moz-border-radius: 50%; -khtml-border-radius: 50%; -webkit-border-radius: 50%; width:100%; vertical-align: top; "/>
				</c:when>
				</c:choose>
					<td>id: ${mdto.id}</td></tr>
					<tr><td>
					<button type="button" class="btn btn-outline-secondary" style="display: inline" onClick="uploadProfile()">이미지 변경</button>
					<button type="button" class="btn btn-outline-secondary" style="display: inline">삭제</button></td></tr>
					<tr><td>가입일: ${mdto.regidate}</td></tr>
				</table>
				
			</div>
			<form name="updateForm" action="/member/edit.do" method="post" onsubmit="return updateValidate(this)" novalidate>
				<table class="table table-borderless" style="width: 80%;">
					<colgroup>
						<col width=25%>
						<col width=65%>
						<col width=10%>
					</colgroup>
					<tr>
						<td><input type="hidden" name="profiles" id="profiles" value="${mdto.profiles}"/></td>
					</tr>
					<tr>
						<td>비밀번호(6자 이상)</td>
						<td colspan="2"><input type="password" class="form-control" name="newPass" id="newPass"
						placeholder="PASSWORD (8자~16자, 영문자, 숫자 및 특수기호 포함)"/>
						<div id="newPassInvalidFeedback" class="invalid-feedback">비밀번호는 8~16자 길이로 영문자, 숫자 및 특수기호를 모두 포함해야 합니다.</div></td>
					</tr>
					<tr>
						<td>비밀번호 확인(6자 이상)</td>
						<td colspan="2"><input type="password" class="form-control" name="pass" id="pass"
						placeholder="PASSWORD 확인" disabled/>
						<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div></td>
					</tr>
					<tr>
						<td>회원명</td>
						<td colspan="2"><input type="text" class="form-control" name="m_name" id="m_name" value="${mdto.m_name }"/>
						<div class="invalid-feedback">이름은 2~15자 길이로 한글과 영문 대소문자만 허용됩니다.</div></td>
					</tr>
					<tr>
						<td>PHONE</td>
						<td colspan="2"><input type="text" class="form-control" name="phone" id="phone" value="${mdto.phone }"/></td>
					</tr>
					<tr>
						<td>기본배송지</td>
						<td>
							<input type="text" class="form-control" name="zip" id="zip" value="${mdto.zip }"/>
							<input type="text" class="form-control" name="addr1" id="addr1" value="${mdto.addr1 }"/>
							<input type="text" class="form-control" name="addr2" id="addr2" value="${mdto.addr2 }"/>
						</td>
						<td><button type="button" class="btn btn-outline-danger" onClick="postOpen();">검색</button></td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">
							<button type="button" class="btn btn-dark mx-auto" style="width: 45%;">회원탈퇴</button>
							<button type="submit" class="btn btn-danger mx-auto" style="width: 45%;">회원정보 변경</button>
						</td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>