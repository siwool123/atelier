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
		if(distDt<=0){
			clearInterval(timer);
			document.getElementById(id).innerHTML = '경매종료';
			//setEndAuction(); //경매가 종료표시되는 요소를 변경시킴
			$('.auction').prop('disabled', true);
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

<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(3) {background-color: black;}
.leftmenu li:nth-child(3) a, .leftmenu li:nth-child(3) a i {color:white}
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
.btn12 {padding: 0 10px !important; position: relative; left: 15px;}
</style>
</head>
<body>
<%@ include file="index.jsp" %>
    <div class="container" style="margin-bottom:80px;">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-5" style="margin-top:10px;">참여경매 ${not empty auplist ? auplist.size() : "0" }</div>
			
			<div style="color:red">낙찰후 낙찰자에게 메일과 문자, 앱알림이 전송됩니다. 낙찰후 72시간 이내 미결제시 한달간 입찰이 제한됩니다.</div>
			<div class="mt-5 param" style="height:80px;">
				<a href="?aucstatus=aa" class="btn1" id="aa">낙찰완료</a> 
				<a href="?aucstatus=bb" class="btn1" id="bb">경매종료</a> 
				<a href="?aucstatus=cc" class="btn1" id="cc">경매중</a> 
				<form action="" style="display:inline; float:right">
				<input type="date" name="dmin" id="datepicker1"> ~  <input type="date" name="dmax" id="datepicker2"> 
                <button type="submit" id="search"> 조회 </button>
                </form>
			</div>
			
			 <table class="table table-hover table1">
			   <thead class="table-secondary">
			     <tr align="center" style="height:40px">
			       <th>구분/상태</th>
			       <th colspan="2">작품정보</th>
			       <th>마감일자/남은시간</th>
			       <th>시작가(원)</th>
			       <th>입찰최고가(원)</th>
			       <th>내입찰가(원)</th>
			     </tr>
			   </thead>
			   <tbody>
			<c:choose> 
				<c:when test="${ empty auplist }">
				<tr><td colspan="8" align="center">입찰한 내역이 없습니다.</td></tr>
				</c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ auplist }" var="row" varStatus="loop">
					     <tr id="orderItem_${ loop.index}">
					       <td align="center" id="divide_${ loop.index}">${ row.enddate }</td>
					       <script>
					       var now = new Date();
					       var dDate = new Date('${ row.enddate }');
					       if(dDate<=now && ${row.aprice}==${row.maxprice}){
					    	   $('#divide_'+${ loop.index}).html('<div>낙찰완료</div><button class="btn1 btn11">결제하기</button>');
					    	   $('#divide_'+${ loop.index}).css('color', 'red');
					       } 
					       if(dDate<=now && ${row.aprice}!=${row.maxprice}){
					    	   $('#divide_'+${ loop.index}).html('<div>경매종료</div>낙찰불발');
					    	   $('#divide_'+${ loop.index}).css('color', '#c0c0c0');
					       }
					       if(dDate>now){
					    	   $('#divide_'+${ loop.index}).html('<div>경매중</div><button class="btn1 btn12 mt-2">입찰가변경</button>');
					    	   $('#divide_'+${ loop.index}).css('color', 'blue');
					       }
					       </script>
					       
					       <td align="center"><a href="/view?pidx=${ row.pidx }">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</a></td>
					       	<td align="left"><a href="view?pidx=${ row.pidx }"><b > ${ row.title }</b><br/>  ${row.m_name } <br />
					       	${row.size1 } x ${row.size2 } cm					       	
					       	</a></td>
					       	<td align="center">${row.enddate } <br/><span id="timeOut_${ loop.index}">0</span> </td>
					       	
					       	<script>
							//경매종료시간
							var now = new Date();
					       var dDate = new Date('${ row.enddate }');
							if(dDate-now>0){
								var endTime = '<c:out value="${row.enddate}" />';
								console.log("endtime : "+endTime);
								countDownTimer('timeOut_'+${ loop.index}, endTime);
							}
							</script>
					       	
					       <td align="right"><span class="price2">${row.price }</span></td>
					       <td align="right"><span class="price2">${ not empty row.maxprice ? row.maxprice : row.aprice }</span></td>
					       <td align="right"><span class="price2" style="color:red">${row.aprice }</span></td>
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