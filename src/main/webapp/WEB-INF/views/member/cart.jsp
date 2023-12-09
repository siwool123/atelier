<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
 	
});
function deletepidx(pidx) {
	var fm = document.delFrm;
    if (confirm("정말로 장바구니에서 삭제하시겠습니까?")) {
    	fm.pidx.value = pidx;
        fm.method = "post";
        fm.action = "member/delete";
        fm.submit();
        if('${result}'==1) {alert('장바구니에서 삭제되었습니다.');}
        else {alert('장바구니에서 삭제실패');}
    }
}
</script> 
<style>
.leftmenu li:nth-child(1) a, .leftmenu li:nth-child(1) a i {background-color: black; color: white;}
@media (max-width: 600px) {
}
</style>
</head>
<body>
<form name="delFrm" id="delFrm" ><input type="hidden" name="pidx" /></form>
<%@ include file="./member/index.jsp" %>
<%-- <c:set var="user_id" value="
<sec:authorize access="isAuthenticated()"><sec:authentication property="name"/></sec:authorize>
"></c:set>  <div>${user_id } 님 로그인을 환영합니다.</div> --%>
    <div class="container">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        <div class="col-sm-10 pl-5">
			<div class="headerL2">장바구니 ${not empty plist ? plist.size() : "0" }</div>
			<table class="table table-hover">
			   <thead class="table-secondary">
			     <tr align="center">
			       <th width="10%">${not empty plist ? plist.size() : "0" }</th>
			       <th><input type="checkbox" id="ckall" /></th>
			       <th>ARTWORK TITLE</th>
			       <th>PRICE (원)</th>
			       <th>삭제</th>
			       <th>배송비</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty plist }">
				<tr><td colspan="6" align="center">등록된 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ plist }" var="row" varStatus="loop">
					     <tr>
					       <td>${ loop.index + 1 }</td>
					       <td>
						       <c:choose>
						       	<c:when test="${ row.sold==1 }">""</c:when>
						       	<c:otherwise><input type="checkbox" name="chk" /></c:otherwise>
						       </c:choose>
					       </td>
					       <td><a href="view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" />
					       
					       	<b> ${ row.title }</b><br/>  ${row.m_name }</a></td>
					       <td>
					       	 <c:choose>
						       	<c:when test="${ row.sold==1 }"><div class="fw-bolder" style="color:grey;">● SOLD</div></c:when>
						       	<c:otherwise><div class="price fw-bolder">${row.price }</div></c:otherwise>
						       </c:choose>
					       </td>
					       <td><a class="btn1" href="javascript:deletepidx(${ row.pidx });">삭제</a></td>
					       <td>무료배송</td>
					     </tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
				<tr>
					<td colspan="2" align="right">선택한 작품 <span id="tnum">0</span> 개 <i class="bi bi-chevron-right"></i></td>
					<td align="center">작품합계  <span class="tprice">0</span> +  배송비 0 <i class="bi bi-chevron-right"></i></td>
					<td colspan="3" >총 결제 금액 :  <b class="tprice" style="color:#AF0000">0</b> 원</td>
				</tr>
			   </tbody>
			</table>
			
			<ul>
				<li>● 아래의 내용을 정확하게 작성 후 구매하기 버튼을 눌러 주세요.</li>
				<li>● 무통장입금의 경우 구매 후 1영업일 (24시간) 이내에 구매금액을 입금해 주세요.</li>
				<li>● 24시간 이내 입금이 되지 않을시 자동으로 구매취소처리됩니다.</li>
				<li>● 입금계좌 : KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</li>
				<li>● 결제완료 후 작품 포장 및 배송이 이루어집니다. (최대 5 영업일 소요)</li>
			</ul>
			
			
        </div>
    </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
 
 