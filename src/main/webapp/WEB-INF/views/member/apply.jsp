<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
.leftmenu li:nth-child(6) {background-color: black;}
.leftmenu li:nth-child(6) a, .leftmenu li:nth-child(7) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
#artistTd {border: 1px dotted black;}
</style>

<script>
	//이미지 선택시 바로 이미지 띄우기
	function loadApplyImage(img) {
	    var file = img.files[0];	//선택된 파일 가져오기
	    //폼태그 변수 선언
	    var applyImageForm = document.getElementById("applyImageForm");
	    //기존 showImageDiv div태그를 삭제후 다시 만든다(이미지 두번 선택 방지)
	   	document.getElementById("showImageDiv").remove();
	    //img태그가 담길 div 태그 새로 만들기
	    var showImageDiv = document.createElement("div");
	    //새로 만든 div 태그에 id 부여
	    showImageDiv.id='showImageDiv';
	    //form 태그에 div태그 추가(prepend)
	    document.getElementById('forDiv').prepend(showImageDiv);
	    //새로운 img 태그 만들기
		var selectedApplyImage = document.createElement("img");
	    //이미지 source 가져오기
		selectedApplyImage.src = URL.createObjectURL(file);
	    //이미지 크기 조정
		selectedApplyImage.style.width = "30%";
	    //이미지를 showImageDiv div에 추가
		showImageDiv.appendChild(selectedApplyImage);
	}
</script>

<%@ include file="index.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
			
			<div class="headerL2 mb-5" style="margin-top:10px;">작가신청</div>
			<p>심사용 포트폴리오 작품 이미지를 10개를 첨부하고 작가소개 및 약력을 작성하셔야 작가신청이 가능합니다.</p>
			<p>작가소개 및 약력은 작가의 작품을 판매용으로 등록시 적용되오니 신중하게 작성하시기 바랍니다.</p>
			<p>작가 신청 후 심사결과는 <spna style="color: red;">마이페이지 > 작가신청</spna> 에서 확인할 수 있습니다.</p>
			
			<form name="applyImageForm" id="applyImageForm" action="/apllyImage.do" method="post">
				<p class="mt-5">작가소개</p>
				<textarea class="form-control" rows="10" id="artistIntro"
					placeholder="작가성향이나 작품성향과 작품의 주된 주제 등에 대해 80자 이상 800자 이내로 작성해주세요."></textarea>
				<p class="mt-5">작가약력</p>
				<textarea class="form-control" rows="10" id="artistIntro"
					placeholder="학력, 개인전, 단체전, 공모전 관련 약력을 80자 이상 800자 이내로 작성해주세요."></textarea>
				<div class="row mt-5">
					<div class="col-9">
						<div class="d-grid gap-2 mx-auto col-1" id="forDiv">
							<c:forEach begin="0" end="9" step="1">
								<button type="button" class="btn btn-outline-secondary">+</button>
								<input class="form-control" type="file" name="applyImage"
									onChange="loadApplyImage(this);" />
							</c:forEach>
						</div>
					</div>
					<div class="col-3 text-end">
						<button type="button" class="btn btn-dark">작가신청</button>
					</div>
				</div>
			</form>
		</div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
		