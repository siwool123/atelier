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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="/js/atelier.js"></script>

<script>

function delReview(pidx) {
	if(confirm('리뷰작성으로 적립된 10,000 포인트가 차감됩니다. \n 정말로 리뷰를 삭제하시겠습니까?')) { 
 	
   $.ajax({
        type: 'POST',
        url: '/member/delReview',  // 실제 서버 엔드포인트로 수정
        data: { pidx: pidx },
        success: function (response) {
            if (response==4) { 
            	$(`#cartItem_${pidx}`).remove();
            	alert('리뷰가 삭제되었습니다.');
            	location.reload();
            } else { alert('리뷰 삭제 실패');}
        },
        error: function () { alert('리뷰 삭제 중 오류가 발생했습니다.'); }
    });
	} 
}
</script>

<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(5) {background-color: black;}
.leftmenu li:nth-child(5) a, .leftmenu li:nth-child(5) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
.img1 {max-width:60px; max-height:60px;}
.bpc1 {position:relative !important; top:-20px !important;}
.circle {font-size:6px; color:grey; margin-right:10px;}
.btn5 {padding:5px; background:red ; color:white;}
#search {padding:5px 10px; background:black ; color:white;}
.btn7 {padding:5px; background:black ; color:white; margin-top:5px;}
.btn8 {padding:10px 20px; background:black ; color:white; margin-top:20px;}

.btn1 {padding:0 14px !important; margin-right:10px; display:inline; float:left;}
.btn6 {padding: 5px; border: 1px solid grey;}
.table1 tr th, .table1 tr td {vertical-align:middle; padding:15px 0; }
button.nav-link {padding:10px 20px;}
input[type="text"], input[type="date"] { border:none; border-bottom:1px solid grey !important; height:40px; margin-left:10px; }
input[type="file"] {width:0; height:0}
.param input {width:150px;}
.bi-calendar3 {position: relative; right: 35px;}
div.toggle {background:#ededed; transition: opacity 0.5s ease;}

label.btn1 {width: 50px; height: 50px; vertical-align: middle; cursor: pointer; margin-right:150px;}
#thumb1, #thumb2, #thumb3 {max-width: 100px; max-height: 100px;}
i.bi-star-fill {font-size:20px;}
span.count {position: relative; top: -30px; float: right; right: 15px;}
.img2 {max-width:200px; max-height:200px; margin-right:15px; cursor:pointer;}
.plike {color:red; }
.btn100 {position:relative; top:10px;}
.modal {--bs-modal-width: 96% !important}
.d-block {height:800px;}
.next, .prev {font-size:50px; color:black;}
.carousel-control-next, .carousel-control-prev {width:6% !important;}
.bi-zoom-in {opacity:0.5; position:relative; left: 110px; font-size: 30px; }
.notice {background: #ededed;}
.notice li {line-height:40px;}
</style>
</head>
<body>
<%@ include file="index.jsp" %>
    <div class="container" style="margin-bottom:80px;">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-3" style="margin-top:10px;">포인트 </div>
			
			<div class="param my-5" >총 사용 가능 포인트 <b class="price2 ms-5"> ${not empty total ? total : '0' }</b> P </div>
			
			 <table class="table table-hover table1">
			   <thead class="table-secondary">
			     <tr align="center">
			       <th>구분</th>
			       <th>포인트</th>
			       <th>사용내용</th>
			       <th>주문번호</th>
			       <th>사용일시</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty polist }">
				<tr><td colspan="8" align="center">주문한 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ polist }" var="row" varStatus="loop">
				       <c:choose>
				       	<c:when test="${not empty row.ridx and row.ridx>0 }">
				       		<tr><td align="center" style="color:blue">적립</td>
				       		<td align="right" style="color:blue">+ <span class="price2"> ${not empty row.add_point? row.add_point : '0' }</span> </td>
				       		<td align="left" style="padding-left:50px;">리뷰작성 포인트 적립<br /><span style="color:#c0c0c0">${row.title }  |  ${row.m_name }</span></td><td></td>
				       		<td align="center">${not empty row.point_date ? row.point_date : ''}</td></tr>
				       	</c:when>
				       	<c:otherwise>
				       	<c:if test="${row.add_point>0 }">
				       		<tr><td align="center" style="color:blue">적립</td>
				       		<td align="right" style="color:blue">+ <span class="price2"> ${not empty row.add_point? row.add_point : '0' }</span> </td>
				       		<td align="left" style="padding-left:50px;">주문 적립<br /><span style="color:#c0c0c0">${row.title }  |  ${row.m_name }</span></td>
				       		<td align="center" >${not empty row.oidx? row.oidx : '' }</td><td align="center" >${not empty row.point_date ? row.point_date : ''}</td> </tr>
				       	</c:if>	
				       	<c:if test="${row.minus_point>0 }">
				       		<tr><td align="center" style="color:red">사용</td><td align="right" style="color:red">- <span class="price2"> ${not empty row.minus_point? row.minus_point : '0' }</span> </td>
				       		<td align="left" style="padding-left:50px;">포인트 결제<br /><span style="color:#c0c0c0">${row.title }  |  ${row.m_name }</span></td>
				       		<td align="center" >${not empty row.oidx? row.oidx : '' }</td><td align="center" >${not empty row.point_date ? row.point_date : ''}</td> </tr>
				       	</c:if>
				       	</c:otherwise>
				       </c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			   </tbody>
			</table>        
			
			<ul class="notice" style="padding:20px 40px; margin-top:80px;">
				<h5 class="fw-bolder text-center mx-auto my-3">이용안내</h5>
				<li><span class="circle">●</span>10,000P 이상부터 구매금액 제한 없이 사용하실 수 있습니다. </li>
				<li><span class="circle">●</span>입찰 삭제, 거래 취소 시 사용한 포인트는 환불됩니다.</li>
				<li><span class="circle">●</span>먼저 적립된 포인트부터 순서대로 사용되며, 사용하지 않으실 경우 유효기간이 지나면 자동 소멸됩니다. </li>
				<li><span class="circle">●</span>유효기간이 지난 후 환불받은 포인트는 다시 사용하실 수 없습니다.</li>
				<li><span class="circle">●</span>포인트 유효기간은 적립일로부터 1년 입니다. </li>
			</ul>
        </div>
    </div>
    </div>
 <%@ include file="../include/footer.jsp" %>   
 
 
</body>
</html>