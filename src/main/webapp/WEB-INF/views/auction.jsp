<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
<script src="./js/atelier.js"></script>
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready( function() {
	$('#navbarNavAltMarkup div a:eq(1)').addClass( 'active' );
	var maxprice = window.location.href.includes('pmax') ? getParameterByName('pmax') : ${maxPrice}
	$('input#pmax').val(maxprice);
	$('.orderby li a').click( function(){
		$('.orderby li a').removeClass('active');
		$('.orderby li').removeClass('active');
		$(this).addClass('active');
		$(this).parent('li').addClass('active');
	});
	$('a').click( function(){
		$('a').removeClass('active');
		$(this).addClass('active');
	});
	$('.page-link').click(function (e) {
        e.preventDefault(); // 기존의 클릭 이벤트 방지
        var cUrl = window.location.href.includes('pageNum') ? window.location.href.slice(0, -10) : window.location.href;
        if(window.location.href.includes('pageNum') && parseInt(getParameterByName('pageNum'))>9) {
        	cUrl = window.location.href.slice(0, -11);}
        var plValue = $(this).attr('href').replace('/shop?&', ''); // .page-link의 href 값 가져오기
        var separator = cUrl.includes('?') ? '&' : '?';
        window.location.href = cUrl + separator + plValue;
    });
	
    if(window.location.href.includes('pmin')) {$('#range').addClass('active');}
    $(".title").each(function() {$(this).text($(this).text().slice(0, 24)); }   );
  });

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
			setEndAuction(); //경매가 종료표시되는 요소를 변경시킴
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
.auc *, .auc {font-size:12px;}
.sub {height:170px !important}
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<div class="container">
    <div class="mx-auto text-center p-4 border-bottom mt-5">
    	<div class="fw-bolder fs-3">ATELIER AUCTION EVENT    </div>
     퀄리티 높은 작품의 경매에 참여하세요. </div>
   	
        <div class="row">
            <div class="col-sm-3 my-5" style="padding-right: 30px;">
                <div>Total <b style="color: #C98A00;">${totalCount }</b> artworks found.</div>
                <div class="mt-4">
                <a href="./shop" class="btn1" id="total" style="padding:9px 83px; margin-bottom:-1px; ">전체</a><br/>
                <a href="?sell=on" class="btn1" id="onsale" style="padding:9px 30px; ">경매중</a>
                <a href="?sell=so" class="btn1" id="sold" style="padding:9px 20px; margin-left:-5px;">낙찰완료</a><br/>
                </div>

                <div class="headerL">FILTER BY PRICE</div>
                <form name='psearchfrm'  action=''>
                    <!-- <div class="range-slider"><input type="text" class="js-range-slider" value="" /></div> -->
                    <div class="price3">최저가 <span style="float:right"><b>${minPrice }</b> 원 </span><br /> 
                    최고가 <span style="float:right"><b>${maxPrice }</b> 원</span></div><br />
                    <div class="pricerange fw-bolder">  
                        <input type="text" name="pmin" id="pmin" value="${minPrice }" /> ~ <input type="text" name="pmax" id="pmax" value="${maxPrice }" /> 원 <br /><br />
                        <input type="submit" class="btn1 px-3" id="range" style="width:80%" value="적용"/></div><br/>
                </form> 

                <div class="headerL">ARTWORK ORIENTATION</div>
                <ul class="ori" style="height: 120px;">
                    <li><a href="?ori=sq" class="btn1" id="square">SQUARE <p style="width: 50px; height: 50px; margin-top:12px;"></p></a></li>
                    <li><a href="?ori=la" class="btn1" id="landscape">LANDSCAPE <p style="width: 60px; height: 40px; margin-top:23px;"></p></a></li>
                    <li><a href="?ori=po" class="btn1" id="portrait">PORTRAIT <p style="width: 40px; height: 60px; margin-top:2px ;"></p></a></li>
                </ul>

                <div class="headerL">ARTWORK SIZE</div>
                <ul class="size" style="height: 40px;">
                    <li><a href="?size=xs" class="btn1" id="xs">XS</a></li>
                    <li><a href="?size=ss" class="btn1" id="ss">S</a></li>
                    <li><a href="?size=mm" class="btn1" id="mm">M</a></li>
                    <li><a href="?size=ll" class="btn1" id="ll">L</a></li>
                    <li><a href="?size=xl" class="btn1" id="xl">XL</a></li>
                </ul>

                <div class="headerL">CATEGORY</div>
                <ul class="cate" style="height: 110px;">
                <li><a href="?cate=na" class="btn1" id="nature">자연/풍경</a></li>
                <li><a href="?cate=pe" class="btn1" id="people">인물</a></li>
                <li><a href="?cate=an" class="btn1" id="animal">동식물</a></li>
                <li><a href="?cate=ob" class="btn1" id="obj">사물</a></li>
                <li><a href="?cate=ab" class="btn1" id="abs">추상</a></li>
                <li><a href="?cate=ot" class="btn1" id="oth">기타</a></li>
                </ul>

                <div class="headerL">PAINTING TYPE</div>
                <ul class="cate" style="height: 110px;">
                    <li><a href="?ptype=ac" class="btn1" id="acrylic">아크릴</a></li>
                    <li><a href="?ptype=oi" class="btn1" id="oil">유화</a></li>
                    <li><a href="?ptype=wa" class="btn1" id="water">수채화</a></li>
                    <li><a href="?ptype=in" class="btn1" id="ink">수묵화</a></li>
                    <li><a href="?ptype=sk" class="btn1" id="sketch">스케치</a></li>
                    <li><a href="?ptype=mi" class="btn1" id="mix">혼합/기타</a></li>
                </ul>
            </div>
            <div class="col-sm-9 mt-5" >
                <div class="pb-4">
                <ul class="orderby">
                    <li><a href="?orderby=00" class="btn2" id="date">최신순</a></li>
                    <li><a href="?orderby=11" class="btn2" id="heart">인기순</a></li>
                    <li><a href="?orderby=22" class="btn2" id="low">낮은가격순</a></li>
                    <li><a href="?orderby=33" class="btn2" id="high">높은가격순</a></li>
                </ul>
                    <div class="search">
                    <form action="">
                    <input type="text" name="sWord" style="border:none; width: 250px;" placeholder="작가 또는 작품명을 검색하세요" /><button type="submit" id="search"> <i class="bi bi-search fs-5"></i></button>
                    </form>
                    </div>
                </div>
                <div class="my-5" id="show_data">
<c:choose>
	<c:when test="${ empty aplist }"> 
	    <div class="text-center"> 등록된 작품이 없습니다.</div>
	</c:when> 
	<c:otherwise> 
	    <c:forEach items="${ aplist }" var="row" varStatus="loop">    
	    	<div class="arttile mb-5">
               <div class="image"><a href="./auction/view?pidx=${row.pidx }"> 
               <c:choose>
                   	<c:when test="${row.sfile.length()>40 }"><img src="${row.sfile }" alt="작품이미지" /></c:when>
                   	<c:otherwise><img src="./uploads/${row.sfile }" alt="작품이미지" /></c:otherwise>
               </c:choose>
               </a></div>
               <div class="sub p-3">
                   <div class="title mb-2 fw-bolder">${row.title }</div>
                   <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.m_name }</div>
                   <div class="ptype">${row.p_type }, <span class="year">${row.regidate }</span> <br/>${row.size1 } x ${row.size2 } cm </div>
                   
                   <div class="auc"><span>시작가 : <span class="price2">${row.price }</span> 원</span><span style="float:right; color:red">입찰최고가 : <span class="price2">${row.price }</span> 원</span></div>
                   <div class="auc">종료일 : ${row.enddate }</div>
                   <div class="auc">남은시간 : <span id="timeOut_${loop.index }" ></div>
                   
      <script>
    //경매종료시간
      if(${not empty row.enddate}){
      	var endTime = `<c:out value="${row.enddate}" />`;
      	console.log("endtime : "+endTime);
      	countDownTimer('timeOut_'+${loop.index }, endTime);
      }
      </script>
                   
               </div>
           </div>
	    </c:forEach>        
	</c:otherwise>    
</c:choose>
                </div>
                ${pagingImg }
            </div>
        </div>
</div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>
 