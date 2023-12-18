<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="/js/atelier.js"></script>
<script>
function idUse(){
    //opener.document.registF.id.value = document.overlapF.retype_id.value;
    opener.location.reload();
    self.close();
}
</script>

<style type="text/css">
.border li {line-height:50px; }
.table-borderless tr {height:50px; }
.table-borderless tr th {background-color:#ededed;}
img {max-width:200px; margin-right:15px;}
</style>
<style>
table tr th, table tr td {padding:30px;}
</style>
</head>
<body>
<div class="container mx-auto text-center m-5 p-5">
	<h3 class="mx-auto fw-bolder mb-5"> ${ not empty rdto ? '리뷰 작성에 성공하였습니다.<br/>10,000 포인트가 적립되었습니다.' : '리뷰작성실패' } </h3>
	
	<div class="fw-bolder my-3">리뷰내용</div>
	<div class="m-5">${not empty rdto and not empty rdto.r_content ? rdto.r_content : "정보없음" }</div>
	<div class="text-center"> <img src="/uploads/${rdto.sfile1 }" alt="리뷰이미지1"  />
	<c:if test="${not empty rdto.sfile2 }"><img src="/uploads/${rdto.sfile2 }" alt="리뷰이미지2" /></c:if>
	<c:if test="${not empty rdto.sfile3 }"><img src="/uploads/${rdto.sfile3 }" alt="리뷰이미지3" /></c:if>
	</div>
	<div class="text-center m-5">작성하신 리뷰는 <b style="color:red">마이페이지 > 주문내역</b> 에서 확인 및 수정 하실 수 있습니다.</div>
	<button type="button" onclick="idUse();" class="btn1" style="padding:4px 30px;">닫기</button>
</div>
</body>
</html>