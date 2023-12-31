<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제이쿼리 -->
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
.leftmenu li a i { padding-top: 7px !important; }
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
#applyImg1,
#applyImg2,
#applyImg3,
#applyImg4,
#applyImg5,
#applyImg6,
#applyImg7,
#applyImg8,
#applyImg9,
#applyImg10 {
	max-width: 100px;
	max-height: 100px;
}
.headerL2 {margin-top: 10px !important;}
</style>

<script>
	//이미지 선택시 바로 이미지 띄우기
	function loadApplyImg(img) {
		/* 파일용량 제한*/
		let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
		let fileSize = img.files[0].size; //업로드한 파일용량
		
		if(fileSize > maxSize){
			alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
			$(img).val(''); //업로드한 파일 제거
			return; 
		}
		
		//선택된 파일 가져오기
	    var file = img.files[0];
		/*이미지 태그 name 값 마지막 부분(숫자로 되어있음)을 잘라 num이라는 변수로 선언한다.
		이하 div태그 들에도 num을 붙여 뷰에서 foreach로 생성한 엘리먼트들에 각각 대응한다.*/ 
		let num;
		if(img.name.slice(-1) != 0) {
			num = img.name.slice(-1);
		} else if (img.name.slice(-1) == 0) {
			num = img.name.slice(-2);
		}
		
	    //기존 showImageDiv div태그를 삭제후 다시 만든다(이미지 두번 선택 방지)
	   	document.getElementById("showImageDiv"+num).remove();
	    //img태그가 담길 div 태그 새로 만들기
	    var showImageDiv = document.createElement("div");
	    //새로 만든 div 태그에 id 부여
	    showImageDiv.id='showImageDiv'+num;
	    //div(fordiv) 태그에 div(showImageDiv) 태그 추가(prepend)
	    document.getElementById('forDiv'+num).prepend(showImageDiv);
	    
	    //새로운 img 태그 만들기
		var selectedApplyImage = document.createElement("img");
	    //이미지 source 가져오기
		selectedApplyImage.src = URL.createObjectURL(file);
	    //이미지 크기 조정
		selectedApplyImage.setAttribute('style', 'max-width: 100px; max-height: 100px;');
	    //이미지를 showImageDiv에 추가
		showImageDiv.appendChild(selectedApplyImage);
	    
	}
	
	function applyValidate(form) {
		//작가 소개 글자수 검증
		if(form.a_intro.value.length<80 || form.a_intro.value.length>800) {
			alert('작가 소개는 80자 이상, 800자 이내로 작성해주세요.');
			form.a_intro.focus(); return false;
		}
		//작가 약력 글자수 검증
		if(form.a_history.value.length<80 || form.a_intro.value.length>800) {
			alert('작가 약력은 80자 이상, 800자 이내로 작성해주세요.');
			form.a_history.focus(); return false;
		}
		// 이미지 10개 검증
		for(var i=1; i<=10; i++) {
			if(form['inputApply'+i].value == '') {
				alert('작품 이미지는 10개를 첨부해야 합니다.');
				return false;
			}
		}
		return "/member/apply.do";
	}
	
	$(function(){
		$('textarea[name=a_intro]').keyup(function(){
			$('#ta_count').html($(this).val().length);
			if($(this).val().length>800){
				alert("작가 소개는 800자 이내로 입력해주세요.");
				$(this).val($(this).val().substring(0,800));
				$('#ta_count').html("800");
				$(this).focus(); 
			}
		});
		$('textarea[name=a_history]').keyup(function(){
			$('#ta_count_2').html($(this).val().length);
			if($(this).val().length>800){
				alert("작가 약력은 800자 이내로 입력해주세요.");
				$(this).val($(this).val().substring(0,800));
				$('#ta_count_2').html("800");
				$(this).focus(); 
			}
		});
	});
	
	function gotoApply() {
		if(${apresult} == 0) {
			alert('작가신청을 완료해주세요.');
			document.getElementById('sell-tab').setAttribute("class", "nav-link active");
			document.getElementById('auction-tab').setAttribute("class", "nav-link");
		} else {
			location.href="/member/applyResult";
		}
	}
</script>

<%@ include file="index.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
			
			<ul class="nav nav-tabs" style="width: 201px; float: right;">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="sell-tab" data-bs-toggle="tab" data-bs-target="#sellP" type="button" role="tab" aria-controls="sell" aria-selected="true" onClick="location.href='/member/apply'">
						작가 신청
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="auction-tab" data-bs-toggle="tab" data-bs-target="#auctionP" type="button" role="tab" aria-controls="sell" aria-selected="false" onClick="location.href='/member/applyResult'">
						작가 신청 결과
					</button>
				</li>
			</ul>
			
			<div class="headerL2 mb-5" style="margin-top:10px;">작가신청</div>
			<p>심사용 포트폴리오 작품 이미지를 10개를 첨부하고 작가소개 및 약력을 작성하셔야 작가신청이 가능합니다.</p>
			<p>작가소개 및 약력은 작가의 작품을 판매용으로 등록시 적용되오니 신중하게 작성하시기 바랍니다.</p>
			
			<form name="applyForm" id="applyForm" onSubmit="return applyValidate(this);" action="/member/apply.do" enctype="multipart/form-data" method="post">
				<p class="mt-5"><b>작가소개</b>&nbsp;&nbsp;&nbsp;<span id="ta_count">0</span><span class="count"> / 800 (80자 이상 800자 이내)</span></p>
				<textarea class="form-control" name="a_intro" id="a_intro" rows="10"
					placeholder="작가성향이나 작품성향과 작품의 주된 주제 등에 대해 80자 이상 800자 이내로 작성해주세요."></textarea>
				<p class="mt-5"><b>작가약력</b>&nbsp;&nbsp;&nbsp;<span id="ta_count_2">0</span><span class="count"> / 800 (80자 이상 800자 이내)</span></p>
				<textarea class="form-control" rows="10" id="a_history" name="a_history"
					placeholder="학력, 개인전, 단체전, 공모전 관련 약력을 80자 이상 800자 이내로 작성해주세요."></textarea>
				<p class="pt-5" style="color: red;">* 파일첨부 사이즈는 4MB 이내로 가능합니다.</p>
				<div class="row mx-auto text-center">
					<c:forEach begin="0" end="9" step="1" varStatus="loop">
					<div class="my-4 col-4 mx-auto" style="width: 210px; height: 120px; display: inline-block;">
						<input type="file" id= "inputApply${loop.index+1}" name="inputApply${loop.index+1}"
							onChange="loadApplyImg(this);" style="position: absolute; width: 0; height: 0; padding: 0; overflow: hidden; border: 0;" />
						<label class="my-2 btn1" for="inputApply${loop.index+1}" style="width: 50px; height: 50px; display: inline-block; vertical-align: middle;cursor: pointer;">+</label>
						<div class="ms-3" id="forDiv${loop.index+1}" style="max-width: 100px; max-height: 100px; display: inline-block;">
							<div id="showImageDiv${loop.index+1}" style="max-width: 100px; max-height: 100px;"></div>
						</div>
					</div>
					<!-- <input class="upload-name col-1" value="첨부파일" placeholder="첨부파일" style="display: inline-block;height: 40px; padding: 0 10px; vertical-align: middle; border: 1px solid #dddddd; width: 78%; color: #999999;" readonly> -->
					</c:forEach>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-dark my-5">작가신청</button>
				</div>
			</form>
		</div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
		