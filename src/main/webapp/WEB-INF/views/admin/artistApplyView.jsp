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
<style>
.no-gutters {padding:0 10px !important;}
table.dataTable {border-collapse:collapse !important;}
#content-wrapper {background-color:transparent;}
.pagination {margin:10px auto !important;}
.custom-select {width:50px !important;}
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
<style>
.portImg{max-width:50px;margin-right:5px;}
</style>
<form name="stateChange">
	<input type="hidden" name="midx" />
</form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
                    <h3 class="mb-3 text-gray-800 fw-bolder">아티스트 신청 상세보기</h3>
                    <p class="mb-4">
                    	${error }
                    </p>
                    <div>
                    
                    </div>

                            <div class="table-responsive">
                                <table class="table table-hover" width="100%" cellspacing="0">
                                <tbody>
                                	<tr>
                                		<td>회원명</td>
                                		<td>${row.m_name}</td>
                                	</tr>
                                	<tr>
                                		<td>신청일</td>
                                		<td>${row.apply_date}</td>
                                	</tr>
                                	<tr>
                                		<td>포트폴리오</td>
                                		<td>
<c:if test="${ not empty row.apply1 }"><img src="/uploads/${ row.apply1 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply2 }"><img src="/uploads/${ row.apply2 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply3 }"><img src="/uploads/${ row.apply3 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply4 }"><img src="/uploads/${ row.apply4 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply5 }"><img src="/uploads/${ row.apply5 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply6 }"><img src="/uploads/${ row.apply6 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply7 }"><img src="/uploads/${ row.apply7 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply8 }"><img src="/uploads/${ row.apply8 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply9 }"><img src="/uploads/${ row.apply9 }" class="portImg" /></c:if>                                            
<c:if test="${ not empty row.apply10 }"><img src="/uploads/${ row.apply10 }" class="portImg" /></c:if>                                            
                                		</td>
                                	</tr>
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
	$('ul.navbar-nav li:eq(5)').addClass( 'active' );
	
});
</script>