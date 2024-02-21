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
.leftmenu li a i {margin-top:7px;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
#imgmask {border-radius: 50%; width: 100px; height:100px; overflow:hidden; }
#profileImage {width: 100px; vertical-align: top; }
span.count {position: relative; top: -30px; float: right; right: 15px;}
.bi-star-fill {font-size:20px;}
.atable tbody tr th i {margin-right:10px; color:grey;}
.btn1 {padding:0 16px !important;}
</style>

<script>
function editIntro(){
	let a_intro = document.getElementById("a_intro").value;
	
	//작가 소개 글자수 검증
	if(a_intro.length<80 || a_intro.length>800) {
		alert('작가 소개는 80자 이상, 800자 이내로 작성해주세요.');
		form.a_intro.focus(); return;
	}
	
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
	
	//작가 약력 글자수 검증
	if(a_history.length<80 || a_history.length>800) {
		alert('작가 약력은 80자 이상, 800자 이내로 작성해주세요.');
		form.a_history.focus(); return;
	}
	
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

document.addEventListener('DOMContentLoaded', function () {
	const aIntro = document.getElementById('a_intro');
	const taCount = document.getElementById('ta_count');
	const aHistory = document.getElementById('a_history');
	const taCount2 = document.getElementById('ta_count_2');

	aIntro.addEventListener('input', function () {
		taCount.textContent = this.value.length;
		if (this.value.length > 800) {
		  alert("작가 소개는 800자 이내로 입력해주세요.");
		  this.value = this.value.substring(0, 800);
		  taCount.textContent = "800";
		  this.focus();
		}
	});

	aHistory.addEventListener('input', function () {
		taCount2.textContent = this.value.length;
		if (this.value.length > 800) {
			alert("작가 약력은 800자 이내로 입력해주세요.");
			this.value = this.value.substring(0, 800);
			taCount2.textContent = "800";
			this.focus();
		}
	});
});

</script>

<%@ include file="artistIndex.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/artistSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
		
			<div class="headerL2 mb-5" style="margin-top:10px;">작가프로필</div>
			
			<div class="row">
		        <div class="col-sm-6 pe-5">
		       		<div class="text-center pt-4 aprofile" style="margin-right:80px;">
		        		<c:choose>
			            	<c:when test="${not empty mdto.profiles }">
			            		<p id="imgmask"><img id="profileImage" src="/uploads/${mdto.profiles }" alt="작가프로필이미지" /></p>
			            		</c:when>
			            	<c:otherwise><p class="mb-4"><i class="bi bi-person-circle bpc1"></i></p></c:otherwise>
			            </c:choose>
			            <div>
			                <c:forEach var="i" begin="1" end="${not empty staravg ? staravg : 0}"><i class="bi bi-star-fill starActive"></i></c:forEach>
			                <c:forEach var="i" begin="1" end="${not empty staravg ? 5-staravg : 5}"><i class="bi bi-star-fill"></i></c:forEach>
		                </div> <!-- 작가의 판매완료된작품이 받은 리뷰의 별점 평균 -->
		       		</div>
		       		<div class="aprofile">
		       			<p class="fw-bolder">${not empty adto ? adto.m_name : "등록된 정보가 없습니다." }</p> 
		       			<table class="table table-borderless atable">
			                <tr><th><i class="bi bi-images"></i> ARTWORKS</th><td>${not empty aplist ? aplist.size() : "0" }</td></tr>
			                <tr><th><i class="bi bi-bag-x"></i> SOLD</th><td>${not empty soldsum ? soldsum : "0" }</td></tr>
			                <tr><th><i class="bi bi-heart"></i> LIKES</th><td>${not empty likesum ? likesum : "0" }</td></tr>
			                <tr><th><i class="bi bi-bell"></i> SUBSCRIBER</th><td>${not empty adto ? adto.subscriber : "0" }</td></tr>
			            </table>
		       		</div>
		       		<div style="margin-bottom:360px;">&nbsp;</div>
		       		<div class="headerL2" style="display:inline;">작가소개</div>
		       		<span class="btn1" style="float: right; cursor: pointer;" onClick="editIntro();">수정</span>
			        <textarea id="a_intro" class="form-control mt-3" rows="11" style="white-space:pre-wrap; word-wrap: break-word;"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." }</textarea>
			        <span class="count"> <span id="ta_count">${adto.a_intro.length() } </span> / 800</span>
		       	</div>
		        <div class="col-sm-6">
		            <div class="headerL2" style="margin-top:10px !important;display:inline;">작가이력</div>
		            <span class="btn1" style="float: right; cursor: pointer;" onClick="editHistory();">수정</span>
				        <textarea id="a_history" class="form-control mt-3" rows="30" style="white-space:pre-wrap; word-wrap: break-word;"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </textarea>
				        <span class="count"> <span id="ta_count">${adto.a_history.length() } </span> / 800</span>
		        </div>
		    </div>
		
		</div>
	</div>
</div>		
<%@ include file="../include/footer.jsp" %>