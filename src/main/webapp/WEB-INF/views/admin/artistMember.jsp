<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier_Admin</title>

<link href="../css/sb-admin-2.min.css" rel="stylesheet" type="text/css">
<link href="../css/all.min.css" rel="stylesheet" type="text/css">
<link href="../css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
.portImg{max-width:50px;margin-right:5px;}
.table thead tr th {vertical-align:middle !important;}
.table tbody tr {height:100px; overflow:hidden;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function memberLeave(midx){
	//enabled를 0으로 변경한다.
	let fm = document.stateChange;
	fm.method = "post";
	fm.midx.value = midx;
	fm.action = "/admin/memberLeave";
	if(confirm("강제탈퇴 처리하시겠습니까?"))
		fm.submit();
}
function memberDelete(midx){
	//delete 한다. 
	let fm = document.stateChange;
	fm.method = "post";
	fm.midx.value = midx;
	fm.action = "/admin/memberDelete";
	if(confirm("영구삭제 처리하시겠습니까?"))
		fm.submit();
}


</script>
<form name="stateChange">
	<input type="hidden" name="midx" />
</form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="mb-3 text-gray-800 fw-bolder">작가관리</h3>
                    <p class="mb-4">
                    	${error }
                    </p>

                            <div class="table-responsive">
                                <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead class="table-secondary">
                                        <tr align="center">
                                            <th>작가번호</th>
                                            <th>작가명</th>
                                            <th>작가등록일</th>
                                            <th>작가소개</th>
                                            <th width="30%">작가이력</th>
                                            <th>판매중작품수</th>
                                            <th>판매완료작품수</th>
                                            <th>총매출(원)</th>
                                            <th>찜</th>
                                            <th>구독</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<c:choose>
    <c:when test="${ empty alist }"> 
        <tr>
            <td colspan="6" align="center">
                등록된 작가가 없습니다^^*
            </td>
        </tr>
    </c:when> 
    <c:otherwise> 
        <c:forEach items="${ alist }" var="row" varStatus="loop">    
                                        <tr>
                                            <td> ${ row.aidx }  </td>
                                            <td><a href="/admin/artistView?aidx=${ row.aidx }">${ row.m_name }</a></td>
                                            <td>${ row.regidate }</td>
                                            <td class="intro">${ row.a_intro }</td>
                                            <td class="intro">${ row.a_history }</td>
                                            <td> ${ row.totalpcnt }</td>
                                            <td>${ row.soldcnt }</td>
                                            <td class="price2">${ row.sales }</td>
                                            <td>${ row.tlike }</td>
                                            <td> ${ row.subscriber }</td>
                                        </tr>
        </c:forEach>        
    </c:otherwise>    
</c:choose>
                                    </tbody>
                                </table>
                            </div>

                </div>
    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.easing.min.js"></script>
<script src="../js/sb-admin-2.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/datatables-demo.js"></script>
<script src="/js/atelier.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('ul.sidebar li').removeClass( 'active' );
	$('ul.sidebar li a').removeClass( 'active' );
	$('ul.sidebar li:eq(3)').addClass( 'active' );
	$('ul.sidebar li:eq(3) a').addClass( 'active' );
	
	var intro = $('.intro').text();
	if(intro.lenth>200) { $('.intro').html(intro.substring(0, 100)+'...'); }
});
</script>