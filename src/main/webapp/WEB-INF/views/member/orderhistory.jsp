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

let key = "${param.key}";
if(key === "userinfo"){  $("#myreview-tab, #myreview, #userinfo-tab, #userinfo").toggleClass("active");
}else if(key === "myreview"){ $("#userinfo-tab, #myreview-tab, #userinfo, #myreview").toggleClass("active");  }
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
.btn7 {padding:5px; background:black ; color:white; margin-top:5px;}
.btn8 {padding:10px 20px; background:black ; color:white; margin-top:20px;}

.btn1 {padding:0 14px !important; margin-right:10px; display:inline; float:left;}
.btn6 {padding: 5px; border: 1px solid grey;}
.table1 tr th {vertical-align:middle; font-weight: normal;}
.table1 tr td {padding:20px 10px;}
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
</style>
</head>
<body>
<%@ include file="index.jsp" %>
    <div class="container" style="margin-bottom:80px;">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-5" style="margin-top:10px;">주문내역 ${not empty oplist ? oplist.size() : "0" }</div>
			
	  <!-- 탭 메뉴 -->
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab" data-bs-target="#userinfo" type="button" role="tab" 
          aria-controls="userinfo" aria-selected="true">주문내역 조회 ${not empty oplist ? oplist.size() : "0" }</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="myreview-tab" data-bs-toggle="tab" data-bs-target="#myreview" type="button" role="tab"
            aria-controls="myreview" aria-selected="false">취소/반품 내역 0</button>
        </li>
      </ul>
      
      <!-- 내용 -->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="userinfo" role="tabpanel" aria-labelledby="userinfo-tab">

			<ul class="border my-5" style="padding:20px 40px;">
				<li><span class="circle">●</span>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다. </li>
				<li><span class="circle">●</span>작품 포장 등으로 인하여 결제완료 후 배송까지 7일 이내가 소요됩니다.</li>
				<li><span class="circle">●</span>발송 전에만 주문취소가 가능합니다. </li>
				<li><span class="circle">●</span>아뜰리에에서 판매중인 작품은 모두 실제 원화로, 동일한 재고가 없어 교환이 불가능한 점 양해 부탁드립니다.</li>
				<li><span class="circle">●</span>실제 상품이 온라인 상의 내용과 다른 경우, 작품에 하자가 있거나 운송중 파손이 발생한 경우, 반품이 가능합니다. </li>
				<li><span class="circle">●</span>택배를 이용하여 아뜰리에 측으로 반품해 주시면 됩니다. 단순변심에 따른 반품은 불가합니다.</li>
			</ul>
			<div class="mt-5 param" style="height:80px;">
				<a href="?status=aa" class="btn1" id="aa">입금확인전</a> 
				<a href="?status=bb" class="btn1" id="bb">배송준비중</a> 
				<a href="?status=cc" class="btn1" id="cc">발송완료</a> 
				<form action="" style="display:inline; float:right">
				<input type="date" name="dmin" id="datepicker1"><!-- <i class="bi bi-calendar3"></i> --> ~ 
				<input type="date" name="dmax" id="datepicker2"> <!-- <i class="bi bi-calendar3"></i> -->
                <input type="text" name="sWord" style="width: 150px;" placeholder="작가 또는 작품명 검색" />
                <button type="submit" id="search"> 검색 <i class="bi bi-search fs-5"></i></button>
                </form>
			</div>
			
			 <table class="table table-hover table1">
			   <thead class="table-secondary">
			     <tr align="center" style="height:40px">
			       <th width="10%">구분</th>
			       <th>주문일자<br/>주문번호</th>
			       <th colspan="2">작품정보</th>
			       <th>주문금액 (원)</th>
			       <th>주문상태</th>
			       <th>결제방식</th>
			       <th>취소/반품</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty oplist }">
				<tr><td colspan="8" align="center">주문한 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ oplist }" var="row" varStatus="loop">
					     <tr id="orderItem_${row.pidx}">
					       <td align="center">${ row.auction==0 ? '구매' : '<span style="color:red">낙찰</span>' }</td>
					       <td align="center">
					       		${row.orderdate } <br/>
						      <a href="oview?oidx=${row.oidx }" style="text-decoration: underline;">${row.oidx }</a> 
					       </td>
					       <td align="center"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</a></td>
					       	<td><a href="view?pidx=${ row.pidx }"><b > ${ row.title }</b><br/>  ${row.m_name } <br />
					       	${row.size1 } x ${row.size2 } cm					       	
					       	</a></td>
					       <td align="right"><span class="price2">${row.price }</span></td>
					       <td align="center" >
					       	 <c:choose>
						       	<c:when test="${ row.paydate==null and row.shipdate==null }"><span style="color:red;">입금확인전</span></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate==null }"><span style="color:red;">배송준비중</span></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate!=null }">
							       	<button class="btn6" onclick="trackWindow(${row.t_num});" >배송조회</button> <br />
							       	<c:choose>
							       		<c:when test="${not empty row.ridx and row.ridx > 0}"><a href="/member/reviewL" class="btn7" style="position: relative; top: 5px;" >리뷰확인</a></c:when>
							       		<c:otherwise><button class="btn7" id="showReview_${row.pidx }" onClick="reviewWindow(${row.pidx });" >리뷰작성</button></c:otherwise>
							       	</c:choose>
						       	
						       	</c:when>
						     </c:choose>
					       </td>
					       <td align="center" >
					       	  <c:choose>
						       	<c:when test="${ row.paymethod.equals('bank') }">무통장입금</c:when>
						       	<c:when test="${ row.paymethod.equals('kakaopay') }">카카오페이</c:when>
						       	<c:when test="${ row.paymethod.equals('tosspayments') }">토스페이먼츠</c:when>
						       	<c:when test="${ row.paymethod.equals('html5_inicis') }">신용카드</c:when>
						       </c:choose>
					       </td>
					       <td align="center">
					       <c:set var="currentDate" value="<%= LocalDate.now() %>" />
					       	  <c:choose>
					       	  	<c:when test="${ row.cancel==-1 }">취소완료</c:when>
						       	<c:when test="${ row.cancel != -1 and row.shipdate==null }"><button class="btn6">주문취소</button></c:when>
						       	<c:otherwise>
						       	<button class="btn6" disabled > 반품</button></c:otherwise>
						       </c:choose>
					       </td>
					     </tr>
					     
					</c:forEach>
				</c:otherwise>
			</c:choose>
			   </tbody>
			</table>    
        
        </div>
        <div class="tab-pane fade text-center p-5" id="myreview" role="tabpanel" aria-labelledby="myreview-tab">
        취소 및 반품 내역이 없습니다.
        
        
        </div>
      </div>
			
        </div>
    </div>
    </div>
<%@ include file="../include/footer.jsp" %>    
</body>
</html>