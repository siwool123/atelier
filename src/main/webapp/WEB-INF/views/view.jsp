<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="./js/atelier.js"></script> 
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">

$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
 	$('#kakaotalk-sharing-btn').click(function(){$(this).removeClass('active');});
 	
	$('.plike').click(function(){
 		if('${user_id}'=='') {alert('로그인이 필요합니다.'); return;}  
		$.ajax({
			type : 'get', //전송방식
			contentType : 'text/html;charset:utf-8', //컨텐츠타입
			dataType : 'json', //콜백데이터 타입
			url : 'rest/plike?pidx=${pdto.pidx}', 
			data : {pidx : ${pdto.pidx}},
			success : sucFunc,
			error: function (jqXHR, textStatus, e) {
                console.error('AJAX Error:', textStatus, e);
                alert('찜 추가삭제가 작동하지 않습니다.');
            }
		});
	}); 
	$('.cart').click(function(){
 		if('${user_id}'=='') {alert('로그인이 필요합니다.'); return;}  
 		$.ajax({
			type : 'get', //전송방식
			contentType : 'text/html;charset:utf-8', //컨텐츠타입
			dataType : 'json', //콜백데이터 타입
			url : '/rest/cart', 
			data : {pidx : ${pdto.pidx}},
			success : sucFunc2,
			error: function (errD) {console.log(errD.status+" : "+errD.statusText);
				alert('장바구니 담기 실패');}
		});
	}); 
	
	$('.pay').click(function(){
 		if('${user_id}'=='') {alert('로그인이 필요합니다.'); return;}  
 		var pidx = getParameterByName('pidx');
 		window.location.href = '/member/paynow?pidx='+pidx;
	}); 
	
	$('.thumb').click(function(){
		if('${user_id}'=='') {alert('로그인이 필요합니다.'); return;}  
		
		alert("리뷰 도움돼요 1 증가");
		$(this).css({'background-color':'red', 'color':'white'});
		let params = {pidx : ${pdto.pidx}};
		$.post('/rest/thumbplus', params, function(resD){
			console.log('콜백데이터', resD);
			$('.thumb2').html(parseInt($('.thumb2').text())+1);
		});
	});
});
function sucFunc(resD){
	console.log('콜백데이터', resD);
	var plike = $('.plike');
	if(resD==1) {
		plike.css({'color':'red'});
		$('.plkcnt').html(parseInt($('.plkcnt').html())+1);
		alert("찜에 추가되었습니다. 마이페이지 > 내공간에찜 에서 확인가능합니다.");
	}else if(resD==-1) {
		plike.css({'color':'grey'});
		$('.plkcnt').html(parseInt($('.plkcnt').html())-1);
		alert("찜에서 삭제되었습니다.");
	}else alert("찜 추가삭제가 작동하지 않습니다.");
}
function sucFunc2(resD){
	console.log('장바구니 콜백데이터', resD);
	var cart = $('.cart');
	if(resD==1) {
		alert("장바구니에 추가되었습니다.");
		cart.text($(this).text() + ' 1');
		if(confirm("장바구니로 이동하시겠습니까?")){window.location.href = '/member/cart';}
		
	}else if(resD==-1) { 
		alert("장바구니에 동일 작품이 있습니다. ");
		if(confirm("장바구니로 이동하시겠습니까?")){window.location.href = '/member/cart';}
	
	}else alert("장바구니가 작동하지 않습니다.");
}
</script> 

<style>
th {color:#c5c5c5 !important;}
@media (max-width: 600px) {
  .cart {padding:15px 30px !important;}
  .pay {padding:15px 44px !important}
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
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<%-- <c:set var="user_id" value="
<sec:authorize access="isAuthenticated()"><sec:authentication property="name"/></sec:authorize>
"></c:set> --%>

<div class="container-fluid border-bottom">
    <div class="container">
    <div class="row py-5">
        <div class="col-sm-6 imgback"><div class="image2">
        	<c:if test="${not empty pdto}">
        		<c:set var="imageSource" value="${pdto.sfile.length() > 40 ? pdto.sfile : './uploads/' + pdto.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" data-bs-toggle="modal" data-bs-target="#myModal_img" />
        	</c:if>
        </div></div>
        <div class="col-sm-6">
            <div class="border-bottom fs-5 fw-bolder pb-3 vtitle"> ${not empty pdto ? pdto.title : "등록된 정보가 없습니다."}</div> 
            <c:choose>
            	<c:when test="${not empty pdto and pdto.sold==1 }"><div class="fw-bolder py-3 fs-5" style="color:#af0000;">● SOLD</div></c:when>
            	<c:otherwise><div class="price fw-bolder py-3 fs-5" style="color: #C98A00;">￦ <span class="price2 fs-5">${not empty pdto ? pdto.price : "등록된 정보가 없습니다." }</span></div></c:otherwise>
            </c:choose>
            <table class="table table-borderless ptable">
                <tr><th style="line-height:35px;">ARTIST</th><td>${not empty pdto ? pdto.m_name : "등록된 정보가 없습니다." } <a href="./vartist?aidx=${not empty pdto ? pdto.aidx : '' }" class="btn1 ml-5 abtn" > 작가정보</a></td></tr>
                <tr><th>TYPE</th><td>${not empty pdto ? pdto.p_type : "등록된 정보가 없습니다." }</td></tr>
                <tr><th>SIZE</th><td>${not empty pdto ? pdto.size1 : "0" } X ${not empty pdto ? pdto.size2 : "0" } CM</td></tr>
                <tr><th>FRAMED</th><td>
                    <c:choose>
                        <c:when test="${not empty pdto and pdto.framed == 1 }">YES</c:when>
                        <c:otherwise>NO </c:otherwise>
                 	</c:choose>
                </td></tr>
                <tr><th>YEAR</th><td class="year">${not empty pdto ? pdto.regidate : "등록된 정보가 없습니다." }</td></tr>
            </table>
            <i class="bi bi-heart-fill fs-3 plike"></i> &nbsp;<span style="color:red;" class="plkcnt">${pdto.p_like}</span>
            
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js" integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
<script>  Kakao.init('4c393edf5efc53286ea0bbbec575fce5'); // 사용하려는 앱의 JavaScript 키 입력
</script>
            <a id="kakaotalk-sharing-btn" href="javascript:;" style="position: relative; top: -5px;"><img src="https://cdn-icons-png.flaticon.com/512/2111/2111466.png" style="width:30px; margin-left:20px;" alt="카톡공유버튼" /></a>
<script>
let currentUrl = window.document.location.href;
  Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '${pdto.title}',
      description: '${pdto.m_name}, ${pdto.price} 원',
      imageUrl: '${imageSource}',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: currentUrl,
        webUrl: currentUrl,
      },
    },
    social: {
      likeCount: ${pdto.p_like},
    },
  });
</script>
            <div class="mt-4" style="display: flex; align-items: center;">
            <button class="btn3 cart" ${pdto.sold == 1 ? 'disabled' : ''} style="margin-right:10px;"><i class="bi bi-bag"></i>&nbsp;&nbsp;&nbsp;ADD TO CART</button>
			<button class="btn4 pay" ${pdto.sold == 1 ? 'disabled' : ''}><i class="bi bi-credit-card-2-back"></i>&nbsp;&nbsp;&nbsp;PAY NOW</button></div>
        </div>
    </div>
    </div>
</div>
    <div class="container my-5 py-5">
    <%-- <div>${user_id } 님 로그인을 환영합니다.</div> --%>
    <div class="text-center">
    	<img src="${imageSource}" alt="작품이미지" style="width: 10%; position:relative; left:35%; top:-100px; box-shadow: 2px 2px 4px #636363; z-index: 999;" id="frimg"  />
       <img src="./images/living11.jpg" id="bgimg" style="width: 80%; transform: translate(-9%);" />
       <%-- <c:choose>
       	<c:when test="${ empty pdto.bgimg }">
       		<img src="./images/living11.jpg" id="bgimg" style="width: 80%; transform: translate(-9%);" />
       	</c:when>
       	<c:otherwise>
	       	<img src="./images/${pdto.bgimg }" id="bgimg" style="width: 80%; transform: translate(-9%);" />
       	</c:otherwise>
       </c:choose> --%> 
        
        <p class="my-3"><i class="bi bi-info-circle"></i>&nbsp;작품 및 미리보기 이미지를 무단 사용시 저작권 문제가 발생할 수 있습니다.</p>
    </div>
        <div class="headerL2">ARTIST’S NOTE</div>
        <div class="headerL3">
        <p> ${not empty pdto ? pdto.material : "등록된 정보가 없습니다." }</p>
        ${not empty pdto ? pdto.p_intro : "등록된 정보가 없습니다." }
            <div class="written">written by artist ${not empty pdto ? pdto.m_name : ""}</div>
        </div>

        <div class="headerL2">ARTIST’S INFORMATION</div>
        <div class="headerL3">
            <div class="row mb-4">
                <div class="col-sm-1"> 
            <c:choose>
            	<c:when test="${not empty adto.profiles }"><img src="./uploads/${adto.profiles }" alt="작가프로필이미지" style="width:90px" /></c:when>
            	<c:otherwise><i class="bi bi-person-circle bpc1"></i></c:otherwise>
            </c:choose>
                </div>
                <div class="col-sm-11 pl">
                    <b>${not empty pdto ? pdto.m_name : "등록된 정보가 없습니다." }</b> <br/>
                    <p>${not empty adto ? adto.a_intro : "등록된 정보가 없습니다." } </p>
                 </div>
            </div>
            ${not empty adto ? adto.a_history : "등록된 정보가 없습니다." }
        </div>
	
	
        <div class="headerL2">REVIEW</div>
        <div class="headerL3">
         <div class="row mb-4">
<c:choose>
	<c:when test="${ empty rdto }"><div class="text-center"> 등록된 리뷰가 없습니다.</div></c:when> 
	<c:otherwise>
            <div class="col-sm-1">
            <c:choose>
	    		<c:when test="${not empty rdto.profiles }"><img src="/uploads/${rdto.profiles }" alt="작성자프로필" style="width:50px; border-radius:50%" /></c:when>
	    		<c:otherwise><i class="bi bi-person-circle bpc2" style="font-size:50px;"></i></c:otherwise>
	    	</c:choose>
            </div>
            <div class="col-sm-11">
                <b>${rdto.m_name}</b> <span class="mx-5">${rdto.r_date}</span> 
                <span>
                <c:forEach var="i" begin="1" end="${rdto.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
                <c:forEach var="i" begin="1" end="${5-rdto.star}"><i class="bi bi-star-fill"></i></c:forEach>
                </span> 
                <span style="color: red; float:right; border-radius: 30px;" class="thumb border py-1 px-4 btn"
                type="button" >리뷰가 도움이 되었나요? <i class="bi bi-hand-thumbs-up fs-3 mx-3"></i> <span class="thumb2">${rdto.r_like }</span></span>
                <%-- <button class="report ms-3">신고&nbsp; ${rdto.report }</button> --%>
                <input type="hidden" name="pidx" id="pidx"  value="${rdto.pidx }" />
                <div class="my-4">${rdto.r_content}</div>
                <div class="rimg">
                <i class="bi bi-zoom-in"></i>
                <img src="./uploads/${ rdto.sfile1 }" class="img2" alt="리뷰이미지1" data-bs-toggle="modal" data-bs-target="#myModal_${rdto.pidx }" />
                <c:if test="${rdto.sfile2 !=null }"><i class="bi bi-zoom-in"></i>
                <img src="./uploads/${ rdto.sfile2 }" class="img2" alt="리뷰이미지2" data-bs-toggle="modal" data-bs-target="#myModal_${rdto.pidx }" /></c:if>
                <c:if test="${rdto.sfile3 !=null }"><i class="bi bi-zoom-in"></i>
                <img src="./uploads/${ rdto.sfile3 }" class="img2" alt="리뷰이미지3" data-bs-toggle="modal" data-bs-target="#myModal_${rdto.pidx }" /></c:if>
                </div>
            </div>
	</c:otherwise>
</c:choose>            
        </div>
        </div>

        <div class="headerL2"><i class="bi bi-gift icon"></i>세상에 하나뿐인 원화 작품을 소장하거나 선물해 보세요.</div>
        <div class="headerL3">세상에 하나뿐인 원화 작품을 소장하거나 선물해 보세요. <br/>
            아뜰리에에서 판매 중인 모든 그림은 인증된 작가가 그린 원화 (Original painting) 입니다. <br/>
            원화 그림은 원화만의 특별한 고유성과 감동을 가져다 주며, 작가의 활동 및 경력이 쌓일 수록 작품 가치가 올라갈 수 있습니다. 
        </div>

        <div class="headerL2"><i class="bi bi-cart icon"></i>구매 및 배송</div>
        <div class="headerL3" style="padding-left: 50px !important;">
            <div class="row">
                <div class="col-sm-3 proc mt-3"><span class="text-center">마음에 드는 작품을 선택하세요.</span><i class="bi bi-chevron-right"></i></div>
                <div class="col-sm-3 proc mt-3"><span class="text-center">구매하기를 눌러 <br/>배송정보를 입력하세요.</span><i class="bi bi-chevron-right"></i></div>
                <div class="col-sm-3 proc mt-3"><span class="text-center">카드결제 또는 무통장입금으로 <br/>결제해 주세요.</span><i class="bi bi-chevron-right"></i></div>
                <div class="col-sm-3 proc mt-3"><span class="text-center">그림의 검수 및 포장 후 인증서와 <br/>함께 배송됩니다. (5~10 영업일)</span></div>
            </div> 
        </div>

        <div class="headerL2"><i class="bi bi-arrow-counterclockwise icon"></i>교환 및 환불</div>
        <div class="headerL3">
            <ul style="list-style: disc !important;">
                <li><span style="font-size: 6px; margin-right:10px">●</span> 상품 특성상 추가 재고가 없기 때문에 교환이 불가하며, 아래 사항에 해당하는 경우 7영업일 이내 환불이 가능합니다.
                    <ul style="margin-left:20px;">
                        <li>- 실제 작품의 내용이 표기된 내용과 상이한 경우</li>
                        <li> - 배송중 파손되었을 경우</li>
                        <li> - 위작 또는 명시되지 않은 모작의 경우</li>
                    </ul>
                </li>
                <li><span style="font-size: 6px; margin-right:10px">●</span> 작품 배송 전, 훼손/결함 또는 기타 작가의 사정으로 인해 작품을 판매할 수 없는 경우 부득이하게 자동 환불처리될 수 있습니다.</li>
            </ul>
        </div>
<div class="row">
        <div class="headerL2 mb-5 col-sm-11">이 작가의 판매중인 다른 작품을 확인해보세요.</div>
        <div class="col-sm-1 varrow" style="position:relative; top:100px; "> <i class="bi bi-chevron-left slbtn"></i><i class="bi bi-chevron-right slbtn"></i></div>
 </div>       
        <div class="swiper swiper-container sc2">
            <div class="swiper-wrapper" >
            	<c:if test="${not empty aplist }">
            	<c:forEach items="${aplist }" var="row" varStatus="status">
                <div class="swiper-slide arttile2" > 
                    <div class="image"><a href="./view?pidx=${row.pidx }"> 
		               <c:choose>
		                   	<c:when test="${row.sfile.length()>40 }"><img src="${row.sfile }" alt="" /></c:when>
		                   	<c:otherwise><img src="../uploads/${row.sfile }" alt="" /></c:otherwise>
		               </c:choose>
               			</a>
                    </div>
                    <div class="sub p-3">
                        <div class="title mb-2 fw-bolder" style="font-size: 15px !important;">${row.title }</div>
                        <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.m_name }</div>
                        <div class="p_type">${row.p_type }, <span class="year">${row.regidate }</span> <br/>${row.size1 } x ${row.size2 } cm </div>
                        <c:choose>
		                   	<c:when test="${row.sold==1 }"><div class="price mt-1" style="color:#af0000;">● SOLD</span></div></c:when>
		                   	<c:otherwise><div class="price mt-1">￦ <span class="price2">${row.price }</span></div></c:otherwise>
		                </c:choose>
                    </div>
                </div>
                </c:forEach>
                </c:if>
            </div>
            
        </div>
    </div>
<%@ include file="./include/footer.jsp" %>
<div class="modal" id="myModal_img">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header" style="border-radius:0 !important;">
        <h4 class="modal-title fw-bolder">${pdto.title} </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <c:set var="imgsize" value="${pdto.size1 / pdto.size2 >1.7 ? 'width' : 'height' }" />
      <div class="modal-body text-center" style="height:88vh"> <img src="${imageSource}" style="${imgsize}:100%" /> </div>

    </div>
  </div>
</div>

<div class="modal" id="myModal_${rdto.pidx }">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="border-radius:0 !important;">
        <h4 class="modal-title fw-bolder">리뷰 상세 이미지 </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center" style="height:88vh">
          <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="/uploads/${rdto.sfile1 }" class="d-block mx-auto" alt="..."> </div>
                <c:if test="${rdto.sfile2 !=null }"><div class="carousel-item">
                  <img src="/uploads/${rdto.sfile2 }" class="d-block mx-auto" alt="..."> </div></c:if>
                <c:if test="${rdto.sfile3 !=null }"><div class="carousel-item">
                  <img src="/uploads/${rdto.sfile3 }" class="d-block mx-auto" alt="..."> </div></c:if>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <i class="bi bi-chevron-left prev"></i>
                  <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <i class="bi bi-chevron-right next"></i> 
                  <!-- <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
                <span class="visually-hidden">Next</span>
              </button>
            </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>