<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier_Admin</title>

<link href="../css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
<link href="../css/all.min.css" rel="stylesheet" type="text/css">
<link href="../css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
.portImg{max-width:50px;margin-right:5px;}
.table thead tr th {vertical-align:middle !important;}
.introtable tr th {background:#ededed;}
.img1 {max-width:100px; max-height:100px;}
.maintable tr {height:30px !important;}
.maintable tr th {background:#ededed;}
.btn13 {padding: 8px 20px !important;}
.ptable th {color:#c5c5c5 !important;}
@media (max-width: 600px) {
  .auction {padding:15px 44px !important}
  .d-block {height: auto !important;  width: 100% !important;}
}
.modal {--bs-modal-width: 96% !important}
.modal-content {background-color: black; border-radius:0 !important}
.bi-star-fill {font-size:20px;}
.img2 {max-width:200px; max-height:200px; margin-right:15px; margin-left:-30px}
.d-block {height:800px;}
.next, .prev {font-size:50px; color:black;}
.carousel-control-next, .carousel-control-prev {width:6% !important;}
.bi-zoom-in {opacity:0.5; position:relative; left: 80px; font-size: 30px; }
.btn4 {height:40px; padding:0 30% !important;}
.image2 a img {max-width:80%; max-height:80%;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function aucmsg(mailsmsfm) {
    if (confirm("해당 낙찰자에게 알림을 발송하시겠습니까?")) {
   $.ajax({
        type: 'POST',
        url: '/admin/aucmailsend.do',  
        data: $(mailsmsfm).serialize(),
        dataType : "text",
        success: function (response) {
            if (response==2) { 
            	alert('메일과 문자 발송이 완료되었습니다.');
            	location.reload();
            } else { alert('알림 발송 실패');}
        },
        error: function (errData) { alert('알림 발송 중 오류가 발생했습니다.');
        console.log(errData.state, errData.statusText);}
    });
	} 
}

//카운트다운함수
const countDownTimer = function(id, date){
	var _vDate = new Date(date);
	var _miliSecond = 100;
	var _second = 1000;
	var _minute = _second*60;
	var _hour = _minute *60;
	var _day = _hour*24;
	var timer;
	function showRemaining(){
		var now = new Date();
		var distDt = _vDate - now;
		if(distDt<0){
			clearInterval(timer);
			document.getElementById(id).innerHTML = '경매종료';
			//setEndAuction(); //경매가 종료표시되는 요소를 변경시킴
			return;
		}
		var days = Math.floor(distDt / _day);
		var hours = Math.floor((distDt % _day) / _hour);
		var minutes = Math.floor((distDt % _hour) / _minute);
		var seconds = Math.floor((distDt % _minute) / _second);
		
		document.getElementById(id).innerHTML = days+'일 '+hours+'시간 '+minutes+'분 '+seconds+'초';
	}
	timer = setInterval(showRemaining, 1000);
}

//div#contentDiv의 내용을 가져와서 input#content의 값으로 설정
var contentDiv = document.getElementById('contentDiv');
var contentInput = document.getElementById('content');

// div의 텍스트 내용을 input의 값으로 설정
contentInput.value = contentDiv.innerText || contentDiv.textContent;
</script>

<form name="stateChange"> <input type="hidden" name="midx" /> </form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="ps-5 text-gray-800 fw-bolder">경매작품 상세보기 </h3>


    <div class="container">
    <div class="row py-5">
        <div class="col-sm-6 imgback">
        	<c:if test="${not empty pdto}"><a href="/auction/view?pidx=${ pdto.pidx }" class="image2">
        		<c:choose>
        		<c:when test="${pdto.sfile.length() > 40}"><img src="${pdto.sfile}" alt="작품이미지" /> </c:when>
        		<c:otherwise><img src="./uploads/${pdto.sfile}" alt="작품이미지" /></c:otherwise>
        		</c:choose></a>
        	</c:if>
        </div>
        <div class="col-sm-6">
            <table class="table table-borderless atable" style="position: relative; top: -28px;"><tbody>
            <tr> <th>TITLE</th><td class="fw-bolder">${ not empty pdto ? pdto.title : '' }</td>  </tr>
                <tr><th>ARTIST</th><td>${not empty pdto ? pdto.m_name : "등록된 정보가 없습니다." }</td></tr>
                <tr><th>TYPE</th><td>${not empty pdto ? pdto.p_type : "등록된 정보가 없습니다." }</td></tr>
                <tr><th>SIZE</th><td>${not empty pdto ? pdto.size1 : "0" } X ${not empty pdto ? pdto.size2 : "0" } CM</td></tr>
                <tr><th>FRAMED</th><td>
                    <c:choose>
                        <c:when test="${not empty pdto and pdto.framed == 1 }">YES</c:when>
                        <c:otherwise>NO </c:otherwise>
                 	</c:choose>
                </td></tr>
                <tr><th>YEAR</th><td class="year">${not empty pdto ? pdto.regidate : "등록된 정보가 없습니다." }</td></tr>
            	<tr><th>시작가</th><td><span class="price2">${not empty pdto ? pdto.price : '0' }</span> 원</td> </tr>
				<tr><th>입찰시작일</th><td>${not empty pdto ? pdto.regidate : '' }</td> </tr>
				<tr><th>입찰종료일</th><td>${not empty pdto ? pdto.enddate : '' }</td> </tr>
				<tr><th>남은시간</th><td id="timeOut" style="color:red">경매종료</td> </tr>
            	<tr><th>최고낙찰가</th><td><span style="color:red;" class="price2" id="maxprice">${ not empty amdto ? amdto.aprice : pdto.price }</span> 원 </td> </tr>
				<tr><th>추정가</th><td><span class="price2">${not empty pdto ? pdto.price*3 : '0' }</span> ~ <span class="price2">${not empty pdto ? pdto.price*6 : '0' }</span> 원</td> </tr>
				<tr> <th>상태</th> <td id="divide"> ${ not empty pdto ? pdto.enddate : '' }</td></tr>
            <script>
			//경매종료시간
			if(${not empty pdto.enddate}){
				var endTime = `<c:out value="${pdto.enddate}" />`;
				console.log("endtime : "+endTime);
				countDownTimer('timeOut', endTime);
			}
			var now = new Date();
		       var dDate = new Date('${ pdto.enddate }');
		       var maxPrice = ${pdto.maxprice};
		       if (dDate <= now) {
		           if (maxPrice != null) { $('#divide').html('낙찰완료').css('color', 'red');
		           } else { $('#divide').html('유찰').css('color', '#c0c0c0');  }
		       } else { $('#divide').html('경매중').css('color', 'blue');}
			</script>
            </tbody></table>
			
        </div>
    </div>
    </div>
 <div class="container text-center mx-auto">
 <h4 class="mb-3 text-gray-800 fw-bolder mt-5">최고낙찰자 정보 </h4>
 <table class="table">
	     <thead class="table-secondary">
	         <tr align="center">
	         	<th>회원번호</th>
	        	 <th>아이디</th>
	             <th>회원명</th>
	             <th>휴대폰번호</th>
	             <th>주소</th>
	             <th>입찰일자</th>
	             <th>입찰가(원)</th>
	             <th>메일/문자/앱알림</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty amdto }"> 
	<tr> <td colspan="8" align="center">  최고낙찰자가 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
         <tr id="row_${amdto.pidx}">
         	<td> ${ amdto.midx }  </td>
         	<td id="memberid"> ${amdto.id }</td>
             <td> ${ amdto.m_name }  </td>
             <td> ${ amdto.phone }  </td>
             <td> ${ amdto.zip } | ${ amdto.addr1 } | ${ amdto.addr2 }  </td>
             <td> ${ amdto.aucdate }</td>
             <td class="price2"> ${ amdto.aprice }</td>
             <td id="stateBtn">
             <c:choose>
             	<c:when test="${not empty aucmailsmsResult and aucmailsmsResult eq '2' }">
             		<span style="color:red;">발송완료함</span></c:when>
             	<c:otherwise>발송필요</c:otherwise>
             </c:choose>
             </td>
         </tr>
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
 </div>

<div class="container mt-5">
<c:if test="${ not empty amdto }">
 <h4 class="fw-bolder" style="color:red;">최고 낙찰자에게 이메일/문자 전송하기</h4>
<form method="post" name="mailsmsfm">
<table class="table table-borderless">
	<tr> <td>받는 사람 (문자) : <input type="text" name="phone" value="${ amdto.phone }" /></td> </tr>
    <tr> <td> 받는 사람 (메일주소) : <input type="text" name="to" value="${amdto.id }" /> </td> </tr>
    <tr> <td>제목 : <input type="text" name="subject" size="50" value="atelier | 입찰하신 경매 마감 및 낙찰 알림" /></td></tr>
    <tr> <td> <textarea name="content" cols="120" rows="10" id="content">
    안녕하세요  ${ amdto.m_name } 회원님, 아뜰리에 입니다.
    
   회원님께서  ${ amdto.aucdate } 에 입찰하신 아래의 작품의 경매가 종료되었습니다.
   
   회원님의 입찰가로 낙찰되어 메일 수신으로부터 72 시간 이내에 결제 진행을 요청드립니다.
   
   낙찰후 72시간 이내 미결제시 한달간 입찰이 제한됨을 양해바랍니다.
   
   작품이미지 : 
   <c:choose>
	<c:when test="${pdto.sfile.length() > 40}"><img src="${pdto.sfile}" alt="작품이미지" style="max-width:200px;" /></c:when>
	<c:otherwise><img src="./uploads/${pdto.sfile}" alt="작품이미지" style="max-width:200px;" /></c:otherwise>
	</c:choose>
   
   작품번호 : ${pdto.pidx}
     
   작품명 : ${ not empty pdto.title ? pdto.title : '' }
   
   낙찰가 : ${ amdto.aprice } 원
   
   경매마감일시 : ${ not empty pdto.enddate ? pdto.enddate : '' }
   
   <a href="http://localhost:8586/member/paynow?pidx=${pdto.pidx}" class="btn1">바로 결제하러 가기 </a>
   
    </textarea> 
     </td></tr>
    <tr><td><button class="btn1" onclick="aucmsg(this.form);">전송하기</button></td></tr>
</table>
</form>
 </c:if></div>
  
  <div class="container">  
 <h4 class="mb-3 text-gray-800 fw-bolder text-center mt-5">입찰자 정보 </h4>
<div class="table-responsive">
	 <table class="table table-hover" id="dataTable">
	     <thead class="table-secondary">
	         <tr align="center">
	         	<th>회원번호</th>
	        	 <th>아이디</th>
	             <th>회원명</th>
	             <th>연락처</th>
	             <th>주소</th>
	             <th>입찰일자</th>
	             <th>입찰가(원)</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty amlist }"> 
	<tr> <td colspan="15" align="center">  입찰자가 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
	<c:forEach items="${ amlist }" var="row" varStatus="loop">    
         <tr id="row_${row.pidx}">
         	<td align="center"> ${ row.midx }  </td>
         	<td> ${row.id }</td>
             <td align="center"> ${ row.m_name }  </td>
             <td align="center"> ${ row.phone }  </td>
             <td> ${ row.zip } | ${ row.addr1 } | ${ row.addr2 }  </td>
             <td align="center"> ${ row.aucdate }</td>
             <td align="right" class="price2" > ${ row.aprice }</td>
         </tr>
	</c:forEach>        
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
</div></div>

    </div></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.easing.min.js"></script>
<script src="../js/sb-admin-2.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/datatables-demo.js"></script>
<script src="../js/atelier.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('ul.sidebar li').removeClass( 'active' );
	$('ul.sidebar li a').removeClass( 'active' );
	$('ul.sidebar li:eq(5)').addClass( 'active' );
	$('ul.sidebar li:eq(5) a').addClass( 'active' );
	
});
</script>