<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script>
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:eq(4)').addClass( 'active' );
});
</script>
<style>
 .col-sm-4 table {display: inline !important; float: right !important; width: 70%; margin-right:-60px; }
 .btn1 {padding:4px 10px;}
 .mypagetop div.row div.col-sm-4, .mypagetop div.row div.col-sm-2 {background-color: white; box-sizing: border-box; border-right: 15px solid #ededed; padding:20px; height:150px;}
 .mtable td {float:right;}
 .mtable th {width: 40%; font-weight: normal;}
 .mtable2 th {font-weight: normal;}
 .table>tbody {vertical-align: middle !important;}
 .red {color: #AF0000; font-weight: bolder; font-size: 24px;}
 span.red {float: right;}
 .bpc1 {position: relative; top: 15px;}
 .col-sm-2:nth-child(1) a, .col-sm-2:nth-child(2) a, .col-sm-2:nth-child(3) a {line-height: 50px;}
 #indexImgmask {display: inline-block; border-radius: 50%; width: 90px; height:90px; overflow:hidden; margin-top:15px;}
 #indexMypageProfileImage {width: 90px; vertical-align: top; }
</style>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="container-fluid pb-3" style="background-color: #ededed;">
    <div class="container mypagetop" >
        <div class="text-center fs-3 fw-bolder mt-5 mb-4">마이페이지</div>
        <div class="row mb-3">
            <div class="col-sm-4" style="padding-top:10px;" id="indexDiv"><p id="indexImgmask">
            	<c:choose>
				<c:when test="${map.mdto.profiles != null }">
					
						<img src="/uploads/${map.mdto.profiles }" id="indexMypageProfileImage" class="me-4">
					
				</c:when>
				<c:otherwise>
					<i class="bi bi-person-circle bpc1" style="position: relative; top: 0px;"></i>
				</c:otherwise>
				</c:choose></p>
                <table class="table table-borderless mtable">
                    <tr><th style="color: black; font-weight: bolder;">  ${map.mdto.m_name } 님</th><td style="padding:0 !important">
                    <a class="btn1" style="position: relative; right: 8px;" href="/member/edit">정보수정</a></td></tr>
                    <tr><th>총 주문</th><td align="right"><span class="price2">${map.orderSum}</span> 원 <br />(${ not empty map.olist ? map.olist.size() : "0" } 건)</td></tr>
                    <tr><th>총 포인트</th><td> <span id="point" class="price2"> ${map.mdto.total_point }</span> P</td></tr>
                </table>
            </div>
            <div class="col-sm-2">
                <a href="member/order">입금전 <i class="bi bi-chevron-right"></i>
                <div class="red">${not empty map.nplistSize ? map.nplistSize : "0" }</div> </a>
            </div>
            <div class="col-sm-2">
                <a href="member/order">배송준비중 <i class="bi bi-chevron-right"></i>
                <div class="red">${not empty map.nslistSize ? map.nslistSize : "0" }</div></a>
            </div>
            <div class="col-sm-2">
                <table class="table table-borderless mtable2">
                    <tr><th> <a href="member/order">배송중 <i class="bi bi-chevron-right"></i></a></th><td><span class="red">0</span></td></tr>
                     <tr><th><a href="member/order">배송완료<i class="bi bi-chevron-right"></i></a></th><td><span class="red">0</span></td></tr>
                 </table>
            </div>
            <div class="col-sm-2" style="padding:20px 10px;">
                <table class="table table-borderless mtable">
                   <tr><th> <a href="member/order">취소</a></th><td>0</td></tr>
                    <tr><th><a href="member/order">반품</a></th><td>0</td></tr>
                    <tr><th><a href="member/point">포인트</a></th><td><span class="price2"> ${map.mdto.total_point }</span> P</td></tr>
                </table>
            </div>
        </div>
    </div>
    </div>
</body>
