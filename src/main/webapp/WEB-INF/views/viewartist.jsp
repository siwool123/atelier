<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<!-- <script src="./js/atelier.js"></script> -->
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
    $(".year").each(function() { $(this).text($(this).text().slice(0, 4));});
    $(".price2").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$(".price3 b").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$('#kakaotalk-sharing-btn').click(function(){$(this).removeClass('active');});
 	
	$('.plike, .vtitle').click(function(){
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
  <div class="container">
    <div class="row py-5">
        <div class="col-sm-6">
        	<div class="row">
        		<div class="col-sm-4 text-center">
	        		<c:choose>
		            	<c:when test="${not empty adto.profiles }"><img src="./uploads/${adto.profiles }" alt="작가프로필이미지" style="width:90%" /></c:when>
		            	<c:otherwise><i class="bi bi-person-circle bpc1"></i></c:otherwise>
		            	 <div>
			                <c:forEach var="i" begin="1" end="${staravg}"><i class="bi bi-star-fill starActive"></i></c:forEach>
			                <c:forEach var="i" begin="1" end="${5-staravg}"><i class="bi bi-star-fill"></i></c:forEach>
		                </div> <!-- 작가의 판매완료된작품이 받은 리뷰의 별점 평균 -->
		            </c:choose>
        		</div>
        		<div class="col-sm-8">
        			<b>${not empty adto ? adto.m_name : "등록된 정보가 없습니다." }</b> 
        			<table class="table table-borderless atable">
		                <tr><th><i class="bi bi-images"></i> ARTWORKS</th><td>${not empty aplist ? aplist.size() : "null" }</td></tr>
		                <tr><th><i class="bi bi-bag-x"></i> SOLD</th><td>${soldsum }</td></tr>
		                <tr><th><i class="bi bi-heart"></i> LIKES</th><td>${likesum }</td></tr>
		                <tr><th><i class="bi bi-bell"></i> SUBSCRIBER</th><td>${not empty adto ? adto.subscriber : "null" }</td></tr>
		            </table>
        		</div>
        	</div>
        	
        	<div class="headerL2">작가소개</div>
		        <div class="headerL3"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." } </div>
        	
        </div>
        <div class="col-sm-6">
            <div class="headerL2">작가이력</div>
		        <div class="headerL3"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </div>
        </div>
    </div>
    
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#onsale">판매중인 작품 ${not empty aplist ? aplist.size()-soldsum : "0" }</a></li>
    <li><a data-toggle="tab" href="#sold">판매완료 작품 ${soldsum }</a></li>
  </ul>
  <div class="tab-content">
    <div id="onsale" class="tab-pane fade in active">
      
      <c:choose>
		<c:when test="${ empty plist0 }"> <div class="text-center"> 등록된 작품이 없습니다.</div></c:when> 
		<c:otherwise> 
		    <c:forEach items="${ plist0 }" var="row" varStatus="loop">  
		    	<div class="arttile mb-5">
	               <div class="image"><a href="./view?pidx=${row.pidx }"> 
	                 <c:set var="imageSource" value="${row.ofile.length() > 40 ? row.ofile : './uploads/' + row.sfile}" />
	   				 <img src="${imageSource}" alt="작품이미지" />
	               </a></div>
	               <div class="sub p-3">
	                   <div class="title mb-2 fw-bolder">${row.title }</div>
	                   <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.m_name }</div>
	                   <div class="ptype">${row.p_type }, <span class="year">${row.regidate }</span> <br/>${row.size1 } x ${row.size2 } cm </div>
	                   <div class="price mt-1">￦ <span class="price2">${row.price }</span></div>
	               </div>
	           </div>
		    </c:forEach>        
		</c:otherwise>    
	  </c:choose>
      <div class="text-center"> ${pagingImg0 } </div>
      
    </div>
    <div id="sold" class="tab-pane fade">
      
      <c:choose>
		<c:when test="${ empty plist1 }"> <div class="text-center"> 등록된 작품이 없습니다.</div></c:when> 
		<c:otherwise> 
		    <c:forEach items="${ plist1 }" var="row" varStatus="loop">  
		    	<div class="arttile mb-5">
	               <div class="image"><a href="./view?pidx=${row.pidx }"> 
	                 <c:set var="imageSource" value="${row.ofile.length() > 40 ? row.ofile : './uploads/' + row.sfile}" />
	   				 <img src="${imageSource}" alt="작품이미지" />
	               </a></div>
	               <div class="sub p-3">
	                   <div class="title mb-2 fw-bolder">${row.title }</div>
	                   <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.m_name }</div>
	                   <div class="ptype">${row.p_type }, <span class="year">${row.regidate }</span> <br/>${row.size1 } x ${row.size2 } cm </div>
	                   <div class="price mt-1" style="color:#af0000;">● SOLD</div>
	               </div>
	           </div>
		    </c:forEach>        
		</c:otherwise>    
	  </c:choose>
		<div class="text-center">	${pagingImg1 }</div>
		
    </div>
  </div>
  
  <div class="headerL2">리뷰 ${not empty rlist ? rlist.size() : "0" } </div>
	<div class="headerL3">
		<c:choose>
		<c:when test="${ empty rlist }"> <div class="text-center"> 등록된 리뷰가 없습니다.</div></c:when> 
		<c:otherwise> 
		    <c:forEach items="${ rlist }" var="row" varStatus="loop">  
		    	
		    <div class="row">	
		    <div class="col-sm-3">
               <div class="image"><a href="./view?pidx=${row.pidx }"> 
                 <c:set var="imageSource" value="${row.psfile.length() > 40 ? row.psfile : './uploads/' + row.psfile}" />
   				 <img src="${imageSource}" alt="작품이미지" style="width:80%;" />
               </a></div>
               <div class="title mb-2 fw-bolder">${row.title }</div>
               <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.a_name }</div>
               <div class="price mt-1" style="color:#af0000;">● SOLD</div>
		    </div>
		    <div class="col-sm-1"> <i class="bi bi-person-circle bpc2"></i></div>
            <div class="col-sm-8">
                <b>${row.m_name}</b> <span>${row.r_date}</span> 
                <span>
                <c:forEach var="i" begin="1" end="${row.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
                <c:forEach var="i" begin="1" end="${5-row.star}"><i class="bi bi-star-fill"></i></c:forEach>
                </span> 
                <i class="bi bi-heart-fill fs-4"></i><span>도움돼요</span><span style="color: red;">${row.r_like }</span><br/>
                <div class="my-3">${row.r_content}</div>
                <div class="rimg">
                <c:if test="${row.sfile1 !=null }"><img src="./uploads/${ row.sfile1 }" style="max-width:300px" /></c:if>
                <c:if test="${row.sfile2 !=null }"><img src="./uploads/${ row.sfile2 }" style="max-width:300px" /></c:if>
                <c:if test="${row.sfile3 !=null }"><img src="./uploads/${ row.sfile3 }" style="max-width:300px" /></c:if>
                </div>
            </div>
		    </div>
		    	
		    </c:forEach>        
		</c:otherwise>    
	  </c:choose>
		<div class="text-center"> ${pagingImgr }</div>
	
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
    </div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>
 
 