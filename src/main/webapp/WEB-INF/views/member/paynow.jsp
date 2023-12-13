<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script> -->
<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="/js/atelier.js"></script>
<script type="text/javascript">
function inputMsg(frm) {
	 var choiceMsg = frm.msg.value;
    if (choiceMsg == '직접입력') {
        frm.msg2.readOnly = false;
        frm.msg2.focus();
    }else {
        frm.msg2.value = choiceMsg;
        frm.msg2.readOnly = true;
    }
}
</script> 
<style>
@media (max-width: 600px) {
	.btn3, .btn4, .btn1 {display:inline !important; float:left !important;}
	
}
.btn3, .btn4, .btn1 {width:200px; padding:0 !important;}
.btn1 {padding:5px !important; }
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.ptotile div {display:inline; float:left; padding:10px;}
.img1 {max-width:100px; max-height:100px;}

</style>
</head>
<body>
<%-- <c:set var="user_id" value="
<sec:authorize access="isAuthenticated()"><sec:authentication property="name"/></sec:authorize>
"></c:set>  <div>${user_id } 님 로그인을 환영합니다.</div> --%>
<%@ include file="../include/header.jsp" %>
    <div class="container mx-auto" style="width:600px;">
			<div class="headerL2 mb-5" style="margin-top:80px;">바로결제</div>
			
			<ul class="border my-5" style="padding:20px 40px;">
				<li>● 아래의 내용을 정확하게 작성 후 구매하기 버튼을 눌러 주세요.</li>
				<li>● 무통장입금의 경우 구매 후 1영업일 (24시간) 이내에 구매금액을 입금해 주세요.</li>
				<li style="color:#AF0000">● 24시간 이내 입금이 되지 않을시 자동으로 구매취소처리됩니다.</li>
				<li>● 입금계좌 : <span style="color:#AF0000"> KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</span></li>
				<li>● 결제완료 후 작품 포장 및 배송이 이루어집니다. (최대 5 영업일 소요)</li>
			</ul>
			
			<c:if test="${not empty pdto }">
			<a href="/view?pidx=${ pdto.pidx }" class="ptotile" style="clear:both;"><div style="width:580px;" class="border"> 
		       <div style="width:25%">
		       <c:choose>
                   	<c:when test="${pdto.sfile.length()>40 }"><img class="img1" src="${pdto.sfile }" alt="작품이미지" /></c:when>
                   	<c:otherwise><img src="./uploads/${pdto.sfile }" alt="작품이미지" /></c:otherwise>
               </c:choose>
				 </div>
				 <div style="width:50%"><b> ${ pdto.title }</b><br/>  ${pdto.m_name }<br/> ${pdto.size1 } x ${pdto.size2 } cm</div>
			     <div style="width:25%"><b class="price2">${pdto.price }</b> 원<br/>무료배송</div> </div></a><br />
			
			<div class="text-center my-5 py-5" style="clear:both">총 결제 금액 <i class="bi bi-chevron-right"></i>  
			작품합계  <span class="price2" id="tprice">${ pdto.price }</span> +  배송비 0 <i class="bi bi-chevron-right"></i>
			<b id="tprice2" class="price2" style="color:#AF0000">${pdto.price }</b> 원</div>
			</c:if>
				
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
						<select name="msg" onchange="inputMsg(this.form);" >
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
					<td><input type="text" name="owner" placeholder="무통장입금 시 반드시 입력하세요." style="width:60%;" /> </td>
				</tr>
				<tr>
					<th>총 작품 금액</th>
					<td><b id="tprice3" class="price2">${not empty pdto ? pdto.price : "0" }</b> 원 </td>
				</tr>
				<tr>
					<th>포인트 사용</th>
					<td><input type="text" name="point" id="point" value="0" /> P ( 사용가능 포인트 <b style="color:#AF0000" id="maxPoint">${not empty mdto ? mdto.total_point : "0" }</b> P )</td>
				</tr>
				<tr>
					<th>최종 결제할 금액</th>
					<td><b id="fprice" class="price2" style="color:blue;">${not empty pdto ? pdto.price : "0" }</b> 원 <input type="hidden" name="oprice" id="oprice" /> </td>
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
			<button class="btn3 account" type="button" onclick="submitFm('bank');">무통장입금</button>
			
			<button class="btn4 mx-3" id="kakao" style="background-color:#f7e400; color:black;" type="button" onclick="requestPay2('kakaopay');">
			<img alt="" src="../images/kakaopay.png" style="width:40px;"> 카카오페이</button>
			<button class="btn4 mt-3" id="toss" style="border:1px solid #004df7; background-color:white; color:#004df7;" type="button" onclick="tossPay();">
			<img alt="" src="../images/toss.png" style="width:40px;"> 토스페이먼츠</button>
			
			<button class="btn1 m-3" id="card" type="button" onclick="requestPay2('html5_inicis');"><i class="bi bi-credit-card-2-back"></i> 카드 결제</button>
			</div>
			</form>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>

</html>
 
 