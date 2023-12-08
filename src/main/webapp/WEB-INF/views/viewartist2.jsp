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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
    $(".year").each(function() { $(this).text($(this).text().slice(0, 4));});
    $(".price2").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$(".price3 b").each(function() { $(this).text(numberWithCommas($(this).text()));});
	$('.page-item').click(function(){
		console.log('트리거호출됨');
		$.ajax({
			type : 'get', //전송방식
			contentType : 'text/html;charset:utf-8',
			dataType : 'json', //콜백데이터 타입
			url : './rest/productList.api', //요청url
			data : {pageNum : $(this).text()}, //파라미터 (객체형태로전송)
			success : sucCallBack, //성공시호출할콜백함수
			error : errCallBack
		});	
	}); 
	$('.page-item:first').trigger('click');
});
function sucCallBack(resD) {
	console.log('data',resD);
	let tileData = '';
	$(resD).each(function(index, data){
		tileData += "<div class='arttile mb-5'><div class='image'><a href='./view?pidx=${data.pidx }'><img src='data.sfile' alt='작품이미지' /></a></div><div class='sub p-3'><div class='title mb-2 fw-bolder'>${data.title }</div><div class='artist'><i class='fa-solid fa-user' style='color:#dddddd'></i>&nbsp;&nbsp;${data.m_name }</div><div class='ptype'>${data.p_type }, <span class='year'>${data.regidate }</span> <br/>${data.size1 } x ${data.size2 } cm </div><div class='price mt-1'>￦ <span class='price2'>${data.price }</span></div></div></div>";
	});
	$('#onsale').html(tileData); //앞에서만든 tr태그를 테이블에적용
}
function errCallBack(errD) {console.log(errD.status+" : "+errD.statusText);}
// 3자리마다 컴마를 찍는 함수
function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}

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
.page-item {padding:10px 16px !important; border:1px solid #ededed;}
</style>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container">
  
  <ul class="nav nav-tabs my-5">
    <li class="active"><a data-toggle="tab" href="#onsale">판매중인 작품 ${not empty aplist && not empty soldsum ? aplist.size()-soldsum : "0" }</a></li>
    <li><a data-toggle="tab" href="#sold">판매완료 작품 ${not empty soldsum ? soldsum : "0"}</a></li>
  </ul>
  <div class="tab-content">
    <div id="onsale" class="tab-pane active">
      
    </div>
     ${not empty pagingImg0 ? pagingImg0 : "" } 
    <div id="sold" class="tab-pane">
      
    </div>
  </div>
  
</div>
   
<%@ include file="./include/footer.jsp" %>
</body>
</html>
 
 