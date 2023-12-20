<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="/js/atelier.js"></script>
<script>
$(document).ready(function(){
	$('.bi-star-fill').click(function() {
		  var n = $(this).index()+1;
		  $('.bi-star-fill').removeClass('starActive');
		  // Add 'active' class to the first n stars
		  for (var i = 1; i <= n; i++) {
		    $('.bi-star-fill:eq(' + (i - 1) + ')').addClass('starActive');
		  }
		  $('#starInput').val(n);
		});
 });

onload = function () {
    var url = location.href;
    console.log(url);
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    console.log(parameters[0]);//id=입력된값
    var returnValue = parameters[0].split('=')[1];
    $('#pidx').val(returnValue);
    console.log(returnValue);
}
function idUse() {
    //opener.document.registF.id.value = document.overlapF.retype_id.value;
    self.close();
}
function handleTA(spanId) {
	  var taCount = document.getElementById(spanId);
	  var rContent = document.getElementById('rContent');
	    taCount.innerHTML = rContent.value.length;
	    if (rContent.value.length > 800) {
	      alert("내용을 800자 이내로 입력해주세요.");
	      rContent.value = rContent.value.substring(0, 800);
	      taCount.innerHTML = "800";
	      rContent.focus();
	    }
	}
	
function submitReview(fm) {
	  if (fm.rContent.value === '' || fm.rContent.value.length < 20) {
	    alert('리뷰내용을 20자 이상 작성해주세요.');
	    fm.rContent.focus(); return false;
	  }

	  if (fm.star.value < 1 ) {  alert('별점을 1점 이상 매겨주세요');  return false; }

	  // 첨부 이미지 확인
	  var hasImage = false;
	  document.querySelectorAll('input[name^="ofile"]').forEach(function (fileInput) {
	    if (fileInput.files.length > 0) {
	      hasImage = true; return false; // 이미지가 하나라도 있으면 반복문을 빠져나옴
	    }
	  });
	  if (!hasImage) {  alert('최소 한 개 이상의 이미지를 첨부해주세요.');  return false; }

	  if (!fm.agree.checked) {  alert('홍보 콘텐츠 사용에 동의해주세요.');  return false;
	  }

	  return "/member/reviewWrite.do";
	}

</script>
<style>
.border li {line-height:40px;}
input {margin-right:10px !important;}
.img1 {max-width:50px; max-height:50px;}
.bpc1 {position:relative !important; top:-20px !important;}
.circle {font-size:6px; color:grey; margin-right:10px;}
.btn5 {padding:5px; background:red ; color:white;}
#search {padding:5px 10px; background:black ; color:white;}
.btn7 {padding:5px; background:black ; color:white; margin-top:5px;}
.btn8 {padding:10px 20px; background:black ; color:white; margin-top:20px;}

.btn1 {padding:5px 14px !important; margin-right:10px; }
.btn6 {padding: 5px; border: 1px solid grey;}
.table1 tr th {vertical-align:middle; font-weight: normal;}
.table1 tr td {padding:20px 10px;}
button.nav-link {padding:10px 20px;}
input[type="text"], input[type="date"] { border:none; border-bottom:1px solid grey !important; height:40px; margin-left:10px; }
input[type="file"] {width:0; height:0}
.param input {width:150px;}
.bi-calendar3 {position: relative; right: 35px;}
div.toggle {background:#ededed; transition: opacity 0.5s ease;}

label.btn1 {width: 50px; height: 50px; vertical-align: middle; cursor: pointer; padding:0 20px !important}
#thumb1, #thumb2, #thumb3 {max-width: 100px; max-height: 100px;}
i.bi-star-fill {font-size:30px;}
i.bi-star-fill:hover {color:orange;}
span.count {position: relative; top: -30px; float: right; right: 15px;}
.ptotile div {display:inline; float:left; padding:6px 20px;}
.ptotile img {margin-right:20px;}
.text1 * {margin-right:50px;}
.img2 {max-width:200px; margin-right:15px;}
</style>
</head>
<div class="container p-5">

<c:if test="${not empty pdto }">
<div class="ptotile border p-1" style="height:60px;"><div>
      <c:choose>
      	<c:when test="${pdto.sfile.length()>40 }"><img class="img1" src="${pdto.sfile }" alt="작품이미지" /></c:when>
      	<c:otherwise><img src="./uploads/${pdto.sfile }" alt="작품이미지" /></c:otherwise>
      </c:choose></div>
	 <div style="line-height:40px"><b> ${ pdto.title }</b><span class="mx-5">  ${pdto.m_name }</span><span> ${pdto.size1 } x ${pdto.size2 } cm</span></div>
</div>	 
</c:if>

<div class="fs-4 text-center mx-auto my-5 fw-bolder pb-2 border-bottom" style="clear:both;"> 리뷰 수정하기</div>
<form action="/member/reviewE.do" name="reviewFm" id="reviewFm" method="post" 
	enctype="multipart/form-data" onSubmit="return submitReview(this);" >
   <input type="hidden" name="pidx" id="pidx" />
   <div class="mb-3" style="line-height:30px;">
   	<b>리뷰내용</b> (작품 구매 및 수령 후 한달안에 리뷰 작성시 10,000 포인트를 지급합니다. )
   	<span style="float:right; position: relative; top: -8px;"><span>별점을 매겨주세요.  </span>
   	<span>
    <c:forEach var="i" begin="1" end="${rdto.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
    <c:forEach var="i" begin="1" end="${5-rdto.star}"><i class="bi bi-star-fill"></i></c:forEach>
    </span>
    
   	<%-- <c:forEach var="i" begin="1" end="5">
   	<i class="bi bi-star-fill" id="star${i }" data-value="${i}"></i></c:forEach> </span> --%>
</div>
    	<input type="hidden" name="star" id="starInput" value="${rdto.star}" />
   	<textarea name="rContent" id="rContent" cols="30" rows="10" placeholder="20자 이상 800자 이내로 작성해주세요."
   	 class="form-control form-control-sm" style="padding:10px;" onkeyup="handleTA('ta_count');">
   	 ${rdto.r_content }
   	 </textarea> 
   	 <span class="count"> <span id="ta_count">${rdto.r_content.length() } </span> / 800</span><br />
   	 <div class="mb-5 images text-center">
   	 <div class="fw-bolder text-center mx-auto my-3">기존 첨부 이미지</div>
   	 <img src="/uploads/${rdto.sfile1 }" alt="리뷰이미지1" class="img2" />
   	 <input type="hidden" name="prevSfile1" value="${ rdto.sfile1 }" />
   	 <c:if test="${ not empty rdto.sfile2 }"> <img src="/uploads/${rdto.sfile2 }" alt="리뷰이미지2" class="img2" />
   	 <input type="hidden" name="prevSfile2" value="${ rdto.sfile2 }" /></c:if>
   	 <c:if test="${ not empty rdto.sfile3 }"> <img src="/uploads/${rdto.sfile3 }" alt="리뷰이미지3" class="img2" />
   	 <input type="hidden" name="prevSfile3" value="${ rdto.sfile3 }" /></c:if>
   	 </div>
   	<div class="text-center mb-4" style="color:red">첨부파일 용량 : 이미지 파일 3개까지. 파일 1개당 4M, 총 12M 까지 가능합니다. </div>
   	<div class="text-center mx-auto">
   	<c:forEach var="i" begin="1" end="3">
   	<input type="file" name="ofile${i }" id="ofile${i }" accept=".jpg, .png, .gif" onChange="loadApplyImage(this);" />
   	<label class="my-2 btn1" for="ofile${i }">+</label> <span id="showImg_${i}" style="max-width: 100px; max-height: 100px; margin-right:20px;"></span>
   	</c:forEach>
   	</div>
<div style="clear:both; margin-top:30px;" class="text-center"><input type="checkbox" name="agree" /> 작성된 후기는 아뜰리에 홍보 콘텐츠로 사용될 수 있습니다. (필수)</div>
<div class="text-center"><button class="btn8" id="reviewBtn" type="submit">리뷰수정</button>&nbsp;&nbsp;&nbsp;
<button class="btn8" onclick="idUse();" >닫기</button></div>
   </form>
</div>
</body>
</html>