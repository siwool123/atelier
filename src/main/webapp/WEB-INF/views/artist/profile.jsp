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
#imgmask {border-radius: 50%; width: 100px; height:100px; overflow:hidden; }
#profileImage {width: 100px; vertical-align: top; }
</style>

<script>
function editIntro(){
	let a_intro = document.getElementById("a_intro").value;
	
	// XMLHttpRequest 객체 생성
    let xhr = new XMLHttpRequest();
	
 	// POST 요청 준비
    xhr.open('POST', '/artist/editIntro.do', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    
	// 요청 완료 시 실행되는 콜백 함수
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            // 성공적으로 요청이 완료되면 실행되는 부분
            console.log(xhr.responseText); // 서버로부터의 응답을 출력
            alert('작가소개 수정이 완료되었습니다.')
        } else {
            // 요청이 실패했을 때 실행되는 부분
            console.error(xhr.status + ' : ' + xhr.statusText);
            alert('작가소개 수정을 실패하였습니다.')
        }
    };
    
 	// 요청 전송
    xhr.send('a_intro=' + encodeURIComponent(a_intro));
}

function editHistory(){
	let a_history = document.getElementById("a_history").value;
	
	// XMLHttpRequest 객체 생성
    let xhr = new XMLHttpRequest();
	
 	// POST 요청 준비
    xhr.open('POST', '/artist/editHistory.do', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    
	// 요청 완료 시 실행되는 콜백 함수
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            // 성공적으로 요청이 완료되면 실행되는 부분
            console.log(xhr.responseText); // 서버로부터의 응답을 출력
            alert('작가이력 수정이 완료되었습니다.')
        } else {
            // 요청이 실패했을 때 실행되는 부분
            console.error(xhr.status + ' : ' + xhr.statusText);
            alert('작가이력 수정을 실패하였습니다.')
        }
    };
    
 	// 요청 전송
    xhr.send('a_history=' + encodeURIComponent(a_history));
}
</script>

<%@ include file="artistIndex.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/artistSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
		
			<div class="headerL2 mb-5" style="margin-top:10px;">작가프로필</div>
			
			<div class="row">
		        <div class="col-sm-6">
		       		<div class="text-center pt-5 aprofile" style="margin-right:80px;">
		        		<c:choose>
			            	<c:when test="${not empty mdto.profiles }">
			            		<p id="imgmask"><img id="profileImage" src="/uploads/${mdto.profiles }" alt="작가프로필이미지" /></p>
			            		</c:when>
			            	<c:otherwise>
			            		<p class="mb-4"><i class="bi bi-person-circle bpc1"></i></p>
			            	</c:otherwise>
			            </c:choose>
			            <div>
			                <c:forEach var="i" begin="1" end="${not empty staravg ? staravg : 0}"><i class="bi bi-star-fill starActive"></i></c:forEach>
			                <c:forEach var="i" begin="1" end="${not empty staravg ? 5-staravg : 5}"><i class="bi bi-star-fill"></i></c:forEach>
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
		       		<span class="border btn1" style="float: right; cursor: pointer;" onClick="editIntro();">수정</span>
		       		${apdto.a_intro }
			        <textarea id="a_intro" class="form-control mt-3" rows="11" style="white-space:pre-wrap; word-wrap: break-word;"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." }</textarea>
		       	</div>
		        <div class="col-sm-6">
		            <div class="headerL2" style="margin-top:10px !important;">작가이력</div>
		            <span class="border btn1" style="float: right; cursor: pointer;" onClick="editHistory();">수정</span>
				        <textarea id="a_history" class="form-control mt-3" rows="30" style="white-space:pre-wrap; word-wrap: break-word;"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </textarea>
		        </div>
		    </div>
		
		</div>
	</div>
</div>		
<%@ include file="../include/footer.jsp" %>