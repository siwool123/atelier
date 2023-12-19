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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
.portImg{max-width:50px;margin-right:5px;}
.table thead tr th {vertical-align:middle !important;}
.table tbody tr {height:100px; overflow:hidden;}
.introtable tr th {background:#ededed;}
.img1 {max-width:100px; max-height:100px;}
.maintable tr {height:30px !important;}
.maintable tr th {background:#ededed;}
.btn13 {padding: 8px 20px !important;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
function deletepidx(pidx) {
	var delReason = prompt("삭제 사유를 입력하세요."); // 삭제 사유 입력창 띄우기

    if (delReason === null) {   return;} // 사용자가 입력을 취소한 경우
    if (delReason.trim() === "") { alert("삭제 사유를 입력해주세요.");  return;  }
    if (confirm("정말로 해당 작품을 삭제하시겠습니까?")) {
   $.ajax({
        type: 'POST',
        url: '/rest/delProduct',  
        data: { pidx: pidx, delReason: delReason },
        success: function (response) {
            if (response==1) { 
            	$(`#row_${pidx}`).remove();
            	alert('작품이 삭제되었습니다.');
            	location.reload();
            } else { alert('작품 삭제 실패');}
        },
        error: function () { alert('작품 삭제 중 오류가 발생했습니다.'); }
    });
	} 
}

</script>
<form name="stateChange"> <input type="hidden" name="midx" /> </form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="mb-3 text-gray-800 fw-bolder">판매작품관리 ${not empty salelist ? salelist.size() : '0' }</h3>
                    <p class="mb-4"> ${error }  </p>

  <div style="display:inline; float:left"><a href="?sell=on" class="btn1 btn13" id="aa">판매중</a>                    		
<a href="?sell=so" class="btn1 btn13" id="bb">판매완료</a></div>
                    
<div class="table-responsive">
	 <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
	     <thead class="table-secondary">
	         <tr align="center">
	        	 <th>작가번호</th>
	             <th>작가명</th>
	             <th>작품번호</th>
	             <th>작품등록일</th>
	             <th>이미지</th>
	             <th>작품명</th>
	             <th>사이즈(cm)</th>
	             <th>주제</th>
	             <th>타입</th>
	             <th>판매가(원)</th>
	             <th>찜</th>
	             <th>상태</th>
	             <th>삭제</th>
	         </tr>
	     </thead>
	     <tbody>
	<c:choose>
	<c:when test="${ empty salelist }"> 
	<tr> <td colspan="13" align="center">  등록된 작품이 없습니다^^* </td> </tr>
	</c:when> 
	<c:otherwise> 
	<c:forEach items="${ salelist }" var="row" varStatus="loop">    
         <tr id="row_${row.pidx}">
         	<td> ${ row.aidx }  </td>
             <td> ${ row.m_name }  </td>
             <td> ${ row.pidx }  </td>
             <td> ${ row.regidate }  </td>
             <td><a href="/view?pidx=${ row.pidx }">
				<c:set var="imageSource" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 <img src="${imageSource}" alt="작품이미지" class="img1" /> </a></td>
             <td>${ row.title }</td>
             <td>${ row.size1 } x ${row.size2 } </td>
             <td>${ row.theme }</td>
             <td> ${ row.p_type }</td>
             <td class="price2">${ row.price }</td>
             <td>${ not empty row.p_like ? row.p_like : '0' }</td>
             <td> ${ not empty row.sold and row.sold eq 1 ? '<span style="color:red">판매완료</span>' : '판매중' }</td>
             <td><button class="btn1" onclick="deletepidx(${ row.pidx });">삭제</button></td>
         </tr>
	</c:forEach>        
	</c:otherwise>    
	</c:choose>
        </tbody>
    </table>
</div>
    </div></div>
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
	$('ul.sidebar li:eq(4)').addClass( 'active' );
	$('ul.sidebar li:eq(4) a').addClass( 'active' );
	
});
</script>