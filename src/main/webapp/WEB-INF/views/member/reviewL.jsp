<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js "></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="/css/atelier.css" rel="stylesheet" type="text/css" />
<script src="/js/atelier.js"></script>

<script>

function delReview(pidx) {
	if(confirm('리뷰작성으로 적립된 10,000 포인트가 차감됩니다. \n 정말로 리뷰를 삭제하시겠습니까?')) { 
 	
   $.ajax({
        type: 'POST',
        url: '/member/delReview',  // 실제 서버 엔드포인트로 수정
        data: { pidx: pidx },
        success: function (response) {
            if (response==4) { 
            	$(`#cartItem_${pidx}`).remove();
            	alert('리뷰가 삭제되었습니다.');
            	location.reload();
            } else { alert('리뷰 삭제 실패');}
        },
        error: function () { alert('리뷰 삭제 중 오류가 발생했습니다.'); }
    });
	} 
}
</script>

<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(4) {background-color: black;}
.leftmenu li:nth-child(4) a, .leftmenu li:nth-child(4) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
.img1 {max-width:60px; max-height:60px;}
.bpc1 {position:relative !important; top:-20px !important;}
.circle {font-size:6px; color:grey; margin-right:10px;}
.btn5 {padding:5px; background:red ; color:white;}
#search {padding:5px 10px; background:black ; color:white;}
.btn7 {padding:5px; background:black ; color:white; margin-top:5px;}
.btn8 {padding:10px 20px; background:black ; color:white; margin-top:20px;}

.btn1 {padding:0 14px !important; margin-right:10px; display:inline; float:left;}
.btn6 {padding: 5px; border: 1px solid grey;}
.table1 tr th {vertical-align:middle; font-weight: normal;}
.table1 tr td {padding:30px 0;}
button.nav-link {padding:10px 20px;}
input[type="text"], input[type="date"] { border:none; border-bottom:1px solid grey !important; height:40px; margin-left:10px; }
input[type="file"] {width:0; height:0}
.param input {width:150px;}
.bi-calendar3 {position: relative; right: 35px;}
div.toggle {background:#ededed; transition: opacity 0.5s ease;}

label.btn1 {width: 50px; height: 50px; vertical-align: middle; cursor: pointer; margin-right:150px;}
#thumb1, #thumb2, #thumb3 {max-width: 100px; max-height: 100px;}
i.bi-star-fill {font-size:20px;}
span.count {position: relative; top: -30px; float: right; right: 15px;}
.img2 {max-width:200px; max-height:200px; margin-right:15px; cursor:pointer;}
.plike {color:red; }
.btn100 {position:relative; top:10px;}
.modal {--bs-modal-width: 96% !important}
.d-block {height:800px;}
.next, .prev {font-size:50px; color:black;}
.carousel-control-next, .carousel-control-prev {width:6% !important;}
.bi-zoom-in {opacity:0.5; position:relative; left: 110px; font-size: 30px; }
</style>
</head>
<body>
<%@ include file="index.jsp" %>
    <div class="container" style="margin-bottom:80px;">
    <div class="row my-5">
        <div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp" %></div>
        
        <div class="col-sm-10" style="padding-left:50px;">
			<div class="headerL2 mb-3" style="margin-top:10px;">내가 작성한 리뷰 ${not empty rlist ? rlist.size() : "0" }</div>
			
			<div class="param" style="height:60px;">
				<form action="" style="display:inline; float:right">
				<input type="date" name="dmin" id="datepicker1"><!-- <i class="bi bi-calendar3"></i> --> ~ 
				<input type="date" name="dmax" id="datepicker2"> <!-- <i class="bi bi-calendar3"></i> -->
                <button type="submit" id="search"> 조회 <i class="bi bi-search fs-5"></i></button>
                </form>
			</div>
			
			 <table class="table table1">
			<c:choose> 
				<c:when test="${ empty rlist }"> <tr><td align="center" style="border-top:1px solid rgb(222, 226, 230);">
				작성한 리뷰가 없습니다.</td></tr> </c:when>
				<c:otherwise> <!-- 출력할 게시물이 있을때 -->
					<c:forEach items="${ rlist }" var="row" varStatus="loop">
					<tr style="border-top: 1px solid grey; border-bottom: 1px solid grey;"><td>
	<a href="/view?pidx=${ row.pidx }"><div class="border-bottom pb-3"><c:choose>
      	<c:when test="${row.psfile.length()>40 }"><img class="img1" src="${row.psfile }" alt="작품이미지" /></c:when>
      	<c:otherwise><img class="img1" src="/uploads/${row.psfile }" alt="작품이미지" /></c:otherwise>
      </c:choose>
	 <div class="pdtoinfo" style="line-height:40px; display:inline; margin-left:40px;"><b> ${ row.title }</b>
	 <span class="mx-5">  ${row.a_name }</span><span> ${row.size1 } x ${row.size2 } cm</span></div>
	</div></a>
	<div class="py-3">
	<span>${row.r_date }</span> <span class="mx-5">
       <c:forEach var="i" begin="1" end="${row.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
       <c:forEach var="i" begin="1" end="${5-row.star}"><i class="bi bi-star-fill"></i></c:forEach>
        &nbsp;<b> ${row.star}</b> </span>
       <i class="bi bi-hand-thumbs-up fs-3 plike"></i> &nbsp;<span style="color:red;" class="plkcnt">${row.r_like}</span> 명에게 도움이 되었습니다.
       <span style="float:right"><button class="btn1 btn100" onclick="reviewE(${row.pidx});">수정하기</button>
       <button class="btn1 btn100" onclick="delReview(${row.pidx});">삭제하기</button></span>
	</div>	
	<div class="py-3">${row.r_content }</div>
	<div class="pt-3">
		<i class="bi bi-zoom-in"></i>
		<img class="img2" src="/uploads/${row.sfile1 }" alt="리뷰이미지1" data-bs-toggle="modal" data-bs-target="#myModal_${loop.index+1 }"/>
		<c:if test="${ not empty row.sfile2 }"><i class="bi bi-zoom-in"></i>
		<img class="img2" src="/uploads/${row.sfile2 }" alt="리뷰이미지2" data-bs-toggle="modal" data-bs-target="#myModal_${loop.index+1 }" />
		</c:if>
		<c:if test="${ not empty row.sfile3 }"><i class="bi bi-zoom-in"></i>
		<img class="img2" src="/uploads/${row.sfile3 }" alt="리뷰이미지3" data-bs-toggle="modal" data-bs-target="#myModal_${loop.index+1 }" />
		</c:if>
	</div>
	</td></tr>
	
	<div class="modal" id="myModal_${loop.index+1 }">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="border-radius:0 !important;">
        <h4 class="modal-title fw-bolder">리뷰 상세 이미지 </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center" style="height:88vh">
          <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="/uploads/${row.sfile1 }" class="d-block mx-auto" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="/uploads/${row.sfile2 }" class="d-block mx-auto" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="/uploads/${row.sfile3 }" class="d-block mx-auto" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <i class="bi bi-chevron-left prev"></i>
                  <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <i class="bi bi-chevron-right next"></i> 
                  <!-- <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
                <span class="visually-hidden">Next</span>
              </button>
            </div>
      </div>
    </div>
  </div>
</div>
			     
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>    
			
        </div>
    </div>
    </div>
 <%@ include file="../include/footer.jsp" %>   
 
 
</body>
</html>