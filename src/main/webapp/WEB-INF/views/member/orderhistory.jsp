<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>

<script>

$( function() {
    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker();
    $('#aaa').click(function(){
        $('#bbb').hide();
    });
   	/* $('input[type=file]').change(function(){
	    var files = this.files; // 현재 선택된 파일 정보 가져오기
	    // 각 파일에 대해 용량 체크
	    for (var i = 0; i < files.length; i++) {
	        var fileSize = files[i].size;
	
	        if (fileSize > 1024*1024*4) {
	            alert("첨부파일은 개당 4MB까지 가능합니다.");
	            $(this).val(''); // 파일 선택 초기화 (선택된 파일 제거)
	            return;
	        }
	
	        var reader = new FileReader(); // 파일을 미리 보여주는 코드
	        reader.onload = function (e) {
	            $('#thumb'+(i+1)).attr('src', e.target.result);
	        };
	        reader.readAsDataURL(files[i]);
	    } */
	   		
   	});	
   	
   	$('textarea[name=rContent]').keyup(function(){
   		$('#ta_count').html($(this).val().length);
   		if($(this).val().length>800){
   			alert("내용을 800자 이내로 입력해주세요.");
   			$(this).val($(this).val().substring(0,800));
   			$('#ta_count').html("800");
   			$(this).focus(); 
   		}
   	});
   	
   	$('i.bi-star-fill"]').click(function() {
   	    var clickedValue = $(this).data('value');
   	    
   	    // 모든 별의 활성 클래스 제거
   	    $('i[class^="bi-star-fill"]').removeClass('starActive');
   	    
   	    // 클릭한 별과 그 이전 별까지 활성 클래스 추가
   	    for (var i = 1; i <= clickedValue; i++) { $('#star' + i).addClass('starActive'); }

   	    // 클릭한 별의 값을 숨겨진 input에 설정
   	    $('#starInput').val(clickedValue);
   	  });
   	
   	$('.toggle').click(function(){  $('.toggle').fadeToggle();
    });
   	
 });

//이미지 선택시 바로 이미지 띄우기
 function loadApplyImage(img) {
 	/* 파일용량 제한*/
 	let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
 	let fileSize = img.files[0].size; //업로드한 파일용량
 	
 	if(fileSize > maxSize){
 		alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
 		$(img).val(''); //업로드한 파일 제거
 		return; 
 	}
 	
     var file = img.files[0]; //선택된 파일 가져오기
 	//이미지 태그 name 값 마지막 부분(숫자로 되어있음)을 잘라 num이라는 변수로 선언한다.
 	let num = img.name.slice(-1);
 	
 	var showImgSpan = document.getElementById('showImg_'+num);
     //새로운 img 태그 만들기(img태그는 뷰에서 foreach로 만들어지지 않기 때문에 num을 붙일 필요없다.)
 	var selectedApplyImage = document.createElement("img");
     //이미지 source 가져오기
 	selectedApplyImage.src = URL.createObjectURL(file);
     //이미지 크기 조정
 	selectedApplyImage.setAttribute('style', 'max-width: 100px; max-height: 100px;');
     //이미지를 showImageDiv에 추가
 	showImgSpan.html(selectedApplyImage);
 }
	
function submitReview(pidx) {
	if($('input[name="rContent"]').val()=='' || $('input[name="rContent"]').val().length()<20) {
		alert('리뷰내용을 20자 이상 작성해주세요.');
		$('input[name="rContent"]').focus(); return;
	}
	if ($('input[name="star"]').val()==0) {
		alert('별점을 1점이상 매겨주세요');  return;
	}
	
	// 첨부 이미지 확인
	  var hasImage = false;
	  $('input[name^="ofile"]').each(function () {
	    if ($(this)[0].files.length > 0) {
	      hasImage = true;
	      return false; // 이미지가 하나라도 있으면 반복문을 빠져나옴
	    }
	  });
	  if (!hasImage) {  alert('최소 한 개 이상의 이미지를 첨부해주세요.');  return; }
	  if (!$('#chk_' + pidx).prop('checked')) { alert('홍보 콘텐츠 사용에 동의해주세요.'); return; }
	  
	$('#reviewFm_'+pidx).submit();
}

function toggleDiv(divId) {
    var div = document.getElementById(divId);

    if (div.style.display === 'block') {
        div.style.display = 'none';
    } else {
        div.style.display = 'block';
    }
}


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

function trackWindow(tnum) {
	var popupWidth = 500;
	var popupHeight = 900;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/trackWindow?tnum='+tnum, 'track', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
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
tr.toggle td {background:#ededed;}

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
				<a href="?status=aa" class="btn1">입금확인전</a> 
				<a href="?status=bb" class="btn1">배송준비중</a> 
				<a href="?status=cc" class="btn1">발송완료</a> 
				<form action="" style="display:inline; float:right">
				<input type="date" name="dmin" id="datepicker1"><!-- <i class="bi bi-calendar3"></i> --> ~ 
				<input type="date" name="dmax" id="datepicker2"> <!-- <i class="bi bi-calendar3"></i> -->
                <input type="text" name="sWord" style="width: 150px;" placeholder="작가 또는 작품명 검색" />
                <button type="submit" id="search"> 검색 <i class="bi bi-search fs-5"></i></button>
                </form>
			</div>
			
			 <table class="table table1">
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
						       	<button class="btn7" id="writeReview_${row.pidx }" <%-- onClick="toggleView(${row.pidx });" --%> >리뷰작성</button>
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
						       	<c:when test="${ row.shipdate==null }"><button class="btn6">주문취소</button></c:when>
						       	<c:otherwise>
						       	<button class="btn6" disabled > 반품</button></c:otherwise>
						       </c:choose>
					       </td>
					     </tr>
					     
					     <c:if test="${ row.paydate!=null and row.shipdate!=null }">
					     <tr class="p-5 toggle" id="toggle_${row.pidx }"> <td colspan="8" class="p-5">
					     <form action="/member/reviewWrite.do?pidx=${row.pidx }" name="reviewFm_${row.pidx }" 
					     id="reviewFm_${row.pidx }" method="post" enctype="multipart/form-data" >
					     <div class="mb-3" style="line-height:30px;">
					     	<b>리뷰내용</b> (작품 구매 및 수령 후 한달안에 리뷰 작성시 10,000 포인트를 지급합니다. )
					     	<span style="float:right;"><span>별점을 매겨주세요.  </span>
					     	<c:forEach var="i" begin="1" end="5"><i class="bi bi-star-fill" id="star${i }" data-value="${i}"></i></c:forEach> </span>
						</div>
					     	<input type="hidden" name="star" id="starInput" value="0" />
					     	<input type="hidden" name="pidx" id="pidx" value="${row.pidx }" />
					     	<textarea name="rContent" id="rContent" cols="30" rows="10" placeholder="20자 이상 800자 이내로 작성해주세요."
					     	 class="form-control form-control-sm" style="padding:10px;"></textarea> <span class="count"> <span id="ta_count_${row.pidx }">0 </span> / 800</span><br />
					     	<div class="text-center">첨부파일 용량 : 이미지 파일 3개까지. 파일 1개당 4M, 총 12M 까지 가능합니다. </div>
					     	<div class="text-center mx-auto" style="margin-left: 140px !important;">
					     	<c:forEach var="i" begin="1" end="3">
					     	<input type="file" name="ofile${i }" id="ofile${i }" accept=".jpg, .png, .gif" onChange="loadApplyImage(this);" />
					     	<label class="my-2 btn1" for="ofile${i }">+</label> <span id="showImg_${i}" style="max-width: 100px; max-height: 100px;"></span>
					     	</c:forEach>
					     	</div>
							<div style="clear:both; margin-top:60px;" class="text-center"><input type="checkbox" id="chk_${row.pidx }" /> 작성된 후기는 아뜰리에 홍보 콘텐츠로 사용될 수 있습니다. (필수)</div>
							<div class="text-center"><button class="btn8" id="reviewBtn" onclick="submitReview(${row.pidx })" >리뷰등록</button></div>
					     </form>
					     	</td> </tr>
					     </c:if>
					     
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
    
</body>
</html>