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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container mx-auto text-center m-5 p-5">
	<c:if test="${ not empty result1 and result1==1 }"><div class="mx-auto"> 주문처리 1단계 성공</div></c:if>
	<ul>
	<c:if test="${ not empty resList }">
		<c:forEach items="${ resList }" var="row" varStatus="loop">
			<li>${ row ==1 ? row + ' : 주문처리 2단계 성공' : row + ' : 주문처리 2단계 실패' }</li>
		</c:forEach>
	</c:if>
	</ul>
	<h4 class="mx-auto py-5 fw-bolder">주문 처리 결과 : 
		<c:choose>
			<c:when test="${ not empty result1 and result1==1 and not empty resList }">성공
			<br />고객님의 주문이 정상적으로 완료되었습니다.
			</c:when>
			<c:otherwise>실패
			<br />고객님의 주문 처리에 실패하였습니다.
			</c:otherwise>
		</c:choose>
	</h4>
	<ul class="mx-auto">
	<li> 주문번호 : ${not empty odto ? odto.oidx ? "정보없음" }</li>
	<li>결제수단 : ${not empty odto ? odto.paymethod ? "정보없음" }</li>
	<c:if test="${not empty odto and odto.paymethod.equals("bank") }">
		<ul class="border my-5" style="padding:20px 40px;">
			<li>● 무통장입금의 경우 구매 후 1영업일 (24시간) 이내에 구매금액을 입금해 주세요.</li>
			<li style="color:#AF0000">● 24시간 이내 입금이 되지 않을시 자동으로 구매취소처리됩니다.</li>
			<li>● 입금계좌 : <span style="color:#AF0000"> KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</span></li>
			<li>● 결제완료 후 작품 포장 및 배송이 이루어집니다. (최대 5 영업일 소요)</li>
		</ul>
	</c:if>
	<li>결제금액 : ${not empty odto ? odto.price ? "정보없음" }</li>	
	</ul>
	<a class="mx-auto" href="/member/order" >주문내역 확인하기</a>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>