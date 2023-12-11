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
			}, //성공시호출할콜백함수
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
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
  <div class="container">
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
		    	
		    <div class="row">	
		    <div class="col-sm-3">
               <div class="image"><a href="./view?pidx=${row.pidx }"> 
                 <c:set var="imageSource" value="${row.psfile.length() > 40 ? row.psfile : './uploads/' + row.psfile}" />
   				 <img src="${imageSource}" alt="작품이미지" style="width:80%;" />
               </a></div>
               <div class="title mb-2 fw-bolder">${row.title }</div>
               <div class="artist"><i class="fa-solid fa-user" style="color:#dddddd"></i>&nbsp;&nbsp;${row.a_name }</div>
               <div class="price mt-1" style="color:#af0000;">● SOLD</div>
		    </div>
		    <div class="col-sm-1"> <i class="bi bi-person-circle bpc2"></i></div>
            <div class="col-sm-8">
                <b>${row.m_name}</b> <span>${row.r_date}</span> 
                <span>
                <c:forEach var="i" begin="1" end="${row.star}"><i class="bi bi-star-fill starActive"></i></c:forEach>
                <c:forEach var="i" begin="1" end="${5-row.star}"><i class="bi bi-star-fill"></i></c:forEach>
                </span> 
                <i class="bi bi-heart-fill fs-4"></i><span>도움돼요</span><span style="color: red;">${row.r_like }</span><br/>
                <div class="my-3">${row.r_content}</div>
                <div class="rimg">
                <c:if test="${row.sfile1 !=null }"><img src="./uploads/${ row.sfile1 }" style="max-width:300px" /></c:if>
                <c:if test="${row.sfile2 !=null }"><img src="./uploads/${ row.sfile2 }" style="max-width:300px" /></c:if>
                <c:if test="${row.sfile3 !=null }"><img src="./uploads/${ row.sfile3 }" style="max-width:300px" /></c:if>
                </div>
            </div>
		    </div>
		    	
		    </c:forEach>        
		</c:otherwise>    
	  </c:choose>
		 ${not empty pagingImgr ? pagingImgr : "" }
	
	</div>
  
</div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>