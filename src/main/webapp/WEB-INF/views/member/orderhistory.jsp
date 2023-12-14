<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script type="text/javascript">

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
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.img1 {max-width:100px; max-height:100px;}
.bpc1 {position:relative !important; top:-20px !important;}
.circle {font-size:6px; color:grey; margin-right:10px;}
</style>
</head>
<body>
<c:set var="currentDate" value="<%= LocalDate.now() %>" />
<form name="delFrm" id="delFrm" ><input type="hidden" name="pidx" /></form>
<%@ include file="index.jsp" %>
    <div class="container">
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
			
			<table class="table table-hover">
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
				<tr><td colspan="6" align="center">주문한 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ oplist }" var="row" varStatus="loop">
					     <tr id="orderItem_${row.pidx}">
					       <td align="center" width="10%">${ row.auction==0 ? "구매" : "낙찰" }</td>
					       <td align="center" width="10%">
					       		${row.orderdate } <br/>
						      <a href="./oview?oidx=${row.oidx }">${row.oidx }</a> 
					       </td>
					       <td align="center" width="10%"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</a></td>
					       	<td><a href="view?pidx=${ row.pidx }"><b > ${ row.title }</b><br/>  ${row.m_name }</a></td>
					       <td><b class="price2">${row.price }</b></td>
					       <td width="20%" align="right" >
					       	 <c:choose>
						       	<c:when test="${ row.paydate==null }"><button type="button" class="btn5">입금확인전</button></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate==null }"><button type="button" class="btn5">배송준비중</button></c:when>
						       	<c:when test="${ row.paydate!=null and row.shipdate!=null }">
						       	<button type="button" class="btn1">배송조회</button><button type="button" class="btn6">리뷰작성</button></c:when>
						       </c:choose>
					       </td>
					       <td align="center" width="10%">${row.paymethod }
					       	  <c:choose>
						       	<c:when test="${ row.paymethod.equals('bank') }">무통장입금</c:when>
						       	<c:when test="${ row.paymethod.equals('kakaopay') }">카카오페이</c:when>
						       	<c:when test="${ row.paymethod.equals('tosspayments') }">토스페이먼츠</c:when>
						       	<c:when test="${ row.paymethod.equals('html5_inicis') }">신용카드</c:when>
						       </c:choose>
					       </td>
					       <td align="center" width="10%">
					       	  <c:choose>
						       	<c:when test="${ row.shipdate==null }"><button type="button" class="btn1">주문취소</button></c:when>
						       	<c:otherwise><button type="button" class="btn1" ${row.shipdate.toLocalDate().until(currentDate, ChronoUnit.DAYS) > 10 ? 'disabled' : ''} >반품</button></c:otherwise>
						       </c:choose>
					       </td>
					     </tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
				<tr style="height:50px;">
					<td colspan="3" align="right">선택한 작품 <span id="tnum">0</span> 개 <i class="bi bi-chevron-right"></i></td>
					<td colspan="2" align="center">작품합계  <span class="price2" id="tprice">0</span> +  배송비 0 <i class="bi bi-chevron-right"></i></td>
					<td colspan="2" >총 결제 금액 :  <b id="tprice2" class="price2" style="color:#AF0000">0</b> 원</td>
				</tr>
			   </tbody>
			</table>    
        
        </div>
        <div class="tab-pane fade" id="myreview" role="tabpanel" aria-labelledby="myreview-tab">
        내리뷰리스트 탭
        
        
        </div>
      </div>
			
			
			
			
			
			
			
			<div style="height:50px;"></div>
			<div class="headerL2 my-5">배송 및 결제 정보 </div>
		<form action="/member/orderProc" name="orderFm" id="orderFm" method="post">
			<table class="table table-borderless order">
				<tr>
					<th>수령인 / 연락처</th>
					<td><input type="text" name="m_name" value="${mdto.m_name }" /> 
					<input type="text" name="phone" value="${mdto.phone }" />
					<input type="hidden" name="mName" id="mName" value="${mdto.m_name }" />
					<input type="hidden" name="mPhone" id="mPhone" value="${mdto.phone }" />
					<input type="hidden" name="mId" id="mId" value="${mdto.id }" /></td>
				</tr>
				<tr>
					<th style="vertial-align:top;">배송지 주소</th>
					<td><input type="text" name="zip" id="zip" value="${mdto.zip }" readonly />
					<button type="button" onClick="postOpen2();" class="btn btn-outline-secondary">주소찾기</button>
					 <div class="my-3"><input type="text" name="addr1" value="${mdto.addr1 }" /> <input type="text" name="addr2" value="${mdto.addr2 }" /></div></td>
				</tr>
				<tr>
					<th style="vertial-align:top;">배송메세지</th>
					<td>
						<select name="msg" onchange="inputMsg(this.form);" style="width:40%">
                            <option value="" selected>배송 메세지를 선택해주세요.</option>
                            <option value="직접입력">배송 메세지를 직접 입력할게요.</option>
                            <option value="경비실에 맡기고 문자주세요.">경비실에 맡기고 문자주세요.</option>
                            <option value="현관문앞에 두고 문자주세요.">현관문앞에 두고 문자주세요.</option>
						    <option value="무인택배함에 두고 문자주세요.">무인택배함에 두고 문자주세요.</option>
	                    </select><br />
						<input type="text" name="msg2" size="30" placeholder="배송메세지 (20자이내)" style="margin-top:10px;" readonly />
					</td>
				</tr>
				<tr>
					<th>입금시 입금자명</th>
					<td><input type="text" name="owner" placeholder="무통장입금 시 반드시 입력하세요." style="width:30%;" /> </td>
				</tr>
				<tr>
					<th>총 작품 금액</th>
					<td><b id="tprice3" class="price2">0</b> 원 </td>
				</tr>
				<tr>
					<th>포인트 사용</th>
					<td><input type="text" name="point" id="point" value="0" /> P ( 사용가능 포인트 <b style="color:#AF0000" id="maxPoint">${not empty mdto ? mdto.total_point : "0" }</b> P )</td>
				</tr>
				<tr>
					<th>최종 결제할 금액</th>
					<td><b id="fprice" class="price2" style="color:blue;">0</b> 원 <input type="hidden" name="oprice" id="oprice" /> </td>
				</tr>
				<tr>
					<th>적립예정 포인트</th>
					<td><span id="futurepoint">0</span> P</td>
				</tr>
			</table>
			<div class="m-5">
			<input type="hidden" name="paymethod" />
			<input type="hidden" name="pidxList" id="pidxList" />
			<input type="hidden" name="titleList" id="titleList" />
			<input type="hidden" name="imp_uid" id="imp_uid" />
			<input type="hidden" name="user_id" id="user_id" value="${ not empty mdo ? mdto.id : '' }" />
			<button class="btn3 account" type="button" onclick="submitFm('bank');">무통장입금</button>
			
			<button class="btn4" id="kakao" style="background-color:#f7e400; color:black; margin:0 10px;" type="button" onclick="requestPay2('kakaopay');">
			<img alt="" src="../images/kakaopay.png" style="width:50px;"> 카카오페이</button>
			<button class="btn4" id="toss" style="border:1px solid #004df7; background-color:white; color:#004df7;" type="button" onclick="tossPay();">
			<img alt="" src="../images/toss.png" style="width:50px;"> 토스페이먼츠</button>
			
			<button class="btn1 px-5 mx-3" id="card" type="button" onclick="requestPay2('html5_inicis');">
			<i class="bi bi-credit-card-2-back" style="margin-right:10px;"></i> 카드 결제</button>
			</div>
			</form>
        </div>
    </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>

</html>
 
 