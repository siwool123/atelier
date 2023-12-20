<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!-- 레프트메뉴 등... -->
<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(7) {background-color: black;}
.leftmenu li:nth-child(7) a, .leftmenu li:nth-child(7) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
#applyImg1,
#applyImg2,
#applyImg3,
#applyImg4,
#applyImg5,
#applyImg6,
#applyImg7,
#applyImg8,
#applyImg9,
#applyImg10 {
	max-width: 100px;
	max-height: 100px;
}
.headerL2 {margin-top: 10px !important;}
</style>


<%@ include file="index.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
			
			<ul class="nav nav-tabs" style="width: 201px; float: right;">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="sell-tab" data-bs-toggle="tab" data-bs-target="#sellP" type="button" role="tab" aria-controls="sell" aria-selected="false" onClick="location.href='/member/apply'">
						작가 신청
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="auction-tab" data-bs-toggle="tab" data-bs-target="#auctionP" type="button" role="tab" aria-controls="sell" aria-selected="true" onClick="location.href='/member/applyResult'">
						작가 신청 결과
					</button>
				</li>
			</ul>
			
			<div class="headerL2 mb-5" style="margin-top:10px;">작가 신청 결과</div>
			<span class="me-3 fw-bolder">신청일</span>
			<span class="me-3">${apdto.apply_date }</span>
			<span class="mx-3 fw-bolder">심사단계</span>
			<c:choose>
			<c:when test="${apdto.pass == 1}"><span class="border btn1">합격</span></c:when>
			<c:when test="${apdto.pass == 0}"><span class="border btn1">불합격</span></c:when>
			<c:otherwise><span class="border btn1">심사중</span></c:otherwise>
			</c:choose>
		<div class="row">
				<div class="col-6">
					<div class="headerL4 my-5" style="margin-top:10px;">포트폴리오</div>
					<%-- <c:forEach begin="0" end="9" varStatus="loop">
						<c:set var="applyIndex" value="${'apply' + loop.index}" />
						<img src="/uploads/${apdto[applyIndex]}"/>
					</c:forEach> --%>
					<img id="applyImg1" src="/uploads/${apdto.apply1}"/>
					<img id="applyImg2" src="/uploads/${apdto.apply2}"/>
					<img id="applyImg3" src="/uploads/${apdto.apply3}"/>
					<img id="applyImg4" src="/uploads/${apdto.apply4}"/>
					<img id="applyImg5" src="/uploads/${apdto.apply5}"/>
					<img id="applyImg6" src="/uploads/${apdto.apply6}"/>
					<img id="applyImg7" src="/uploads/${apdto.apply7}"/>
					<img id="applyImg8" src="/uploads/${apdto.apply8}"/>
					<img id="applyImg9" src="/uploads/${apdto.apply9}"/>
					<img id="applyImg10" src="/uploads/${apdto.apply10}"/>
					
					<div class="headerL4 my-5">작가소개</div>
					<p style="white-space:pre-wrap; word-wrap: break-word;">${apdto.a_intro }<p>
					
				</div>
						
				<div class="col-6" style="padding-left:30px">
					<div class="headerL4 my-5">작가이력</div>
					<p style="white-space:pre-wrap; word-wrap: break-word;">${apdto.a_history }<p>
				</div>
			</div>
		</div>
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
		