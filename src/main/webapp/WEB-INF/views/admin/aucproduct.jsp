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
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
.portImg{max-width:50px;margin-right:5px;}
.table thead tr th {vertical-align:middle !important;}
.table tbody tr {height:100px; overflow:hidden;}
.introtable tr th {background:#ededed;}
.img1 {max-width:100px; max-height:100px;}
.maintable tr {height:30px !important;}
.maintable tr th {background:#ededed;}
.btn13 {padding: 8px 20px !important;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function deletepidx(pidx) {
	var delReason = prompt("삭제 사유를 입력하세요."); // 삭제 사유 입력창 띄우기

    if (delReason === null) {   return;} // 사용자가 입력을 취소한 경우
    if (delReason.trim() === "") { alert("삭제 사유를 입력해주세요.");  return;  }
    if (confirm("정말로 해당 작품을 삭제하시겠습니까?")) {
   $.ajax({
        type: 'POST',
        url: '/rest/delProduct',  
        data: { pidx: pidx, delReason: delReason },
        success: function (response) {
            if (response==1) { 
            	$(`#row_${pidx}`).remove();
            	alert('작품이 삭제되었습니다.');
            	location.reload();
            } else { alert('작품 삭제 실패');}
        },
        error: function () { alert('작품 삭제 중 오류가 발생했습니다.'); }
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
                    <h3 class="mb-3 text-gray-800 fw-bolder">경매작품관리 ${not empty auclist ? auclist.size() : '0' }</h3>
                    <p class="mb-4"> ${error }  </p>

  <div style="display:inline; float:left">
  <a href="?sell=aa" class="btn1 btn13" id="aa">경매중</a>                    		
<a href="?sell=bb" class="btn1 btn13" id="bb">유찰</a>
<a href="?sell=cc" class="btn1 btn13" id="cc">낙찰완료</a>
</div>
                    
<div class="table-responsive">
	 <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
	     <thead class="table-secondary">
	         <tr align="center">
	        	 <th>작가번호</th>
	             <th>작가명</th>
	             <th>작품번호</th>
	             <th>작품등록일</th>
	             <th>이미지</th>
	             <th>작품명</th>
	             <th>사이즈(cm)</th>
	             <th>주제/타입</th>
	             <th>시작일</th>
	             <th>남은시간</th>
	             <th>최고입찰가(원)</th>
	             <th>입찰자수</th>
	             <th>찜</th>
	             <th>상태</th>
	             <th>삭제</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty auclist }"> 
	<tr> <td colspan="15" align="center">  등록된 작품이 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
	<c:forEach items="${ auclist }" var="row" varStatus="loop">    
         <tr id="row_${row.pidx}">
         	<td> ${ row.aidx }  </td>
             <td> ${ row.m_name }  </td>
             <td> ${ row.pidx }  </td>
             <td> ${ row.regidate }  </td>
             <td><a href="/view?pidx=${ row.pidx }">
			<c:choose>
	    		<c:when test="${row.sfile.length() > 40}"> <img src="${row.sfile}" alt="작품이미지" class="img1" /> </c:when>
	    		<c:otherwise> <img src="./uploads/${row.sfile}" alt="작품이미지" class="img1" /> </c:otherwise>
    		</c:choose></a></td>
             <td><a href="./aucproductview?pidx=${row.pidx }"> ${ row.title }</a></td>
             <td>${ row.size1 } x ${row.size2 } </td>
             <td>${ row.theme }<br/>${ row.p_type }</td>
             <td>${row.regidate }</td>
             <td><span id="timeOut_${loop.index }" >${not empty row.enddate ? row.enddate : ''}</span></td>
             <td align="right" class="price2">${ row.maxprice>0 ? row.maxprice : row.price }</td>
             <td>${not empty row.auccnt ? row.auccnt : '0' }</td>
             <td>${ row.p_like }</td>
             <td id="divide_${ loop.index}"> ${ not empty row.enddate ? row.enddate : '' }</td>
             <td><button class="btn1" onclick="deletepidx(${ row.pidx });">삭제</button></td>
             
         <script>
    	//경매종료시간
      if(${not empty row.enddate}){
      	var endTime = `<c:out value="${row.enddate}" />`;
      	console.log("endtime : "+endTime);
      	countDownTimer('timeOut_'+${loop.index }, endTime);
      }
    
       var now = new Date();
       var dDate = new Date('${ row.enddate }');
       var maxPrice = ${row.maxprice};
       if (dDate <= now) {
           if (maxPrice != null) { $('#divide_' + ${loop.index}).html('낙찰완료').css('color', 'red');
           } else { $('#divide_' + ${loop.index}).html('유찰').css('color', '#c0c0c0');  }
       } else { $('#divide_' + ${loop.index}).html('경매중').css('color', 'blue');}
       </script>
       
         </tr>
	</c:forEach>        
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
</div>
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
<script src="/js/atelier.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('ul.sidebar li').removeClass( 'active' );
	$('ul.sidebar li a').removeClass( 'active' );
	$('ul.sidebar li:eq(5)').addClass( 'active' );
	$('ul.sidebar li:eq(5) a').addClass( 'active' );
});
</script>