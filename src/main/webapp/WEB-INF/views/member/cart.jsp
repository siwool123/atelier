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
<script>
    const clientKey = 'test_ck_26DlbXAaV0dX9X9NJ2d5VqY50Q9R' // 테스트용 클라이언트 키
    const customerKey = `${not empty mdto ? mdto.id : ""}` // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID

    // 2. 결제위젯 SDK 초기화
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
    
    let currentURL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname.split('/')[1];
    
    const paymentMethodsWidget = paymentWidget.renderPaymentMethods(
	  '#payment-method',
	  {
	    value: 10000,
	    currency: 'KRW',
	    country: 'KR',
	  },
	  { variantKey: 'widgetA' }
	)
	const paymentMethodsWidget = paymentWidget.renderPaymentMethods()
	paymentMethodsWidget.updateAmount(50000)

	const paymentMethodsWidget = paymentWidget.renderPaymentMethods()
	const selectedPaymentMethod = paymentMethodsWidget.getSelectedPaymentMethod()

	paymentWidget.requestPayment({
	  amount: 15000,
	  orderId: 'AD8aZDpbzXs4EQa-UkIX6',
	  orderName: '토스 티셔츠 외 2건',
	// 테스트에서는 성공, 실패 페이지가 없어도 URL에서 쿼리 파라미터를 확인할 수 있어요.
	  successUrl: 'http://localhost:8586/success', // 성공 리다이렉트 URL
	  failUrl: 'http://localhost:8586/fail', // 실패 리다이렉트 URL
	  customerEmail: 'customer123@gmail.com',
	  customerName: '김토스',
	})
	.then(function (data) {
    // 성공 처리: 결제 승인 API를 호출하세요
  })
  .catch(function (error) {
    // 에러 처리: 에러 목록을 확인하세요
    // https://docs.tosspayments.com/reference/error-codes#failurl로-전달되는-에러
    if (error.code === 'USER_CANCEL') {
      // 결제 고객이 결제창을 닫았을 때 에러 처리
    } else if (error.code === 'INVALID_CARD_COMPANY') {
      // 유효하지 않은 카드 코드에 대한 에러 처리
    }
  })
    
 // @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
   function tossPay() {
   	
   	if($('input[name="m_name"]').val()=='') {
   		alert('수령인 이름을 입력해 주세요');
   		$('input[name="m_name"]').focus(); return;
   	}
   	if ($('input[name="phone"]').val()=='') {
   		alert('수령인 휴대폰 번호를 입력해 주세요');
   		$('input[name="phone"]').focus(); return;
   	}
   	if ($('input[name="zip"]').val() == '' || $('input[name="addr1"]').val() == ''|| $('input[name="addr2"]').val() == '') {
   		alert('수령하실 주소를 입력해 주세요'); return;
   	}
   	if ($('input[name="msg2"]').val() == '') {
   		alert('배송메세지를 입력해 주세요'); 
   		$('input[name="msg2"]').focus(); return;
   	}
   	$('input[name="paymethod"]').val('tosspayments');

   	paymentWidget.requestPayment({
   		amount: $('input[name="oprice"]').val(),
        orderId: $('#pidxList').val(),
        orderName: $('#titleList').val(),
        successUrl: currentURL + "/success",
        failUrl: currentURL + "/fail",
        customerEmail: $('input[name="user_id"]').val(),
        customerName: $('input[name="m_name"]').val(),
        customerMobilePhone: $('input[name="phone"]').val(),
      });
   }
  </script>
<script type="text/javascript">
/*$( document ).ready( function() {
 	
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
	    console.log("포인트합산결과", ffprice, $('#tprice3').text());
	    $('#fprice').html(numberWithCommas(ffprice));
	    $('#futurepoint').html(parseInt($('#tprice3').text().replace(/,/g, ''))*0.01);
	    $('input[name=oprice]').val(ffprice);
	}); */
    
	/* $("#kakao").click(function(){
		
		if($('input[name="m_name"]').val()=='') {
			alert('수령인 이름을 입력해 주세요');
			$('input[name="m_name"]').focus(); return;
		}
		if ($('input[name="phone"]').val()=='') {
			alert('수령인 휴대폰 번호를 입력해 주세요');
			$('input[name="phone"]').focus(); return;
		}
		if ($('input[name="zip"]').val() == '' || $('input[name="addr1"]').val() == ''|| $('input[name="addr2"]').val() == '') {
			alert('수령하실 주소를 입력해 주세요'); return;
		}
		if ($('input[name="msg2"]').val() == '') {
			alert('배송메세지를 입력해 주세요'); 
			$('input[name="msg2"]').focus(); return;
		}
		$('input[name="paymethod"]').val('kakao');
		
		// 필수입력값을 확인.
		var name = $("#orderFm input[name='mName']").val();
		var tel = $("#orderFm input[name='mPhone']").val();
		var email = $("#orderFm input[name='mId']").val();
		
		// 결제 정보를 form에 저장한다.
		let totalPayPrice = parseInt($("#fprice").text().replace(/,/g,''));
		let totalPrice = parseInt($("#tprice3").text().replace(/,/g,''));
		let discountPrice = totalPrice - totalPayPrice; 
		let usePoint = $("#point").val();
		let useUserCouponNo = 0;
		
		// 카카오페이 결제전송
		$.ajax({
			type:'post'
			,url:'/pay/ready'
			,data:{
				total_amount: totalPayPrice
				,payUserName: name
				,sumPrice:totalPrice
				,discountPrice:discountPrice
				,totalPrice:totalPayPrice
				,tel:tel
				,email:email
				,usePoint:usePoint
				,useCouponNo:useUserCouponNo	
			},
			success:function(rsp){
				console.log(rsp);
				var msg = '결제가 완료되었습니다. 카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				$('#kakao').submit();	
			},
			error : function(errD){
				console.log(errD.status+" : "+errD.statusText);
				var msg = '결제에 실패하였습니다.' + errD.error_msg;
				alert(msg);
			}
		} 
	}); 
	
});*/
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

function requestPay(paymethod){
	$('input[name="paymethod"]').val(paymethod);
	$.ajax({  
	 url : '/pay/proceed',
	 type : 'POST',
	 async : true,
	 dataType : 'Json', 
	 data : $('#orderFm').serialize(),
	 success : function(data){
		 if(data.cnt > 0){
			 requestPay2(data)
		 }else{
			 alert(data.msg)
		 }
	 }, 
	 error : function (e){
		 alert("에러")
	 }
	}); 
	
}
/* function requestPay2(paymethod) {
	
	if($('input[name="m_name"]').val()=='') {
		alert('수령인 이름을 입력해 주세요');
		$('input[name="m_name"]').focus(); return;
	}
	if ($('input[name="phone"]').val()=='') {
		alert('수령인 휴대폰 번호를 입력해 주세요');
		$('input[name="phone"]').focus(); return;
	}
	if ($('input[name="zip"]').val() == '' || $('input[name="addr1"]').val() == ''|| $('input[name="addr2"]').val() == '') {
		alert('수령하실 주소를 입력해 주세요'); return;
	}
	if ($('input[name="msg2"]').val() == '') {
		alert('배송메세지를 입력해 주세요'); 
		$('input[name="msg2"]').focus(); return;
	}
	$('input[name="paymethod"]').val(paymethod);
	
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp76555372"); // 예: imp00000000
	
	console.log($('#titleList').val(), $('#titleList').val());
	var pg1 = '', pg2 = '';
  //IMP.request_pay(param, callback) 결제창 호출
  if(paymethod=='kakao'){var pg1 = 'kakaopay', pg2 = 'TC0ONETIME'; }
  if(paymethod=='toss'){var pg1 = 'tosspayments', pg2 = 'tosstest'; }
  if(paymethod=='card'){var pg1 = 'html5_inicis', pg2 = 'INIBillTst'; }
  IMP.request_pay({ // param
      pg: pg1, //결제대행사 설정에 따라 다르며 공식문서 참고
      pay_method: "card", //결제방법 설정에 따라 다르며 공식문서 참고
      merchant_uid: "0001", //주문(db에서 불러옴) 고유번호
      item_name : "test",
      name : "test",
      amount: $('input[name="oprice"]').val(),
      buyer_email: "",
      buyer_name: $('input[name="m_name"]').val(),
      buyer_tel: $('input[name="phone"]').val(),
      buyer_addr: $('input[name="zip"]').val()+$('input[name="addr1"]').val()+$('input[name="addr2"]').val(),
      //buyer_postcode: "01181"
  }, function (rsp) { // callback
      if (rsp.success) {
    	  console.log(rsp.imp_uid);
    	// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우 // jQuery로 HTTP 요청
          jQuery.ajax({
            url: "/payment/proceed", 
            method: "POST",
	    	data : $('#orderFm').serialize() + "&imp_uid=" + rsp.imp_uid,
    		 success : function(data){
    			 if(data.cnt > 0){ 
    				 console.log(data);
    				 alert('주문 및 결제가 성공적으로 처리되었습니다.');
    			 }else{  alert(data.msg)  }
    		 }, 
    		 error : function (e){  alert("에러")  }
          })
      } else {
    	  var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg;
          alert(msg);
      }
  });
}  */
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
.img1 {max-width:100px; max-height:100px;}
.bpc1 {position:relative !important; top:-20px !important;}
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
			<div class="headerL2 mb-5" style="margin-top:10px;">주문내역 ${not empty map.olist ? map.olist.size() : "0" }</div>
			<table class="table table-hover">
			   <thead class="table-secondary">
			     <tr align="center" style="height:40px">
			       <th width="10%">${not empty map.olist ? map.olist.size() : "0" }</th>
			       <th><input type="checkbox" id="chkAll" /></th>
			       <th colspan="2">ARTWORK TITLE</th>
			       <th>PRICE (원)</th>
			       <th>삭제</th>
			       <th>배송비</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty map.olist }">
				<tr><td colspan="6" align="center">등록된 작품이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ map.olist }" var="row" varStatus="loop">
					     <tr id="cartItem_${row.pidx}">
					       <td align="center" width="10%">${ loop.index + 1 }</td>
					       <td align="center" width="10%">
						       <c:choose>
						       	<c:when test="${ row.sold==1 }">  </c:when>
						       	<c:otherwise><input type="checkbox" name="chk" /></c:otherwise>
						       </c:choose>
					       </td>
					       <td align="center" width="10%"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</a></td>
					       	<td><a href="view?pidx=${ row.pidx }"><b > ${ row.title }</b><br/>  ${row.m_name }<br/> ${row.size1 } x ${row.size2 } cm</a></td>
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
					<td><input type="text" name="m_name" value="${map.mdto.m_name }" /> 
					<input type="text" name="phone" value="${map.mdto.phone }" />
					<input type="hidden" name="mName" id="mName" value="${map.mdto.m_name }" />
					<input type="hidden" name="mPhone" id="mPhone" value="${map.mdto.phone }" />
					<input type="hidden" name="mId" id="mId" value="${map.mdto.id }" /></td>
				</tr>
				<tr>
					<th style="vertial-align:top;">배송지 주소</th>
					<td><input type="text" name="zip" id="zip" value="${map.mdto.zip }" readonly />
					<button type="button" onClick="postOpen2();" class="btn btn-outline-secondary">주소찾기</button>
					 <div class="my-3"><input type="text" name="addr1" value="${map.mdto.addr1 }" /> 
					 <input type="text" name="addr2" value="${map.mdto.addr2 }" /></div></td>
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
					<td><input type="text" name="point" id="point" value="0" /> P ( 사용가능 포인트 <b style="color:#AF0000" id="maxPoint">${not empty map.mdto ? map.mdto.total_point : "0" }</b> P )</td>
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
			<input type="hidden" name="user_id" id="user_id" value="${ not empty map.mdo ? map.mdto.id : '' }" />
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
 
 