<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script> -->
<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script type="text/javascript">
$( document ).ready( function() {
 	
 	var sum = 0;
 	var totalChecked = 0;
    
 // 장바구니 전부 선택
    $("#chkAll").click(function () {
        if ($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    }); 
    
    $('input[name=chk]').click(function () {
        var total = $('input[name=chk]').length;
        totalChecked = $('input[name=chk]:checked').length;
        var sum = 0;

        $('input[name=chk]:checked').each(function() {
            // 체크된 제품의 가격을 가져와서 총합에 더함
            sum += parseInt($(this).closest('tr').find('.price2').text().replace(/,/g, ''));
        });
        
        $('#tnum').html(totalChecked);
        $('#tprice').html(numberWithCommas(sum));
        if (total != totalChecked) $("#chkAll").prop("checked", false);
        else $("#chkAll").prop("checked", true);
    });  
    
    $('#point').focus(function () {
        if ($(this).val() === '0') { $(this).val(''); }
    });

    // #point 인풋에서 포커스가 빠져나갔을 때, 값이 비어 있다면 0으로 설정
    $('#point').blur(function () { if ($(this).val() === '') { $(this).val('0'); }
    });
    
    // 장바구니에서 결제시 포인트 검증
	$('#point').keyup(function() {
		var enteredPoint = parseInt($(this).val());
	    var maxPoint = parseInt($('#maxPoint').text());
	
	    if (enteredPoint > maxPoint) {
	        alert('보유하신 포인트를 초과하였습니다.');
	        $(this).val(0);
	    }
	    
	    var ffprice = parseInt($('#tprice3').text().replace(/,/g, ''))-$(this).val();
	    console.log(ffprice);
	    $('#fprice').html(numberWithCommas(ffprice));
	    $('#futurepoint').html(parseInt($('#tprice3').text().replace(/,/g, ''))*0.01);
	    $('input[name=oprice]').val(ffprice);
	});
});
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
function postOpen2() {
	new daum.Postcode({
		oncomplete : function(data) {
			console.log(data);
			console.log(data.zonecode);
			console.log(data.address);

			let frm = document.orderFm;
			frm.zip.value = data.zonecode;
			frm.addr1.value = data.address;
			frm.addr2.focus();
		}
	}).open();
}

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
}
.leftmenu li:nth-child(1) {background-color: black;}
.leftmenu li:nth-child(1) a, .leftmenu li:nth-child(1) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
</style>
</head>
<body>
<form name="delFrm" id="delFrm" ><input type="hidden" name="pidx" /></form>
<%@ include file="index.jsp" %>
<%-- <c:set var="user_id" value="
<sec:authorize access="isAuthenticated()"><sec:authentication property="name"/></sec:authorize>
"></c:set>  <div>${user_id } 님 로그인을 환영합니다.</div> --%>
    <div class="container">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-5" style="margin-top:10px;">장바구니 ${not empty plist ? plist.size() : "0" }</div>
			<table class="table table-hover">
			   <thead class="table-secondary">
			     <tr align="center" style="height:40px">
			       <th width="10%">${not empty plist ? plist.size() : "0" }</th>
			       <th><input type="checkbox" id="chkAll" /></th>
			       <th colspan="2">ARTWORK TITLE</th>
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
					     <tr id="cartItem_${row.pidx}">
					       <td align="center" width="10%">${ loop.index + 1 }</td>
					       <td align="center" width="10%">
						       <c:choose>
						       	<c:when test="${ row.sold==1 }">  </c:when>
						       	<c:otherwise><input type="checkbox" name="chk" /></c:otherwise>
						       </c:choose>
					       </td>
					       <td align="right" width="10%"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" style="width:100px" />
					       	</a></td>
					       	<td><a href="view?pidx=${ row.pidx }"><b> ${ row.title }</b><br/>  ${row.m_name }<br/> ${row.size1 } x ${row.size2 } cm</a></td>
					       <td width="20%" align="right" >
					       	 <c:choose>
						       	<c:when test="${ row.sold==1 }"><div class="fw-bolder" style="color:grey;">● SOLD</div></c:when>
						       	<c:otherwise><div class="fw-bolder price2">${row.price }</div></c:otherwise>
						       </c:choose>
					       </td>
					       <td align="center" width="10%"><a class="btn1" href="javascript:deletepidx(${ row.pidx });">삭제</a></td>
					       <td align="center" width="10%">무료배송</td>
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
			
			<ul class="border my-5" style="padding:20px 40px;">
				<li>● 아래의 내용을 정확하게 작성 후 구매하기 버튼을 눌러 주세요.</li>
				<li>● 무통장입금의 경우 구매 후 1영업일 (24시간) 이내에 구매금액을 입금해 주세요.</li>
				<li style="color:#AF0000">● 24시간 이내 입금이 되지 않을시 자동으로 구매취소처리됩니다.</li>
				<li>● 입금계좌 : <span style="color:#AF0000"> KB 333333-44-555555 (예금주 : 주식회사 아뜰리에)</span></li>
				<li>● 결제완료 후 작품 포장 및 배송이 이루어집니다. (최대 5 영업일 소요)</li>
			</ul>
			
			<div style="height:50px;"></div>
			<div class="headerL2 my-5">배송 및 결제 정보 </div>
		<form action="/member/orderProc" name="orderFm" id="orderFm" method="post">
			<table class="table table-borderless order">
				<tr>
					<th>수령인 / 연락처</th>
					<td><input type="text" name="m_name" value="${mdto.m_name }" /> <input type="text" name="phone" value="${mdto.phone }" /></td>
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
					<td><b id="tprice3" class="price2">0</b> 원</td>
				</tr>
				<tr>
					<th>포인트 사용</th>
					<td><input type="text" name="point" id="point" value="0" /> P ( 사용가능 포인트 <b style="color:#AF0000" id="maxPoint">${not empty mdto ? mdto.total_point : "0" }</b> P )</td>
				</tr>
				<tr>
					<th>최종 결제할 금액</th>
					<td><b id="fprice" class="price2" style="color:blue;">0</b> 원
					<input type="hidden" name="oprice" id="oprice" />
					</td>
				</tr>
				<tr>
					<th>적립예정 포인트</th>
					<td><span id="futurepoint">0</span> P</td>
				</tr>
			</table>
			<div class="m-5">
			<input type="hidden" name="paymethod" />
			<input type="hidden" name="pidxList" id="pidxList" />
			<button class="btn3 account" type="button" onclick="submitFm('bank');">무통장입금</button>
			<button class="btn4 kakao" style="background-color:#f7e400; color:black; margin:0 10px;" type="button" onclick="submitFm('kakao');">
			<img alt="" src="../images/kakaopay.png" style="width:50px;"> 카카오페이 결제</button>
			<button class="btn4 toss" style="border:1px solid #004df7; background-color:white; color:#004df7;" 
			 type="button" onclick="submitFm('toss');"><img alt="" src="../images/toss.png" style="width:50px;"> 토스페이먼츠 결제</button>
			</div>
			</form>
        </div>
    </div>
    </div>
    <div class="mx-auto">${not empty resultMsg ? resultMsg : "" }</div>
<%@ include file="../include/footer.jsp" %>
</body>

</html>
 
 