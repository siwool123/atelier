<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Atelier</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!-- <script src="https://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f101226514.js" crossorigin="anonymous"></script>
<!-- swiper 플러그인 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="../js/atelier.js"></script>
<link href="../css/atelier.css" rel="stylesheet" type="text/css" />

</head>
<body id="pageTop">
    <nav class="navbar navbar-expand-sm sticky-top borer-bottom">
        <div class="container">
        <a class="navbar-brand" href="./shop" ><img src="../images/atelier.png" alt="logo" style="width:140px;" ></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-link" href="./shop">SHOP</a>
              <a class="nav-link" href="#">AUCTION</a>
              <a class="nav-link" href="#">FAQ</a>
              <a class="nav-link" href="#">COMPANY</a>
              <a class="nav-link" href="#">MYPAGE</a>
              <a class="nav-link" href="#">작가페이지</a>
              <a class="nav-link" href="#"><i class="bi bi-bag"></i></a>
              <c:choose>
	              <c:when test="${empty principal.getName() }">
	              	<a class="nav-link" href="./login" >LOGIN</a>
	              </c:when>
	              <c:otherwise>
	              	<a class="nav-link" href="./logout" >LOGOUT</a>
	              </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </nav>
   
</body>
</html>