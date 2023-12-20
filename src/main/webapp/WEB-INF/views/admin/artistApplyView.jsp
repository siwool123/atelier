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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
function stateUpdate(aIdx, pVal){
	console.log(aIdx, pVal);
	let params = {apply_idx : aIdx, pass : pVal};
	let str = '합격';
	if(pVal==0)
		str = '불합격';
	
	if(confirm(str+'으로 처리할까요? 완료후에는 되돌릴 수 없습니다.')){
		$.ajax({
			url : '/admin/artistPassChange',  
			type : 'get', 
			data : params,
			dataType : "text", 
			success : function(resData){
				console.log(resData);
				if(resData=='success'){
					alert('상태가 업데이트 되었습니다.');
					if(pVal==0)
						$('#stateBtn').html('<button type="button" class="btn btn-dark">불합격</button>');
					else $('#stateBtn').html('<button type="button" class="btn btn-info">합격</button>');
				}
				else{ alert('업데이트 중 오류가 발생하였습니다.');}
			},		 
			error : function(errData){  console.log(errData.state, errData.statusText);  },
		});
	}
	else{ event.preventDefault(); }
}
</script>
<style>
.portImg{max-width:50px;margin-right:5px;}
</style>
<form name="stateChange">
	<input type="hidden" name="pass" />
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
                                	<tr>
                                		<td>작가소개</td>
                                		<td>${row.a_intro}</td>
                                	</tr>
                                	<tr>
                                		<td>작가연혁</td>
                                		<td>${row.a_history}</td>
                                	</tr>
                                	<tr>
                                		<td>작가심사</td>
                                		<td id='stateBtn'>
<c:choose>
	<c:when test="${checkedX eq 'checked' }">
		<label><input type="radio" name="pass" value="x" onclick="" ${checkedX } />심사중</label>
		&nbsp;&nbsp;
		<label><input type="radio" name="pass" value="1" onclick="stateUpdate('${param.apply_idx}', '1');" ${checked1 } />합격</label>
		&nbsp;&nbsp;
		<label><input type="radio" name="pass" value="0" onclick="stateUpdate('${param.apply_idx}', '0');" ${checked0 } />불합격</label>
	</c:when>
	<c:otherwise>
		<c:if test="${checked1 eq 'checked' }">
			<button type="button" class="btn btn-info" onclick="alert('합격입니다^^;');">합격</button>
		</c:if>
		<c:if test="${checked0 eq 'checked' }">
			<button type="button" class="btn btn-dark" onclick="alert('불합격입니다ㅜㅜ');">불합격</button>
		</c:if>
	</c:otherwise>
</c:choose>                                		
	
                                		</td>
                                	</tr>
                                </tbody>
                                </table>
                                <div>
                               		<button type="button" class="btn btn-secondary" onclick="location.href='/admin/artistApply';">목록보기</button> 
                                </div>
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