<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
<!-- <script src="./js/atelier.js"></script> -->
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
	$('#onsale3 ul li.page-item').click(function(){
		console.log('트리거호출됨');
		$('#onsale3 ul li.page-item').removeClass('active');
		$(this).addClass('active');
		$.ajax({
			type : 'get', //전송방식
			contentType : 'application/json;charset:utf-8',
			dataType : 'json', //콜백데이터 타입
			url : './rest/vartist', //요청url
			data : {aidx : ${adto.aidx}, sold : 0, pageNum : $(this).text()}, //파라미터 (객체형태로전송)
			success : function(rdata0){
				console.log(rdata0);
				let tileData0 = '';
				$(rdata0).each(function(index, data){
					console.log(index, data);
					var imgsrc = data.sfile.length>=40 ? data.sfile : './uploads/'+data.sfile;
					tileData0 += "<div class='arttile mb-5'><div class='image'><a href='./view?pidx="+data.pidx+"'><img src='"+imgsrc+"' alt='작품이미지' /></a></div><div class='sub p-3'><div class='title mb-2 fw-bolder'>"+data.title+"</div><div class='artist'><i class='fa-solid fa-user' style='color:#dddddd'></i>&nbsp;&nbsp;"+data.m_name+"</div><div class='ptype'>"+
					data.p_type+", <span class='year'>"+data.regidate+"</span> <br/>"+data.size1+" x "+data.size2+" cm </div><div class='price mt-1'>￦ <span class='price2'>"+data.price+"</span></div></div></div>";
				});
				$('#onsale2').html(tileData0); 
			}, //성공시호출할 콜백함수
			error : function(errD){console.log(errD.status+" : "+errD.statusText);}
		});	
	}); 
	$('#sold3 ul li.page-item').click(function(){
		console.log('트리거호출됨');
		$('#sold3 ul li.page-item').removeClass('active');
		$(this).addClass('active');
		$.ajax({
			type : 'get', //전송방식
			contentType : 'application/json;charset:utf-8',
			dataType : 'json', //콜백데이터 타입
			url : './rest/vartist', //요청url
			data : {aidx : ${adto.aidx}, sold : 1, pageNum : $(this).text()}, //파라미터 (객체형태로전송)
			success : function(rdata){
				console.log(rdata);
				let tileData1 = '';
				$(rdata).each(function(index, data){
					console.log(index, data);
					var imgsrc = data.sfile.length>=40 ? data.sfile : './uploads/'+data.sfile;
					tileData1 += "<div class='arttile mb-5'><div class='image'><a href='./view?pidx="+data.pidx+"'><img src='"+imgsrc+"' alt='작품이미지' /></a></div><div class='sub p-3'><div class='title mb-2 fw-bolder'>"+data.title+"</div><div class='artist'><i class='fa-solid fa-user' style='color:#dddddd'></i>&nbsp;&nbsp;"+data.m_name+"</div><div class='ptype'>"+data.p_type+", <span class='year'>"+data.regidate+"</span> <br/>"+data.size1+" x "+data.size2+" cm </div><div class='price mt-1' style='color:#af0000;'>● SOLD</div></div></div>";
				});
				$('#sold2').html(tileData1); 
			}, //성공시호출할콜백함수
			error : function(errD){console.log(errD.status+" : "+errD.statusText);}
		});	
		
	});
	$('#onsale3 ul li.page-item:first').trigger('click');
	$('#soldbtn').click(function(){
		$('#sold3 ul li.page-item:first').trigger('click');
	});
	
	$('.thumb').click(function(){
		if('${user_id}'=='') {alert('로그인이 필요합니다.'); return;}  
		
		alert("리뷰 도움돼요 1 증가");
		$(this).css({'background-color':'red', 'color':'white'});
		// 클릭된 버튼에 가까운 input[name="pidx"] 값을 가져오기
	    var pidxValue = $(this).closest('.row').find('input[name="pidx"]').val();
	    var thumbVal = $(this).closest('.row').find('.thumb2');
	    console.log('pidxValue:', pidxValue);
	    
		let params = { pidx : pidxValue };
		$.post('/rest/thumbplus', params, function(resD){
			console.log('콜백데이터', resD);
			thumbVal.html(parseInt(thumbVal.text())+1);
		});
	});
});
</script> 
<style>
th {color:#c5c5c5 !important;}
.arttile {margin-right:0 !important; margin-left:0 !important;}
.arttile:nth-child(4n-2) {margin-left: 2% !important; margin-right: 1% !important;}
.arttile:nth-child(4n-1) {margin-left: 1% !important; margin-right: 2% !important;}
.arttile {width:23% !important;}
.pagination>li>a {color:black !important; padding:10px 16px !important;}
.pagination>li>a.active {color:white !important;}
.nav-tabs>li>a {border-radius:0 !important; border:none !important; }
.nav-tabs>li.active>a {color:white !important; background-color:black !important; border:none !important;}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {border:none !important;}
.atable tbody tr th i {margin-right:10px;} 
.page-item {padding:10px 16px !important; border:1px solid #ededed; margin-left:-1px !important;}
.page-item:hover {background-color:grey;}
.rimg img {max-width:200px; max-height:200px; margin-right:15px; margin-left: -30px;}
.rpage ul li.page-item {padding:0 !important; border:none !important;}
@media (max-width: 600px) {
  .d-block {height: auto !important;  width: 100% !important;}
  .thumb {position: relative !important; top: -100px !important; right: 50px !important;}
  .mname {margin-top:20px;}
}
.modal {--bs-modal-width: 96% !important}
.bi-star-fill {font-size:20px;}
.img2 {max-width:200px; max-height:200px; margin-right:15px; margin-left:-30px}
.d-block {height:800px;}
.next, .prev {font-size:50px; color:black;}
.carousel-control-next, .carousel-control-prev {width:6% !important;}
.bi-zoom-in {opacity:0.5; position:relative; left: 80px; font-size: 30px; }
.headerL3 {padding-top:50px !important;}
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
  <div class="container mb-5">
    <div class="row py-5">
        <div class="col-sm-6">
       		<div class="text-center aprofile" style="margin-right:80px;">
        		<c:choose>
	            	<c:when test="${not empty adto.profiles }"><img src="./uploads/${adto.profiles }" alt="작가프로필이미지" style="width:90%" /></c:when>
	            	<c:otherwise><i class="bi bi-person-circle bpc1"></i></c:otherwise>
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
	        <div class="headerL3"> ${not empty adto ? adto.a_intro : "등록 정보가 없습니다." } </div>
       	</div>
        <div class="col-sm-6">
            <div class="headerL2" style="margin-top:10px !important;">작가이력</div>
		        <div class="headerL3"> ${not empty adto ? adto.a_history : "등록 정보가 없습니다." } </div>
        </div>
    </div>
    
  <ul class="nav nav-tabs my-5">
    <li class="active"><a data-toggle="tab" href="#onsale">판매중인 작품 ${not empty aplist && not empty soldsum ? aplist.size()-soldsum : "0" }</a></li>
    <li><a data-toggle="tab" href="#sold" id="soldbtn">판매완료 작품 ${not empty soldsum ? soldsum : "0"}</a></li>
  </ul>
  <div class="tab-content">
    <div id="onsale" class="tab-pane active">
    	<div id="onsale2"></div>
      	<div id="onsale3"> ${not empty pagingImg0 ? pagingImg0 : "" } </div>
      
    </div>
    <div id="sold" class="tab-pane">
        <div id="sold2">아무것도없나?</div>
		<div id="sold3">${not empty pagingImg1 ? pagingImg1 : "" }</div>
		
    </div>
  </div>
		
  <div class="headerL2" style="clear:both;">리뷰 ${not empty rlist ? rlist.size() : "0" } </div>
	<div class="headerL3">
		<c:choose>
		<c:when test="${ empty rlist }"> <div class="text-center"> 등록된 리뷰가 없습니다.</div></c:when> 
		<c:otherwise> 
		    <c:forEach items="${ rlist }" var="row" varStatus="loop">  
		    	
		    <div class="row border-bottom pb-5">	
		    <div class="col-sm-2">
               <a href="./view?pidx=${row.pidx }"> 
                 <c:set var="imageSource" value="${row.psfile.length() > 40 ? row.psfile : './uploads/' + row.psfile}" />
   				 <img src="${imageSource}" alt="작품이미지" style="width:50%;" />
               </a>
               <div class="title mt-4 fw-bolder">${row.title }</div>
               <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.a_name }
               <br />${row.size1 } x ${row.size2 } cm </div>
               <div class="price mt-1 fw-bolder" style="color:#af0000;">● SOLD</div>
		    </div>
		    <div class="col-sm-1">
		    	<c:choose>
		    		<c:when test="${not empty row.profiles }"><img src="/uploads/${row.profiles }" alt="작성자프로필" style="width:50px; border-radius:50%" /></c:when>
		    		<c:otherwise><i class="bi bi-person-circle bpc2" style="font-size:50px;"></i></c:otherwise>
		    	</c:choose>
		    </div>
            <div class="col-sm-9">
                <div style="display: inline; float: left;" class="mb-4 mname"><b>${row.m_name}</b> <span class="mx-5">${row.r_date}</span> 
                <span>
                <c:forEach var="i" begin="1" end="${row.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
                <c:forEach var="i" begin="1" end="${5-row.star}"><i class="bi bi-star-fill"></i></c:forEach>
                </span> </div>
                
                <span style="color: red; float:right; border-radius: 30px;" class="thumb border py-1 px-4 btn"
                type="button" >리뷰가 도움이 되었나요? <i class="bi bi-hand-thumbs-up fs-3 mx-3"></i> <span class="thumb2">${row.r_like }</span></span>
                <%-- <button class="report ms-3">신고&nbsp; ${row.report }</button> --%>
                <input type="hidden" name="pidx" id="pidx"  value="${row.pidx }" />
                
                <div class="my-5" style="clear:both">${row.r_content}</div>
                <div class="rimg">
                <i class="bi bi-zoom-in"></i><img src="./uploads/${ row.sfile1 }" alt="리뷰이미지1" data-bs-toggle="modal" data-bs-target="#modal_${row.pidx}" />
                <c:if test="${row.sfile2 !=null }"><i class="bi bi-zoom-in"></i><img src="./uploads/${ row.sfile2 }" alt="리뷰이미지2" data-bs-toggle="modal" data-bs-target="#modal_${row.pidx }" /></c:if>
                <c:if test="${row.sfile3 !=null }"><i class="bi bi-zoom-in"></i><img src="./uploads/${ row.sfile3 }" alt="리뷰이미지3" data-bs-toggle="modal" data-bs-target="#modal_${row.pidx }" /></c:if>
                </div>
                
                <div class="modal" id="modal_${row.pidx}">
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
                  <img src="/uploads/${row.sfile1 }" class="d-block mx-auto" alt="..."> </div>
                <c:if test="${row.sfile2 !=null }"><div class="carousel-item">
                  <img src="/uploads/${row.sfile2 }" class="d-block mx-auto" alt="..."> </div></c:if>
                <c:if test="${row.sfile3 !=null }"><div class="carousel-item">
                  <img src="/uploads/${row.sfile3 }" class="d-block mx-auto" alt="..."> </div></c:if>
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
            </div>
		    </div>
		    	
		    </c:forEach>        
		</c:otherwise>    
	  </c:choose>
		<div class="rpage my-5"> ${not empty pagingImgr ? pagingImgr : "" }</div>
	
	</div>
  
</div>
<%@ include file="./include/footer.jsp" %>

</body>
</html>