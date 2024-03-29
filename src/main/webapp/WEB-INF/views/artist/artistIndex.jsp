<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<title>Atelier</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!-- js, css -->
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />
<script src="../js/atelier.js"></script>


<script>
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:eq(5)').addClass( 'active' );
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
 .btn10 {line-height: 30px; border:1px solid grey; text-align: center; box-sizing: border-box; padding:5px !important; }
 .btn10:hover {background-color: black; color: white;}
</style>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="container-fluid pb-3" style="background-color: #ededed;">
    <div class="container mypagetop" >
        <div class="text-center fs-3 fw-bolder mt-5 mb-4">작가페이지</div>
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
                    <a class="btn10" style="position: relative; right: 8px;" href="/artist/profile">정보수정</a></td></tr>
                    <tr><th>총 판매</th><td align="right"><span class="price2">${ not empty map.sellSum ? map.sellSum : '0'}</span> 원 <br />(${ not empty map.cntsold ? map.cntsold+map.cntendauction : '0' } 건)</td></tr>
                    <tr><th>총 정산</th><td> <span id="point" class="price2"> 0</span> 원</td></tr>
                </table>
            </div>
            <div class="col-sm-2">
                <table class="table table-borderless mtable2">
                    <tr><th> <a href="artist/sellHistory">판매중 <i class="bi bi-chevron-right"></i></a></th>
                    <td><span class="red">${ not empty map.cntonsale ? map.cntonsale : '0'}</span></td></tr>
                     <tr><th><a href="artist/sellHistory">판매완료<i class="bi bi-chevron-right"></i></a></th>
                     <td><span class="red">${ not empty map.cntsold ? map.cntsold : '0'}</span></td></tr>
                 </table>
            </div>
            <div class="col-sm-2">
                <table class="table table-borderless mtable2">
                    <tr><th> <a href="artist/sellHistory">경매중 <i class="bi bi-chevron-right"></i></a></th>
                    <td><span class="red">${ not empty map.cntonauction ? map.cntonauction : '0'}</span></td></tr>
                     <tr><th><a href="artist/sellHistory">경매완료<i class="bi bi-chevron-right"></i></a></th>
                     <td><span class="red">${ not empty map.cntendauction ? map.cntendauction : '0'}</span></td></tr>
                 </table>
            </div>
            <div class="col-sm-2">
                <table class="table table-borderless mtable2">
                    <tr><th> <a href="artist/sellHistory">배송전 <i class="bi bi-chevron-right"></i></a></th><td><span class="red">0</span></td></tr>
                     <tr><th><a href="artist/sellHistory">배송완료<i class="bi bi-chevron-right"></i></a></th><td><span class="red">0</span></td></tr>
                 </table>
            </div>
            <div class="col-sm-2" style="padding:20px 10px;">
                <table class="table table-borderless mtable">
                   <tr><th><a href="artist/payHistory">정산예정</a></th><td>0</td></tr>
                   <tr><th><a href="artist/payHistory">정산완료</a></th><td>0</td></tr>
                </table>
            </div>
        </div>
    </div>
    </div>
</body>
