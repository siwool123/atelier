<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 레프트메뉴 등... -->
<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(1) {background-color: black;}
.leftmenu li:nth-child(1) a,
.leftmenu li:nth-child(1) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
.star20 {font-size:20px !important;}
</style>

<%@ include file="artistIndex.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/artistSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
		
			<div class="headerL2 mb-5" style="margin-top:10px;">작가프로필</div>
			
			<div class="row">
		        <div class="col-sm-6">
		       		<div class="text-center aprofile" style="margin-right:80px;">
		        		<c:choose>
			            	<c:when test="${not empty adto.profiles }"><img src="./uploads/${adto.profiles }" alt="작가프로필이미지" style="width:90%" /></c:when>
			            	<c:otherwise><i class="bi bi-person-circle bpc1"></i></c:otherwise>
			            </c:choose>
			            <div style="position: relative; top: 30px;">
			                <c:forEach var="i" begin="1" end="${not empty staravg ? staravg : 0}"><i class="bi bi-star-fill starActive star20"></i></c:forEach>
			                <c:forEach var="i" begin="1" end="${not empty staravg ? 5-staravg : 5}"><i class="bi bi-star-fill star20"></i></c:forEach>
		                </div> <!-- 작가의 판매완료된작품이 받은 리뷰의 별점 평균 -->
		       		</div>
		       		<div class="aprofile" style="margin-bottom:200px; margin-top:10px;">
		       			<p class="fw-bolder">${not empty adto ? adto.m_name : "등록된 정보가 없습니다." }</p> 
		       			<table class="table table-borderless atable">
			                <tr><th><i class="bi bi-images"></i> ARTWORKS</th><td>${not empty aplist ? aplist.size() : "0" }</td></tr>
			                <tr><th><i class="bi bi-bag-x"></i> SOLD</th><td>${not empty soldsum ? soldsum : "0" }</td></tr>
			                <tr><th><i class="bi bi-heart"></i> LIKES</th><td>${not empty likesum ? likesum : "0" }</td></tr>
			                <tr><th><i class="bi bi-bell"></i> SUBSCRIBER</th><td>${not empty adto ? adto.subscriber : "0" }</td></tr>
			            </table>
		       		</div>
		       		<div class="headerL2" style="clear: both;">작가소개</div>
			        <div class="headerL3"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." } </div>
		       	</div>
		        <div class="col-sm-6" style="padding-left:30px;">
		            <div class="headerL2" style="margin-top:10px !important;">작가이력</div>
				        <div class="headerL3"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </div>
		        </div>
		    </div>
		
		</div>
	</div>
</div>		
<%@ include file="../include/footer.jsp" %>