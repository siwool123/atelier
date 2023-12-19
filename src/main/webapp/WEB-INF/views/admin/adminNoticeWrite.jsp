<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier_Admin</title>

<link href="../css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
<link href="../css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<style>
.no-gutters {padding:0 10px !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                
                	<div id="accordion">
				    	<h3>마크다운 편집기가 처음이신가요?</h3>
				    	<div>
				    		<p>다음 내용을 따라오세요.<br><br><strong>목차입니다.</strong></p>
				    		<ol>
				    			<li>문단 제목</li>
				    			<li>굵은 글씨</li>
				    			<li>기울이기</li>
				    			<li>취소선</li>
				    			<li>수평 가로선 생성</li>
				    			<li>인용문</li>
				    			<li>순서 없는 목차</li>
				    			<li>순서 있는 목차</li>
				    		</ol>
				    	</div>
				    </div>
                	
					<div id="editor"></div>
                </div>
    </div>
    <!-- End of Page Wrapper --><!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button><a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.easing.min.js"></script>
<%-- <script src="../js/sb-admin-2.min.js"></script> --%>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/datatables-demo.js"></script>
<script type="text/javascript">
const editor = new toastui.Editor({
	el: document.querySelector('#editor'),
	previewStyle: 'vertical',
	previewHighlight: false,
	height: '500px',
	initialValue: '# 안녕하세요. 제목입니다.\n### 사전입력 테스트\n본문본문본문\n\n',
	hooks: {
    	addImageBlobHook: (blob, callback) => {
    		// blob : Java Script 파일 객체
    		//console.log(blob);
    		const formData = new FormData();
        	formData.append('image', blob);
        	let url = '/images/';
   			$.ajax({
           		type: 'POST',
           		enctype: 'multipart/form-data',
           		url: '/writeTest.do',
           		data: formData,
           		dataType: 'json',
           		processData: false,
           		contentType: false,
           		cache: false,
           		timeout: 600000,
           		success: function(data) {
           			//console.log('ajax 이미지 업로드 성공');
           			url += data.filename;
           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
        			// 형식 : ![대체 텍스트](주소)
           			callback(url, '사진 대체 텍스트 입력');
           		},
           		error: function(e) {
           			//console.log('ajax 이미지 업로드 실패');
           			//console.log(e.abort([statusText]));
           			callback('image_load_fail', '사진 대체 텍스트 입력');
           		}
           	});
    	}
    }
});
$(function() {
	$('#accordion').accordion({
		// jQuery UI accordion 본문 축소기능 활성화
		collapsible: true,
		active: false
	});
});
</script>