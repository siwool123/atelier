<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="./js/atelier.js"></script>
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
    $(".year").each(function() { $(this).text($(this).text().slice(0, 4));});
    $(".price2").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$(".price3 b").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$('#kakaotalk-sharing-btn').click(function(){$(this).removeClass('active');});
 	
 	$('.plike').click(function(){
 		/* if(${user_id}==null) {alert('로그인이 필요합니다.'); return;} */
 		var plike = $(this);
		$.post('./member/rest/plike', {pidx:'${pdto.pidx}'}, function(resD){
			console.log('콜백데이터', resD);
			if(resD==1) {
				plike.css({'color':'red'});
				$('.plkcnt').html(parseInt($('.plkcnt').html())+1);
				alert("찜에 추가되었습니다. 마이페이지 > 내공간에찜 에서 확인가능합니다.");
			}else if(resD==-1) {
				plike.css({'color':'grey'});
				$('.plkcnt').html(parseInt($('.plkcnt').html())-1);
				alert("찜에서 삭제되었습니다.");
			}
		}); 
	});
  });

// 3자리마다 컴마를 찍는 함수
function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
function getParameterByName(name) { 
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script> 

<style>
th {color:#c5c5c5 !important;}
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>

<div class="container-fluid border-bottom">
    <div class="container">
    <div class="row py-5">
        <div class="col-sm-6 imgback"><div class="image2">
        	<c:if test="${not empty pdto}">
        		<c:set var="imageSource" value="${pdto.ofile.length() > 40 ? pdto.ofile : './uploads/' + pdto.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" />
        	</c:if>
        </div></div>
        <div class="col-sm-6">
            <div class="border-bottom fs-5 fw-bolder pb-3 vtitle"> ${not empty pdto ? pdto.title : "등록된 정보가 없습니다."}</div> 
            <c:choose>
            	<c:when test="${not empty pdto and pdto.sold==1 }"><div classice fw-bolder py-3 fs-5" style="color:#af0000;">● SOLD</span></div></c:when>
            	<c:otherwise><div class="price fw-bolder py-3 fs-5" style="color: #C98A00;">￦ <span class="price2 fs-5">${not empty pdto ? pdto.price : "등록된 정보가 없습니다." }</span></div></c:otherwise>
            </c:choose>
            <table class="table table-borderless ptable">
                <tr><th style="line-height:35px;">ARTIST</th><td>${not empty pdto ? pdto.m_name : "등록된 정보가 없습니다." } <a href="./artist?aidx=${not empty pdto ? pdto.aidx : '' }" class="btn1 ml-5 abtn" > 작가정보</a></td></tr>
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
            <a id="kakaotalk-sharing-btn" href="javascript:;"><img src="https://cdn-icons-png.flaticon.com/512/2111/2111466.png" style="width:30px; margin-left:20px;" alt="카톡공유버튼" /></a>
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
            <form action="./cart?pidx=${pdto.pidx}" name="cartfrm" ><button type="submit" class="btn3" ${pdto.sold == 1 ? 'disabled' : ''}><i class="bi bi-bag"></i>&nbsp;&nbsp;&nbsp;ADD TO CART</button></form>
            <form action="./pay?pidx=${pdto.pidx}" name="payfrm"><button type="submit" class="btn4" ${pdto.sold == 1 ? 'disabled' : ''}><i class="bi bi-credit-card-2-back"></i>&nbsp;&nbsp;&nbsp;PAY NOW</button></form></div>
        </div>
    </div>
    </div>
</div>
    <div class="container my-5 py-5">
    <div class="text-center">
    	<img src="${imageSource}" alt="작품이미지" style="width: 13%; position:relative; left:35%; top:-100px; box-shadow: 2px 2px 4px #636363; z-index: 999;" id="frimg"  />
        <img src="https://lh3.googleusercontent.com/fife/AK0iWDyUcU4Bi2hZ2Z6mK2g7E_FOL2q4nU7OoC_CzEMlA8ElOzQ0JiUXs4zzKgTNCmHP4Q3qkfYCku8nxQ3fD1Frqq6HuBvMz1n8vXdb8Bv45JUL58CnkESu3ujWC0Ek3o_-0L7XMmDgVeKD3i9mNgYXT-iAOOx-qcbNsjmGkL-q0_Pr5FV47kt1xWqTGocBuPf3s0jER8z9hs3vrdJTRlcQWechKQhYDbbKj95xcWJaDQmKbtf4o--pd1G5qes7ABuWhwu-dCrsPMw7qQKNjfDmjxPYwdPT6NbohhlZwfzpvfqbuIxwz1aJHdhgbe3W29InyGOMnnJXV0xX9-x2c_k2AwdAeWmVRP1tdP7DJpgV0IaPG4Ug68O8vZ4z9eTtcvhHSp4pyDTEPdzlmfwad5HvSmzGiLV7doVrpfH9pVDYre-AOnofujXwf74QnTprRR8PPmYmsW_EgpsRz9Qh7iAcCZtoa3CpTagAlPDqq1BM_iqnywTGB3r7XZ2QrmfKIpYi3apgrhEqQlCJIzBbCvrTJQf3cIEgmb41Y_Br8v-3IJEHACt1DH8rIAvcGvyieaDJbvChOexh7nmclmZooeHqiI-VewVEzEZbIb29oNyBOXYCWKWL5cpoTZa4NPGWZbdL8HMIKbo1T6PLJaXWq68XQEOabFu92ChIORabxCc6DREWDrL-GbgIIVxGOwtasmy4mwjXo1hu7Vz6rqc_itdWcUyQQZ733qmw2NvqGzOIjmTaIIr7uc8tI5bMzVbGTVruXIceJuhEQCzOxl-eLGWhW-nkR9zQxhK6qKLZSED9rzh-_BNV0M8CU1exJ1y312zIljmSd0lvsMy5NH4TVLgyEatvuVXLt7HqYjHygqKtkZzr7P3p2Tlhz7JXGM-S54tmGcXeM5KJF-ZK9VSk4AUJDsXX5U2I_WNvFGlwnp83YiW96t1GO1_FXBIYNYYupXHPiWsppeJr2H2Z6yG9046FrP4VsL0LCspwoY8f2gvdrT-xEpZ1ZpfpVpcPWsg0fxsjTG1g4R8jJFKv723u00COVR9f5jE57ACkgPByax5v1eAxU_DiFhcMdgWmLpCZe_77Cs2TNNtxw1YMoBrZJ9v_XNQZagNR8wmFwEohkvickjdbqMZcNXxpAWE5TwJBnFRa7m_ClHVoYiJW3yEnQA13lw6rEhPiu5qDAf4-f52Ju-dL33_FWDcSWhoETxwy6aALIeK9Z27t1d5HA1PX177J3hO9lYDhzA1DRD_wag9Ao0UO0jprAiuxSmHCtobGViSVaBD3-guWD-qNi0AVIoz3Ywf1NOVvRcr6c5gHripYRWJBUY0OR4Zs1NIeSla7QEtJqEiX4ebJg8pdPHf6MpiSDV_poA-9cQ5uG5HQyMMgEePuBVJ7CzS5uBgCbxaASd8bqnd4Ndw4y1Y_XW3ByvP79eP6R3bj5TySKoEtq1-NOVMwUZmgMjsu7OGkRFuK-FX5fkLjdRSrgYe_-hQEbWEIoXAp-yziQS_xjU54K7uzVdi0OZGxcP3CPznlCQ" 
        	id="bgimg" style="width: 80%; transform: translate(-9%);" />
        <p class="my-3"><i class="bi bi-info-circle"></i>&nbsp;작품 및 미리보기 이미지를 무단 사용시 저작권 문제가 발생할 수 있습니다.</p>
    </div>
        <div class="headerL2">ARTIST’S NOTE</div>
        <div class="headerL3">${not empty pdto ? pdto.p_intro : "등록된 정보가 없습니다." }
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
            <div class="col-sm-1"> <i class="bi bi-person-circle bpc2"></i></div>
            <div class="col-sm-11">
                <b>${rdto.m_name}</b> <span>${rdto.r_date}</span> <span><i class="bi bi-star-fill starActive"></i><i class="bi bi-star-fill starActive"></i>
                <c:forEach var="i" begin="1" end="${rdto.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
                <c:forEach var="i" begin="1" end="${5-rdto.star}"><i class="bi bi-star-fill"></i></c:forEach>
                </span> 
                <i class="bi bi-heart-fill fs-4"></i><span>도움돼요</span><span style="color: red;">${rdto.r_like }</span><br/>
                <div class="my-3">${rdto.r_content}</div>
                <div class="rimg">
                <c:if test="${rdto.sfile1 !=null }"><img src="./uploads/${ rdto.sfile1 }" style="max-width:300px" /></c:if>
                <c:if test="${rdto.sfile2 !=null }"><img src="./uploads/${ rdto.sfile2 }" style="max-width:300px" /></c:if>
                <c:if test="${rdto.sfile3 !=null }"><img src="./uploads/${ rdto.sfile3 }" style="max-width:300px" /></c:if>
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
		                   	<c:when test="${row.ofile.length()>40 }"><img src="${row.ofile }" alt="" /></c:when>
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
</body>
</html>
 
 