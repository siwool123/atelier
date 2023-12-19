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
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function aucmsg(midx, pidx) {
    if (confirm("해당 낙찰자에게 알림을 발송하시겠습니까?")) {
   $.ajax({
        type: 'POST',
        url: '/rest/aucmsg',  
        data: { midx: midx, pidx:pidx },
        success: function (response) {
            if (response==1) { 
            	alert('알림을 발송이 완료되었습니다.');
            	location.reload();
            } else { alert('알림 발송 실패');}
        },
        error: function () { alert('알림 발송 중 오류가 발생했습니다.'); }
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
		document.getElementById(id).style.color = 'red';
	}
	timer = setInterval(showRemaining, 1000);
}
</script>

<form name="stateChange"> <input type="hidden" name="midx" /> </form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="mb-3 text-gray-800 fw-bolder">경매작품 상세보기 </h3>


    <div class="container">
    <div class="row py-5">
        <div class="col-sm-6 imgback"><div class="image2">
        	<c:if test="${not empty pdto}">
        		<c:set var="imageSource" value="${pdto.sfile.length() > 40 ? pdto.sfile : './uploads/' + pdto.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" />
        	</c:if>
        </div></div>
        <div class="col-sm-6">
            <table class="table table-borderless atable">
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
				<tr><th>남은시간</th><td id="timeOut"></td>0 </tr>
            	<tr><th>현재최고입찰가</th><td><span style="color:red;" class="price2" id="maxprice">${not empty maxprice ? maxprice : pdto.price }</span> 원 </td> </tr>
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
            </table>
			
        </div>
    </div>
    </div>
 <div class="container text-center mx-auto">
 <h4 class="mb-3 text-gray-800 fw-bolder mt-5">최고낙찰자 정보 </h4>
 <table class="table table-hover">
	     <thead class="table-secondary">
	         <tr align="center">
	         	<th>회원번호</th>
	        	 <th>아이디</th>
	             <th>회원명</th>
	             <th>회원번호</th>
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
             <td><button class="btn1" onclick="aucmsg(${ amdto.midx }, ${amdto.pidx });">발송</button></td>
         </tr>
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
 </div>

<div class="container mt-5">
<c:if test="${ not empty amdto }">
 <h4 class="fw-bolder">최고 낙찰자에게 이메일 전송하기</h4>
<form method="post" action="admin/aucmailsend.do">
<table class="table table-borderless">
    <tr> <td> 보내는 사람 : <input type="text" name="from" /> </td> </tr>
    <tr> <td> 받는 사람 : <input type="text" name="to" value="" /> </td> </tr>
    <tr> <td>제목 : <input type="text" name="subject" size="50" value="제목은 제목일뿐" /></td></tr>
    <tr><td>형식 :
            <input type="radio" name="format" value="text" checked />Text
            <input type="radio" name="format" value="html" />HTML
        </td></tr>
    <tr> <td> <textarea name="content" cols="60" rows="10">내용은 내용일뿐</textarea> </td></tr>
    <tr><td><button type="submit">전송하기</button></td></tr>
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
	             <th>회원번호</th>
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
         	<td> ${ row.midx }  </td>
         	<td> ${row.id }</td>
             <td> ${ row.m_name }  </td>
             <td> ${ row.phone }  </td>
             <td> ${ row.zip } | ${ row.addr1 } | ${ row.addr2 }  </td>
             <td> ${ row.aucdate }</td>
             <td class="price2"> ${ row.aprice }</td>
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