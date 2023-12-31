<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 에이잭스 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
//이미지 선택시 바로 이미지 띄우기
function loadImage(img) {
	
	//이미지 용량 제한
	let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
	let fileSize = img.files[0].size; //업로드한 파일용량
	
	if(fileSize > maxSize){
		alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
		$(img).val(''); //업로드한 파일 제거
		return; 
	}
	
    var file = img.files[0];	//선택된 파일 가져오기
    //폼태그 변수 선언
    var profileImageForm = document.getElementById("profileImageForm");
    //기존 showImageDiv div태그를 삭제후 다시 만든다(이미지 두번 선택 방지)
   	document.getElementById("showImageDiv").remove();
    //img태그가 담길 div 태그 새로 만들기
    var showImageDiv = document.createElement("div");
    //새로 만든 div 태그에 id 부여
    showImageDiv.id='showImageDiv';
    //form 태그에 div태그 추가(prepend)
    profileImageForm.prepend(showImageDiv);
    
    //새로운 img 태그 만들기
	var selectedProfileImage = document.createElement("img");
    //이미지 source 가져오기
	selectedProfileImage.src = URL.createObjectURL(file);
    //이미지 크기 조정
	selectedProfileImage.style.width = "30%"
    //이미지를 showImageDiv div에 추가
	showImageDiv.appendChild(selectedProfileImage);
}

$(function() {
	$('#useImage').click(function() {
		var form = $('#profileImageForm')[0];
		var formData = new FormData(form);
		console.log(formData);
		$.ajax({
			type: 'post',
			url: '/member/profileUpload.do',
			data : formData,
			enctype: 'multipart/form-data',
			contentType : false,
			processData : false, 
			success : function(rdata0){
				console.log(rdata0);
				//window.opener.document.getElementById("mypageProfileImage").src = "/uploads/"+savedFileName;
				self.close();
				opener.location.reload();
			}, //성공시호출할 콜백함수
			error : function(errD){console.log(errD.status+" : "+errD.statusText);}
		});	
	});
});
</script>
</head>
<body>

	<div class="m-5 p-5">
	<form name="fileForm" id="profileImageForm" >
		<div id="showImageDiv"></div>
		<input class="form-control" type="file" name="profileImage" onChange="loadImage(this);"/>
		<p style="color: red;">* 파일첨부 사이즈는 4MB 이내로 가능합니다.</p>
		<button class="btn" type="button" id="useImage" value="이미지 사용하기" >이미지 사용하기</button>
	</form>
	</div>
</body>
</html>