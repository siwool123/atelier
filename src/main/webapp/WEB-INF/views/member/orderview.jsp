<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>

<script>
  
function deletepidx(pidx) {
	if(confirm('정말로 삭제하시겠습니까?')) { 
 	
   $.ajax({
        type: 'POST',
        url: '/member/delCart',  // 실제 서버 엔드포인트로 수정
        data: { pidx: pidx },
        success: function (response) {
            if (response==1) { 
            	$(`#cartItem_${pidx}`).remove();
            	alert('장바구니에서 삭제되었습니다.');
            	location.reload();
            } else { alert('장바구니에서 삭제 실패');}
        },
        error: function () { alert('장바구니 삭제 중 오류가 발생했습니다.'); }
    });
	} 
}
</script>

<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(2) {background-color: black;}
.leftmenu li:nth-child(2) a, .leftmenu li:nth-child(2) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
.img1 {max-width:100px; max-height:100px;}
.bpc1 {position:relative !important; top:-20px !important;}
.circle {font-size:6px; color:grey; margin-right:10px;}
.btn5 {padding:5px; background:red ; color:white;}
#search {padding:5px 10px; background:black ; color:white;}

.btn1 {padding:0 14px !important; margin-right:10px; display:inline; float:left;}
.btn6 {padding: 5px; border: 1px solid grey;}
.table1 tr th {vertical-align:middle; font-weight: normal;}
.table1 tr td {padding:20px 10px;}
button.nav-link {padding:10px 20px;}
input[type="text"], input[type="date"] { border:none; border-bottom:1px solid grey !important; height:40px; margin-left:10px; }

.param input {width:150px;}
.bi-calendar3 {position: relative; right: 35px;}
/* border:none; border-bottom:1px solid #dddddd; height:36px; padding:10px; outline:none; background-color: white; border-radius: 0 !important; */
</style>
</head>
<body>
<%@ include file="index.jsp" %>
    <div class="container" style="margin-bottom:80px;">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-5" style="margin-top:10px; display:inline">주문상세내역 ${not empty oplist2 ? oplist2.size() : "0" } </div>
			 <span style="float:right; color:grey"> HOME > 마이페이지 > 주문내역 > 주문상세내역 </span>  
			
			<c:if test="${not empty odto and odto.paydate == null }">
			<ul class="border my-5" style="padding:20px 40px;">
				<li><span class="circle">●</span>결제대기/입금확인중</li>
				<li><span class="circle">●</span>입금계좌 : KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</li>
				<li><span class="circle">●</span>주문후 24시간 이내에 결제금액을 입금하지 않는 경우 주문취소처리됩니다.</li>
			</ul>
			</c:if>
			
			<div class="my-5 param" style="height:80px;">
				주문번호 : <b style="margin-right:40px;"> ${not empty odto ? odto.oidx : '' } </b>   주문일자 : <b>${not empty orderdate ? orderdate : '' }</b>
			</div>
			
			 <table class="table table-hover table1">
			   <thead class="table-secondary">
			     <tr align="center" style="height:40px">
			       <th>구분</th>
			       <th colspan="2">작품정보</th>
			       <th>포인트</th>
			       <th>주문금액 (원)</th>
			       <th>배송비</th>
			       <th>주문상태</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty oplist2 }">
				<tr><td colspan="7" align="center">주문한 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ oplist2 }" var="row" varStatus="loop">
					     <tr id="orderItem_${row.o2idx}">
					       <td align="center">${ row.auction==0 ? "구매" : "<span style='color:red'>낙찰</span>" }</td>
					       <td align="center"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</a></td>
					       	<td><a href="view?pidx=${ row.pidx }"><b > ${ row.title }</b><br/>  ${row.m_name }
					       		<br />${row.size1 } x ${row.size2 } cm
					       	</a></td>
					       <td align="center"><span class="price2">${row.add_point } P</span><br />
					       ${row.paydate==null ? '적립예정' : '적립완료' }
					       </td>
					       <td align="center">${row.price }</td>
					       <td align="center" >무료배송</td>
					       <td align="center">
					       	  <c:choose>
						       	<c:when test="${ row.paydate==null and row.shipdate==null }"><span style="color:red;">입금확인전</span></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate==null }"><span style="color:red;">배송준비중</span></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate!=null }">
						       	<button class="btn6">배송조회</button><br /> <button class="btn7">리뷰작성</button></c:when>
						       </c:choose>
					       </td>
					     </tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			   </tbody>
			</table>   
			
			<div class="row">
				<div class="col-sm-6">
					<div class="headerL2 mt-5 mb-3">배송지 정보</div>
					<table class="table-borderless">
						<tr>
							<th>이름</th>	<td>${not empty odto ? odto.receiver : '' }</td>
							<th>연락처</th>	<td>${not empty odto ? odto.r_phone : '' }</td>
							<th>배송지 주소</th>	<td>${not empty odto ? odto.r_address : '' }</td>
							<th>배송 메세지</th>	<td>${not empty odto ? odto.message : '' }</td>
						</tr>
					</table>
				<div class="col-sm-6">
					<div class="headerL2 mt-5 mb-3">결제 정보</div>
					<table class="table-borderless">
						<tr>
							<th>상품합계</th>	<td>${not empty odto ? odto.price+odto.minus_point : '0' }</td>
							<th>배송비 합계</th>	<td>무료배송</td>
							<th>포인트 할인</th>	<td>${not empty odto ? odto.minus_point : '0' }</td>
							<th>포인트 	${row.paydate==null ? ' 적립예정' : ' 적립완료' }
							</th>	<td>${not empty odto ? odto.add_point : '0' }</td>
							<th>최종결제금액</th>	<td>${not empty odto ? odto.price : '0' }</td>
							<th>결제수단</th>	<td>${not empty odto ? odto.paymethod : '' }</td>
						</tr>
					</table>
				</div>
			</div> 
        
        </div>
    </div>
    </div>
<%@ include file="../include/footer.jsp" %>
<c:set var="currentDate" value="<%= LocalDate.now() %>" />
</body>
</html>