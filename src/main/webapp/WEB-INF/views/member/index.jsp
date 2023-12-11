<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:eq(4)').addClass( 'active' );
});
</script>
<style>
 .col-sm-4 table {display: inline !important; float: right !important; width: 70%; margin-right: -25px;}
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
</style>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="container-fluid pb-3" style="background-color: #ededed;">
    <div class="container mypagetop" >
        <div class="text-center fs-3 fw-bolder mt-5 mb-4">마이페이지</div>
        <div class="row mb-3">
            <div class="col-sm-4" style="padding-top:10px;">
                <i class="bi bi-person-circle bpc1"></i>
                <table class="table table-borderless mtable">
                    <tr><th style="color: black; font-weight: bolder;">  ${mdto.m_name} 님</th><td><a class="btn1" href="member/eidt">정보수정</a></td></tr>
                    <tr><th>총 주문</th><td>00000000 원 (1 건)</td></tr>
                    <tr><th>총 포인트</th><td>0000000 P</td></tr>
                </table>
            </div>
            <div class="col-sm-2">
                <a href="member/order">입금전 <i class="bi bi-chevron-right"></i><div class="red">0</div> </a>
            </div>
            <div class="col-sm-2">
                <a href="member/order">배송준비중 <i class="bi bi-chevron-right"></i><div class="red">0</div></a>
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
                    <tr><th><a href="member/point">포인트</a></th><td> 000000 P</td></tr>
                </table>
            </div>
        </div>
    </div>
    </div>
</body>
