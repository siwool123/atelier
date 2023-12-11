<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.border li {line-height:50px; }
.table-borderless tr {height:50px; }
.table-borderless tr th {background-color:#ededed;}
</style>
<script>
$( document ).ready( function() {
	$('#price').html(numberWithCommas($('#price').text()));
});
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container mx-auto text-center m-5 p-5">
	<h3 class="mx-auto fw-bolder mb-5"> ${ not empty resultMsg ? resultMsg : "주문결과 없음" } </h3>
	<table class="table-borderless mx-auto my-5">
		<tr>
			<th>주문번호</th>
			<td>${not empty odto and not empty odto.oidx ? odto.oidx : "정보없음" }</td>
		</tr>
		<tr>
			<th>결제금액</th>
			<td><b class="price2" id="price" > ${not empty odto ? odto.price : "정보없음" }</b> 원</td>
		</tr>
		<tr>
			<th>결제수단</th>
			<td>
			
			<c:choose>
			<c:when test="${not empty odto and not empty odto.paymethod and odto.paymethod.equals('bank') }">
			무통장입금
			</c:when>
			<c:when test="${not empty odto and not empty odto.paymethod and odto.paymethod.equals('kakao') }">
			카카오페이
			</c:when>
			<c:when test="${not empty odto and not empty odto.paymethod and odto.paymethod.equals('toss') }">
			토스페이먼츠
			</c:when>
			<c:otherwise>정보없음</c:otherwise>
			</c:choose>
			
			</td>
		</tr>
		
		<c:if test="${not empty odto and not empty odto.paymethod and odto.paymethod.equals('bank')}">
		<tr>
			<td colspan="2">
			<ul class="border my-5 mx-auto" style="padding:20px 40px; text-align: left; width: 600px ">
				<li>● 무통장입금의 경우 구매 후 1영업일 (24시간) 이내에 구매금액을 입금해 주세요.</li>
				<li style="color:#AF0000">● 24시간 이내 입금이 되지 않을시 자동으로 구매취소처리됩니다.</li>
				<li>● 입금계좌 : <span style="color:#AF0000"> KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</span></li>
				<li>● 결제완료 후 작품 포장 및 배송이 이루어집니다. (최대 5 영업일 소요)</li>
			</ul>
			</td>
		</tr>
		</c:if>
		
	</table>
	
	<a class="mx-auto btn1 p-3" href="/member/order" >주문내역 확인</a>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>