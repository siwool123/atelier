<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
	$('a.btn2:first').addClass( 'active' );
	$('a#total').addClass( 'active' );
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
	$('.btn2').click(function (e) {
        e.preventDefault(); // 기존의 클릭 이벤트 방지
        // 현재 URL 가져오기
        var currentUrl = window.location.href.includes('orderby') ? window.location.href.slice(0, -11) : window.location.href;
        var orderbyValue = $(this).attr('href').replace('?', ''); // .btn2의 href 값 가져오기
        // 현재 URL에 이미 매개 변수가 있는지 확인
        var separator = currentUrl.includes('?') ? '&' : '?';
        // 새로운 URL 생성
        var newUrl = currentUrl + separator + orderbyValue;
        // 새로운 URL로 이동
        window.location.href = newUrl;
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
	
    // 모든 .btn2에 대해 순회
    $('.btn2').each(function () {
        var hrefValue = $(this).attr('href').slice(-2);
        // 현재 orderby와 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('orderby') === hrefValue) {  $(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
    $('a.btn1').each(function () {
        var hrefValue2 = $(this).attr('href').slice(-2);
        // 현재 파라미터값과 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('sell') === hrefValue2 || getParameterByName('ori') === hrefValue2 || 
        		getParameterByName('size') === hrefValue2 || getParameterByName('cate') === hrefValue2 || getParameterByName('ptype') === hrefValue2) {  
        	$(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
    
    if(window.location.href.includes('pmin')) {$('#range').addClass('active');}
    
    $(".title").each(function() {$(this).text($(this).text().slice(0, 24)); });
    $(".year").each(function() { $(this).text($(this).text().slice(0, 4));});
    $(".price2").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$(".price3 b").each(function() { $(this).text(numberWithCommas($(this).text()));});
  });

//3자리마다 컴마를 찍는 함수
function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}

 function getParameterByName(name) { 
     name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
     var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
     return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
 }
    /*    if (getParameterByName('pmin')!='') {
        var pmin_vlu = getParameterByName('pmin');
        var pmax_vlu = getParameterByName('pmax');
    } else {var pmin_vlu = min, pmax_vlu = max;}
       var $range = $(".js-range-slider"),
        $inputFrom = $("#pmin"),
        $inputTo = $("#pmax"),
        instance,
        min = ${minPrice}, // 최소 금액
        max = ${maxPrice}, // 최대 금액
        from = 0,
        to = 0;
    $range.ionRangeSlider({
        skin: "round", // 스킨 참고 : http://ionden.com/a/plugins/ion.rangeSlider/skins.html
        type: "double",
        min: min,
        max: max,
        from: pmin_vlu,
        to: pmax_vlu,
        grid: true,
        grid_num: 5,
        grid_snap: false,
        step: 10,
        force_edges: true,
        hide_min_max: false,    // show/hide MIN and MAX labels
        hide_from_to: true,    // show/hide FROM and TO labels
        // onStart: updateInputs,
        onChange: updateInputs,
        onUpdate: updateInputs // 슬라이더가 업데이트될 때도 updateInputs 함수를 호출하도록 추가
    });
    instance = $range.data("ionRangeSlider");
    function updateInputs (data) {
        from = data.from;
        to = data.to;
        $("#ppmin").text(data.from);
        $("#ppmax").text(data.to);
        $inputFrom.prop("value", from);
        $inputTo.prop("value", to);
    }
    $inputFrom.on("input", function () {
        var val = $(this).prop("value");
        // validate
        if (val < min) {val = min;} 
        else if (val > to) {val = to;}
        instance.update({from: val});
    });
    $inputTo.on("input", function () {
        var val = $(this).prop("value");
        // validate
        if (val < from) {val = from;} 
        else if (val > max) {val = max;}
        instance.update({to: val});
    });  */
    </script> 
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container-fluid">
	<div class="swiper swiper-container">
	    <div class="swiper-wrapper" >
	        <div class="swiper-slide" id="container" style="background:black; width:100vw; height:480px; overflow:hidden;">  

  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.1/gsap.min.js'></script>
 <script>
 const n = 7;
 gsap.timeline().set('#container', {perspective:800})
 for (let i=0; i<n; i++){ 
   let b = document.createElement('div');
   b.classList.add('painting');
   document.getElementById('container').appendChild(b);
   gsap.set(b, {
     left:'50%',
   	top:'50%',
     x:'-50%',
     y:'-50%',
     z:300,
   		width:300,
 	  	height:300,
 	 //background:()=>'hsl('+(i/n*300)+',50%,50%)',
     background:()=>'url(../images/painting'+(i+1)+'.jpg)'
   });
   gsap.fromTo(b, {
     scaleY:0,
     zIndex:-i,
     rotationY:90+i/n*185,
     transformOrigin:String("50% 50% -900%")
   },{
	 zIndex:100,
     scaleY:1,
     duration:0.7,
     delay:1-0.5*(i/n),
     ease:'elastic'
   })
   b.onmouseenter = (e)=>{ gsap.to(b, {duration:1, ease:'back.out(5)', perspective:1000, rotationY:0, zIndex:100});
   gsap.set('.painting', { zIndex: 0 });
   gsap.set(b, { zIndex: 100 });
   }  
   // b.onmouseleave = (e)=>{ gsap.to(b, {duration:0.4, rotationX:0, y:'-50%'}); }
 }
 window.onmousemove = (e)=>{
   gsap.to('.painting', {duration:0.6, rotationY:(i)=>45+i/n*185+90*(e.clientX/window.innerWidth) });
 }
 </script>				
				  
	        </div>
	        <div class="swiper-slide text-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.527), rgba(0, 0, 0, 0.5)), url(../images/imgslide_2.jpg); width:100vw; height:480px;">
	        <span> 그림이 주는 감동</span><br />
	        당신만을 위한 작품으로 공간을 바꿔보세요.<br /><br />
	        CHANGE YOUR SPACE WITH <br/>ONLY ONE ORIGINAL PAINTING  
	        <div class="appdown mt-5"><a href=""><img src="../images/googleplay.png" style="width:110px;" /></a><a href=""><img src="../images/appstore.png" style="width:110px;" /></a></div>
	        </div>
	        <div class="swiper-slide text-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.527), rgba(0, 0, 0, 0.5)), url(../images/imgslide_3.jpg); width:100vw; height:480px;">  
	        <div class="container">
	        	<span> AI 큐레이터</span><br /><br />
		        당신의 취향에 맞춰 <br/>고민할 시간을 덜어드립니다. 
		        <div class="appdown mt-5"><a href=""><img src="../images/googleplay.png" style="width:110px;" /></a><a href=""><img src="../images/appstore.png" style="width:110px;" /></a></div>
		        <div style="background:black; width:200px; height:130px; text-align:center; position:relative; top:-150px; left:75%;"><i class="bi bi-heart-fill" style="color:red; font-size:50px; line-height:120px;"></i></div>
		        <img src="../images/ai.png" style="width:280px; position: relative; top: -130px; left: 38%;" />
	        </div>
	        </div>
	    </div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-pagination"></div>
	</div>
</div>

<div class="container">
    <div class="row py-5">
        <div class="col-sm-6 mt-5 fw-bold fs-6 mb-3" style="padding-right:60px; line-height: 24px;">
            아뜰리에는 건강한 미술 생태계를 꿈꾸고 있습니다.<br/>
    소수에게 주어진 기회로 역량 있는 작가의 활동기회가 박탈되지 않기 위한 방안이 무엇인지 고민하고, 대중과 미술이 보다 쉽게 소통할 수 있는 환경을 조성합니다.
        </div>
        <div class="col-sm-2 original text-center">
            <i class="bi bi-easel" style="font-size: 50px;"></i><i class="bi bi-palette" style="font-size: 30px;"></i><br/>
            <b>ORIGINAL</b><br/>
            <p class="mt-2">세상에 단 하나뿐인 원화</p>
        </div>
        <div class="col-sm-2 original text-center">
            <i class="bi bi-people" style="font-size: 50px;"></i><br/>
            <b>QUALITY </b><br/>
            <p class="mt-2">엄선된 최고의 신인작가들</p>
        </div>
        <div class="col-sm-2 original text-center">
            <i class="bi bi-gift" style="font-size: 50px;"></i><br/>
            <b>EASY </b><br/>
            <p class="mt-2">모바일앱 + 온라인결제<br/> + 무료배송</p>
        </div>
    </div>
    </div>
    <div class="container-fluid text-center p-4" style="background-color: #EBE5D6;">
        <b class="fs-3">ATELIER ART SHOP</b><br/>
        <span style="color:#af0000;">● </span> 표시는 아뜰리에에서 판매된 작품입니다. 구매시 작품보증서를 동봉해드립니다.
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-3 my-5" style="padding-right: 30px;">
                <div>Total <b style="color: #C98A00;">${totalCount }</b> artworks found.</div>
                <div class="mt-4">
                <a href="./shop" class="btn1" id="total" style="padding:9px 83px; margin-bottom:-1px; ">전체</a><br/>
                <a href="?sell=on" class="btn1" id="onsale" style="padding:9px 30px; ">판매중</a>
                <a href="?sell=so" class="btn1" id="sold" style="padding:9px 20px; margin-left:-5px;">판매완료</a></div>

                <div class="headerL">FILTER BY PRICE</div>
                <form name='psearchfrm'  action=''>
                    <!-- <div class="range-slider"><input type="text" class="js-range-slider" value="" /></div> -->
                    <div class="price3">최저가 <b>${minPrice }</b> 원 <br /> 최고가 <b>${maxPrice }</b> 원</div><br />
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
	<c:when test="${ empty plist }"> 
	    <div class="text-center"> 등록된 작품이 없습니다.</div>
	</c:when> 
	<c:otherwise> 
	    <c:forEach items="${ plist }" var="row" varStatus="loop">    
	    	<div class="arttile mb-5">
               <div class="image"><a href="./view?pidx=${row.pidx }"> 
               <c:choose>
                   	<c:when test="${row.sfile.length()>40 }">
               			<img src="${row.sfile }" alt="" />
               		</c:when>
                   	<c:otherwise>
                   		<img src="./uploads/${row.sfile }" alt="" />
                	</c:otherwise>
               </c:choose>
               </a></div>
               <div class="sub p-3">
                   <div class="title mb-2 fw-bolder">${row.title }</div>
                   <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.m_name }</div>
                   <div class="ptype">${row.p_type }, <span class="year">${row.regidate }</span> <br/>${row.size1 } x ${row.size2 } cm </div>
                   <c:choose>
                   	<c:when test="${row.sold==1 }">
                   		<div class="price mt-1" style="color:#af0000;">● SOLD</span></div>
                   	</c:when>
                   	<c:otherwise>
                   		<div class="price mt-1">￦ <span class="price2">${row.price }</span></div>
                   	</c:otherwise>
                   </c:choose>
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
 