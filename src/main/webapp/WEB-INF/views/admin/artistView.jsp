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
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function memberLeave(midx){
	//enabled를 0으로 변경한다.
	let fm = document.stateChange;
	fm.method = "post";
	fm.midx.value = midx;
	fm.action = "/admin/memberLeave";
	if(confirm("강제탈퇴 처리하시겠습니까?"))
		fm.submit();
}
function memberDelete(midx){
	//delete 한다. 
	let fm = document.stateChange;
	fm.method = "post";
	fm.midx.value = midx;
	fm.action = "/admin/memberDelete";
	if(confirm("영구삭제 처리하시겠습니까?"))
		fm.submit();
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
                    <h3 class="mb-3 text-gray-800 fw-bolder">작가관리 > 작가상세보기</h3>
                    <p class="mb-4"> ${error }  </p>
<div class="row">
	<div class="col-sm-6">
	<div class="row">
		<div class="col-sm-3">
			<c:choose>
				<c:when test="${not empty adto.profiles }"><img src="./uploads/${adto.profiles }" alt="작가프로필이미지" style="width:90%" /></c:when>
				<c:otherwise><i class="bi bi-person-circle bpc1"></i></c:otherwise>
			</c:choose>
		</div>
		<div class="col-sm-9">
			<table class="table introtable" id="dataTable" width="100%" cellspacing="0">
	          <tr><th>작가번호</th> <td>${not empty adto ? adto.aidx : '' }</td></tr>
	          <tr><th>회원번호</th>  <td>${not empty adto ? adto.midx : '' }</td></tr>
	           <tr><th>작가명</th>  <td>${not empty adto ? adto.m_name : '' }</td></tr>
	           <tr><th>작가등록일</th>  <td>${not empty adto ? adto.regidate : '' }</td></tr>
	          <tr> <th>구독수</th>  <td>${not empty adto ? adto.subscriber : '' }</td></tr>
	          <tr> <th>찜수</th>  <td>${not empty adto ? adto.tlike : '' }</td></tr>
	          <tr> <th>리뷰별점평균</th>  <td>${not empty staravg ? staravg : '' }</td></tr>
	          <tr><th>등록작품수</th>  <td>${not empty adto ? adto.totalpcnt : '' }</td></tr>
	           <tr><th>총매출(원)</th>  <td>${not empty adto ? adto.sales : '' }</td></tr>
	           <tr><th>정산계좌</th>  <td>${not empty adto ? adto.bank+' '+adto.account+' '+adto.owner : '' }</td></tr>
	        </table>
		</div>
	</div>
	
	<div class="headerL2" style="clear: both;">작가소개</div>
	<div class="headerL3"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." } </div>
	
	</div>
	<div class="col-sm-6">
		<div class="headerL2" style="margin-top:10px !important;">작가이력</div>
		<div class="headerL3"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </div>
	</div>
</div>

      <div class="headerL2">판매작품 ${not empty naplist ? naplist.size() : '0' }
<a href="?status=aa" class="btn1 btn13" id="aa">판매중</a>                    		
<a href="?status=bb" class="btn1 btn13" id="bb">판매완료</a>  </div>
                    
<div class="table-responsive">
	 <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
	     <thead class="table-secondary">
	         <tr align="center">
	             <th>번호</th>
	             <th>작품등록일</th>
	             <th>이미지</th>
	             <th>작품명</th>
	             <th>사이즈(cm)</th>
	             <th>주제</th>
	             <th>타입</th>
	             <th>판매가(원)</th>
	             <th>찜</th>
	             <th>상태</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty naplist }"> 
	<tr> <td colspan="10" align="center">  등록된 작품이 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
	<c:forEach items="${ naplist }" var="row" varStatus="loop">    
         <tr>
             <td> ${ row.pidx }  </td>
             <td> ${ row.regidate }  </td>
             <td><a href="/view?pidx=${ row.pidx }">
				<c:set var="imageSource" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" class="img1" /> </a></td>
             <td>${ row.title }</td>
             <td>${ row.size1 } x ${{row.size2 } </td>
             <td>${ row.theme }</td>
             <td> ${ row.p_type }</td>
             <td class="price2">${ row.price }</td>
             <td>${ row.p_like }</td>
             <td> ${ row.sold eq 1 ? '<span style="red">판매완료</span>' : '판매중' }</td>
         </tr>
	</c:forEach>        
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
</div>

<div class="headerL2">경매작품 ${not empty aplist ? aplist.size() : '0' }
<a href="?aucstatus=aa" class="btn1 btn13" id="aa">경매중</a>   
<a href="?aucstatus=bb" class="btn1 btn13" id="bb">유찰</a>                  		
<a href="?aucstatus=cc" class="btn1 btn13" id="cc">낙찰완료</a>  </div>
                    
<div class="table-responsive">
	 <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
	     <thead class="table-secondary">
	         <tr align="center">
	             <th>번호</th>
	             <th>작품등록일</th>
	             <th>이미지</th>
	             <th>작품명</th>
	             <th>사이즈(cm)</th>
	             <th>주제/타입</th>
	             <th>입찰최고가</th>
	             <th>남은시간</th>
	             <th>찜</th>
	             <th>상태</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty aplist }"> 
	<tr>  <td colspan="10" align="center"> 등록된 작품이 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
	<c:forEach items="${ naplist }" var="row" varStatus="loop">    
         <tr>
             <td> ${ row.pidx }  </td>
             <td> ${ row.regidate }  </td>
             <td><a href="/view?pidx=${ row.pidx }">
				<c:set var="imageSource" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" class="img1" /> </a></td>
             <td>${ row.title }</td>
             <td>${ row.size1 } x ${{row.size2 } </td>
             <td>${ row.theme }<br/> ${ row.p_type }</td>
             <td class="price2">${ not empty row.maxprice ? row.maxprice : row.price }</td>
             <td><span id="timeOut_${loop.index }" >${row.enddate}</span></td>
             <td>${ row.p_like }</td>
             <td id="divide_${ loop.index}"> ${ row.enddate }</td>
      <script>
    //경매종료시간
      if(${not empty row.enddate}){
      	var endTime = `<c:out value="${row.enddate}" />`;
      	console.log("endtime : "+endTime);
      	countDownTimer('timeOut_'+${loop.index }, endTime);
      }
    
       var now = new Date();
       var dDate = new Date('${ row.enddate }');
       if(dDate<=now && ${row.maxprice}!=null){
    	   $('#divide_'+${ loop.index}).html('낙찰완료').css('color', 'red');
       } 
       if(dDate<=now && ${row.maxprice}==null){
    	   $('#divide_'+${ loop.index}).html('유찰').css('color', '#c0c0c0');
       }
       if(dDate>now){ $('#divide_'+${ loop.index}).html('경매중').css('color', 'blue');  }
       </script>
             
         </tr>
	</c:forEach>        
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
</div>

                </div>
    </div>
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
	$('ul.sidebar li:eq(3)').addClass( 'active' );
	$('ul.sidebar li:eq(3) a').addClass( 'active' );
	
	var intro = $('.intro').text();
	if(intro.lenth>200) { $('.intro').html(intro.substring(0, 100)+'...'); }
});
</script>