<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 레프트메뉴 등... -->
<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(4) {background-color: black;}
.leftmenu li:nth-child(4) a,
.leftmenu li:nth-child(4) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
</style>

<%@ include file="artistIndex.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/artistSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
		
		
		
		
		</div>
	</div>
</div>		
<%@ include file="../include/footer.jsp" %>