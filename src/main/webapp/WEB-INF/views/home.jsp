<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier</title>
</head>
<body>
<%@ include file="./include/header.jsp" %>
<div class="container-fluid">
	<div class="swiper swiper-container">
	    <div class="swiper-wrapper" >
	        <div class="swiper-slide" id="container" style="background:black; width:100vw; height:480px; overflow:hidden;">  

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.1/gsap.min.js'></script>
 <script>
 const n = 7;
 gsap.timeline().set('#container', {perspective:800})
 for (let i=0; i<n; i++){ 
   let b = document.createElement('div');
   b.classList.add('painting');
   document.getElementById('container').appendChild(b);
   gsap.set(b, {
     left:'50%',
   	top:'50%',
     x:'-50%',
     y:'-50%',
     z:300,
   	width:300,
 	  height:300,
 	  //border:1px solid white;
 	 //background:()=>'hsl('+(i/n*300)+',50%,50%)',
     background:()=>'url(../images/painting'+(i+1)+'.jpg)'
   });
   gsap.fromTo(b, {
     scaleY:0,
     zIndex:-i,
     rotationY:90+i/n*205,
     transformOrigin:String("50% 50% -900%")
   },{
	   zIndex:100,
     scaleY:1,
     duration:0.7,
     delay:1-0.5*(i/n),
     ease:'elastic'
   })
   b.onmouseenter = (e)=>{ gsap.to(b, {duration:1, ease:'back.out(5)', perspective:1000, rotationY:0, zIndex:100}); }  
   // b.onmouseleave = (e)=>{ gsap.to(b, {duration:0.4, rotationX:0, y:'-50%'}); }
 }
 window.onmousemove = (e)=>{
   gsap.to('.painting', {duration:0.6, rotationY:(i)=>45+i/n*205+90*(e.clientX/window.innerWidth) });
 }
 </script>				
				  
	        </div>
	        <div class="swiper-slide text-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.527), rgba(0, 0, 0, 0.5)), url(../images/imgslide_2.jpg); width:100vw; height:480px;">
	        <span> 그림이 주는 감동</span><br />
	        당신만을 위한 작품으로 공간을 바꿔보세요.<br /><br />
	        CHANGE YOUR SPACE WITH <br/>ONLY ONE ORIGINAL PAINTING  
	        <div class="appdown mt-5"><a href=""><img src="../images/googleplay.png" style="width:110px;" /></a><a href=""><img src="../images/appstore.png" style="width:110px;" /></a></div>
	        </div>
	        <div class="swiper-slide text-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.527), rgba(0, 0, 0, 0.5)), url(../images/imgslide_3.jpg); width:100vw; height:480px;">  
	        <div class="container">
	        	<span> AI 큐레이터</span><br /><br />
		        당신의 취향에 맞춰 <br/>고민할 시간을 덜어드립니다. 
		        <div class="appdown mt-5"><a href=""><img src="../images/googleplay.png" style="width:110px;" /></a><a href=""><img src="../images/appstore.png" style="width:110px;" /></a></div>
		        <div style="background:black; width:200px; height:130px; text-align:center; position:relative; top:-150px; left:75%;"><i class="bi bi-heart-fill" style="color:red; font-size:50px; line-height:120px;"></i></div>
		        <img src="../images/ai.png" style="width:280px; position: relative; top: -130px; left: 38%;" />
	        </div>
	        </div>
	    </div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-pagination"></div>
	</div>
</div>

<!-- partial:index.partial.html -->
<div id="container" style="width: 100%; height: 480px; overflow:hidden;"></div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.1/gsap.min.js'></script>
 <script>
 const n = 7;
 gsap.timeline().set('#container', {perspective:800})
 for (let i=0; i<n; i++){ 
   let b = document.createElement('div');
   b.classList.add('painting');
   document.getElementById('container').appendChild(b);
   gsap.set(b, {
     left:'50%',
   	top:'50%',
     x:'-50%',
     y:'-50%',
     z:300,
   	width:300,
 	  height:300,
     background:()=>'hsl('+(i/n*300)+',100%,50%)'
   });
   gsap.fromTo(b, {
     scaleY:0,
     zIndex:-i,
     rotationY:90+i/n*205,
     transformOrigin:String("50% 50% -900%")
   },{
     scaleY:1,
     duration:0.7,
     delay:1-0.5*(i/n),
     ease:'elastic'
   })
   b.onmouseenter = (e)=>{ gsap.to(b, {duration:1, ease:'back.out(5)', perspective:1000, rotationY:0, zIndex:100}); }  
   // gsap.to(b, {duration:0.4, opacity:0.7, scaleY:1});
 }
 window.onmousemove = (e)=>{
   gsap.to('.painting', {duration:0.6, rotationY:(i)=>45+i/n*205+90*(e.clientX/window.innerWidth) });
 }
 </script>
 	  
<%@ include file="./include/footer.jsp" %>
</body>
</html>