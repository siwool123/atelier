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
.leftmenu li:nth-child(7) {background-color: black;}
.leftmenu li:nth-child(7) a, .leftmenu li:nth-child(7) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
#imgmask {border-radius: 50%; width: 100px; height:100px; overflow:hidden; }
#mypageProfileImage {width: 100px; vertical-align: top; }
.modal {--bs-modal-width: 80% !important}
</style>

<script>
//다음 주소 찾기 api


function uploadProfile() {
	var popupWidth = 600;
	var popupHeight = 320;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/editWindow', 'upload', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}



function leave() {
	console.log('1');
	let leaveConfirmCheckbox = document.getElementById('leaveConfirmCheckbox');
	console.log(leaveConfirmCheckbox.checked);
	if (leaveConfirmCheckbox.checked) {
		location.href ='/member/leave.do';
		alert('ARTELIER 회원탈퇴가 완료되었습니다.');
	} else {
		if (document.getElementById('leaveInvalid') != null) {
		} else {
			var leaveInvalid = document.createElement('p');
			leaveInvalid.id = 'leaveInvalid';
			leaveInvalid.innerText += '내용 확인 동의를 먼저 체크해주세요.';
			leaveInvalid.setAttribute('style', 'color: red;');
			document.getElementById('leaveBtnDiv').prepend(leaveInvalid);
		}
	}
}


function leaveCheck() {
	if (document.getElementById('leaveConfirmCheckbox').checked) {
		document.getElementById('leaveInvalid').remove();
	}
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
					<tr><td rowspan="3" id="imgmaskTd"><p id="imgmask">
					<img src="/uploads/${mdto.profiles }" id="mypageProfileImage" class="me-4"></p>
				</c:when>
				<c:when test="${mdto.profiles == null }">
					<tr><td rowspan="3"><i class="bi bi-person-circle bpc1" style="position: relative; top: -1;"></i>
				</c:when>
				</c:choose>
					</td><td>id: ${mdto.id}</td></tr>
					<tr><td>
					<button type="button" class="btn btn-outline-secondary" style="display: inline" onClick="uploadProfile()">이미지 변경</button>
				<c:choose>	
				<c:when test="${mdto.profiles != null }">
					<button type="button" class="btn btn-outline-secondary" style="display: inline" id="profileDeleteBtn">삭제</button>
				</c:when>
				<c:when test="${mdto.profiles == '' }">
					<button type="button" class="btn btn-outline-secondary" style="display: inline" id="profileDeleteBtn" disabled>삭제</button>
				</c:when>
				</c:choose>
					</td></tr>
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
					<%-- <tr>
						<td><input type="hidden" name="profiles" id="profiles" value="${mdto.profiles}"/></td>
					</tr> --%>
					<tr>
						<td>비밀번호</td>
						<td colspan="2"><input type="password" class="form-control" name="newPass" id="newPass"
						placeholder="PASSWORD (8자~16자, 영문자, 숫자 및 특수기호 포함)"/>
						<div id="newPassInvalidFeedback" class="invalid-feedback">비밀번호는 8~16자 길이로 영문자, 숫자 및 특수기호를 모두 포함해야 합니다.</div></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td colspan="2"><input type="password" class="form-control" name="pass" id="pass"
						placeholder="PASSWORD 확인" disabled/>
						<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
						<div class="valid-feedback">비밀번호가 일치합니다.</div></td>
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
					<tr style="height: 100px;">
						<td colspan="3" class="text-center">
							<button type="button" class="btn btn-dark mx-auto py-2" data-bs-toggle="modal" data-bs-target="#leaveConfirm"  style="width: 45%;">회원탈퇴</button>
							<button type="submit" class="btn btn-danger mx-auto py-2" style="width: 45%;">회원정보 변경</button>
							
						</td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
</div>

<div class="modal" id="leaveConfirm">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title fw-bolder p-1">ARTELIER 회원탈퇴 신청</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      
      <div class="modal-body p-3" id="modalBody" style="padding: 30px;"> 
		<p style="color: red;">회원탈퇴 시 개인정보 및 ATELIER 에서 만들어진 모든 데이터는 삭제됩니다.(단, 아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.)</p>
		<p>1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 : 5년</p>
		<p>2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년</p>
		<p>3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년</p>
		<p>4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년</p>
		<p>5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간/3년</p>
		<p>6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제 2016-3호) (전자세금계산서 사용자에 한함) : 5년</p>
		<p>(단, (세금)계산서 내 개인식별번호는 3년 경과 후 파기)</p>
		<h5><strong>유의사항</strong></h5>
		<p>
		<ul>
			<li>회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다.</li>
			<li>탈퇴 후 동일 이메일 계정으로 재가입하는 것은 30일 동안 제한됩니다.</li>
			<li>그러므로 신중한 고려 후 탈퇴하시기기 바랍니다.</li>
		</ul>
		</p>
		<input type="hidden" name="leaveConfirmCheckbox" checked/>
		<input type="checkbox" class="form-check-input" id="leaveConfirmCheckbox" name="leaveConfirmCheckbox" onChange="leaveCheck()" style="border: 1px solid black; width: 20px; height: 20px;"/>
		<label class="form-check-label" for="leaveConfirmCheckbox">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</label>
		<div class="text-center" id="leaveBtnDiv">
			<button type="button" class="btn btn-dark mt-3" style="width : 30%; display: inline;" onClick="leave();">탈퇴신청</button>
			<button type="button" class="btn btn-secondary mt-3" style="width: 20%; display: inline;" data-bs-dismiss="modal" aria-label="Close">취소</button>
		</div>
      </div>
      
    </div>
  </div>
</div>

<script>
//실시간 유효성 검증
$(function () {
	
	//프로필 사진 삭제
	$("#profileDeleteBtn").click(function() {
		$.ajax({
			type: 'post',
			url: '/member/profileDelete.do',
			data : {
				src : document.getElementById('mypageProfileImage').src
			}
		}).done(function(deleteSuc) {
			if(deleteSuc == "1") {
				window.location.reload();
				//document.getElementById('imgmask').remove();
				//document.getElementById('imgmaskTd').html('<i class="bi bi-person-circle bpc1"></i>');
				//document.getElementById('profileDeleteBtn').disabled = true;
				
				//document.getElementById('indexImgmask').remove();
				//document.getElementById('indexDiv').html('<i class="bi bi-person-circle bpc1"></i>');
			}
			else {
				alter('이미지 삭제가 실패했습니다.');
			}
		})
	})
	
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
		console.log($("#newPass").val(), $(this).val());
        if ($(this).val() == $("#newPass").val()) {
			//$("#newPass").attr("class", "form-control is-valid");
        	//$(this).attr("class", "form-control is-valid");
			//$("#newPassInvalidFeedback").text("비밀번호는 8~16자 길이로 영문자, 숫자 및 특수기호를 모두 포함해야 합니다.");
        	$(this).removeClass("is-invalid").addClass("is-valid");
			console.log("비밀번호일치");
        } else {
        	//$("#newPassInvalidFeedback").text("");
        	//$("#newPass").attr("class", "form-control is-invalid");
			//$(this).attr("class", "form-control is-invalid");
			$(this).removeClass("is-valid").addClass("is-invalid");
			console.log("불일치");
			
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
</script>


<%@ include file="../include/footer.jsp" %>