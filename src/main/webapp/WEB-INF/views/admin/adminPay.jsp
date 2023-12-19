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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
.img1 {max-width:100px; max-height:100px;}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<script>
/* function updatePidx(pidx) {
	alert("호날두");
    // enabled를 0으로 변경한다.
    let fm = document.stateChange;
    if (fm) {
    	alert("호날두12112");
        fm.method = "post";
        alert(pidx);
        fm.pidx.value = pidx;
        alert(fm.pidx.value);
        fm.action = "/admin/proupdate";
        if (confirm("작품을 판매상태로 바꾸겠습니까?"))
            fm.submit();
    } else {
        console.error("Form element not found");
    }
} */
/*
function memberDelete(midx){
	//delete 한다. 
	let fm = document.stateChange;
	fm.method = "post";
	fm.midx.value = midx;
	fm.action = "/admin/memberDelete";
	if(confirm("영구삭제 처리하시겠습니까?"))
		fm.submit();

} */
</script>
<style>
.portImg{max-width:50px;margin-right:5px;}
</style>
<form name="stateChange">
	<input type="hidden" name="pidx" />
</form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="mb-3 text-gray-800 fw-bolder">주문관리</h3>
                    <p class="mb-4">
                    	${error }
                    </p>
                    
                    
                            <div class="table-responsive">
                                <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                               
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>주문번호</th>
                                            <th>구분</th>
                                            <th>작품번호</th>
                                            <th>이미지</th>
                                            <th>작품명</th>
                                            <th>작가명</th>
                                            <th>판매가</th>
                                            <th>구매자명</th>
                                            <th>결제완료일</th>
                                            <th>발송현황</th>
                                            <th>발송정보</th>
                                            <th>취소/반품</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	
<c:choose>
    <c:when test="${ empty adpayList }"> 
        <tr>
            <td colspan="6" align="center">
                등록된 결제목록이 없습니다^^*
            </td>
        </tr>
    </c:when> 
    <c:otherwise> 
        <c:forEach items="${ adpayList }" var="row" varStatus="loop">    
                                        <tr>
                                            <td >
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.oidx }
                                            </td>
                                            <c:choose>
				<c:when test="${ row.auction eq '0' }">
					<td>구매</td>			                                         
				</c:when>
				<c:when test="${  row.auction eq '1' }">
					<td >낙찰</td>	
				</c:when>	
			</c:choose>
                                            <td>${ row.pidx }</td>
											<td align="center">
					       <c:set var="imgsrc" value="${row.sfile.length() > 40 ? row.sfile : './uploads/' + row.sfile}" />
   				 			<img src="${imgsrc}" alt="작품이미지" class="img1" />
					       	</td>
                                            <td>${ row.title }</td>
                                            <td>${ row.a_name }</td>
                                            <td class="price2">${ row.price }</td>
			
										<td >
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.m_name }
                                            </td>
                                            <td >
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.paydate }
                                            </td>
                                            <td >
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.shipdate }
                                            </td>
                                            <td >
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.t_num }
                                            </td> 
                                            <c:choose>
				<c:when test="${ row.state eq '-1' }">
					<td>
						구매취소
					</td>
				</c:when>
				<c:when test="${ row.state eq '0' }">
					<td>

					</td>
				</c:when>
				<c:when test="${ row.state eq '-2' }">
					<td>
						취소
					</td>
				</c:when>
				<c:when test="${ row.state eq '-3' }">
					<td>
						반품
					</td>
				</c:when>
			</c:choose>    
			</tr>
                                            
			
                                            
                                    
        </c:forEach>        
    </c:otherwise>    
</c:choose>
                                    </tbody>
                                </table>
                            </div>

                </div>
    </div>
    <!-- End of Page Wrapper --><!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button><a class="btn btn-primary" href="login.html">Logout</a>
                </div>
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
<script type="text/javascript">
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').removeClass( 'active' );
	$('ul.navbar-nav li').removeClass( 'active' );
	$('ul.navbar-nav li:eq(6)').addClass( 'active' );
	
});
</script>