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
<form name="stateChange"> <input type="hidden" name="midx" /> </form>
	<div id="wrapper">
	
	<%@ include file="../include/adminSidebar.jsp" %>

                <div class="container-fluid p-5">
 <form name="stateChange">
	<input type="hidden" name="midx" />
</form>
                    <h3 class="mb-3 text-gray-800 fw-bolder">회원관리</h3>
                    <p class="mb-4">
                    	${error }
                    </p>
                    <div>
<button type="button" class="btn btn-warning" 
	onclick="location.href='?sField=authority&searchKeyword=ROLE_USER';">일반회원</button>                    		
<button type="button" class="btn btn-info" 
	onclick="location.href='?sField=authority&searchKeyword=ROLE_ARTIST';">작가회원</button>
<button type="button" class="btn btn-dark" 
	onclick="location.href='?sField=enabled&searchKeyword=0';">탈퇴회원</button>
                    </div>

                            <div class="table-responsive">
                                <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>No</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>핸드폰</th>
                                            <th>포인트</th>
                                            <th>가입일</th>
                                            <th>권한</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
<c:choose>
    <c:when test="${ empty lists }"> 
        <tr>
            <td colspan="6" align="center">
                등록된 회원이 없습니다^^*
            </td>
        </tr>
    </c:when> 
    <c:otherwise> 
        <c:forEach items="${ lists }" var="row" varStatus="loop">    
                                        <tr>
                                            <td>
                                            	<%-- ${maps.totalCount - (((maps.pageNum-1) * maps.pageSize)	+ loop.index)} --%>
                                            	${ row.midx }
                                            </td>
                                            <td>${ row.id }</td>
                                            <td>${ row.m_name }</td>
                                            <td>${ row.phone }</td>
                                            <td>${ row.total_point }</td>
                                            <td>${ row.regidate }</td>
                                            <td>${ row.authority }</td>
                                            <td>
			<c:choose>
				<c:when test="${ row.enabled eq 1 }">
					<button type="button" class="btn btn-secondary" onclick="memberLeave('${ row.midx }');">강제탈퇴</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-danger" onclick="memberDelete('${ row.midx }');">영구삭제</button>	
				</c:otherwise>
			</c:choose>                                            
                                            </td>
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
	$('ul.sidebar li').removeClass( 'active' );
	$('ul.sidebar li a').removeClass( 'active' );
	$('ul.sidebar li:eq(1)').addClass( 'active' );
	$('ul.sidebar li:eq(1) a').addClass( 'active' );
});
</script>