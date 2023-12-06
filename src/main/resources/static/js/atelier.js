document.addEventListener('DOMContentLoaded', function () {
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1, // 한 번에 보여지는 슬라이드 개수
        spaceBetween: 0, // 슬라이드 사이의 간격 (픽셀)*/
        pagination: {
        el: ".swiper-pagination",
        //type: "progressbar",
        },
        navigation: {
            nextEl: ".swiper-button-next",
        	prevEl: ".swiper-button-prev",
        },
        /*autoplay: {
        delay: 3000,
        disableOnInteraction: false, // 사용자와의 상호작용이 있을 때 자동 이동 중지하지 않음
    	},
    	speed:5000,*/
    	loop: true, // 무한 루프 활성화
    	loopAdditionalSlides: 1,
    });
    var swiper2 = new Swiper('.sc2', {
        slidesPerView: 4, // 한 번에 보여지는 슬라이드 개수
        spaceBetween: 20, // 슬라이드 사이의 간격 (픽셀)*/
        navigation: {
            nextEl: ".bi-chevron-right",
        	prevEl: ".bi-chevron-left",
        },
    	loop: true, // 무한 루프 활성화
    	loopAdditionalSlides: 1,
    	/*breakpoints: {
            '@0.75': {
            slidesPerView: 1,
            width:380,
            }}*/
    });
});

$(function(){
	$.ajaxSetup({
		type : 'get', //전송방식
		contentType : 'test/html;charset:utf-8', //컨텐츠타입
		dataType : 'json', //콜백데이터 타입
		error : errCallBack
    })
	$('.page-item').click(function(){
		$.ajax({
			url : './rest/productList.api', //요청url
			data : {pageNum : $(this).text()}, //파라미터 (객체형태로전송)
			success : sucCallBack, //성공시호출할콜백함수
		});	
	});
	/*이벤트를 자동실행하고싶을떄 trigger 사용한다. 페이지 로드될때 사용자가 버튼클릭한것과 동일한 동작수행*/
	$('.page-item:first').trigger('click');
});
function sucCallBack(resD) {
	let tableData = '';
	$(resD).each(function(index, data){
		tableData += "<div class='arttile'><div class='image'><a href='./view?pidx="+data.pidx
				+"> <img src='./uploads/"+data.sfile+" alt='' /></a></div><div class='sub p-3'><div class='title mb-2'>"
				+data.title+"</div><div class='artist'><i class='fa-solid fa-user' style='color:#dddddd'></i>&nbsp;&nbsp;"
				+data.m_name+"</div><div class='method'>"+data.p_type+", "+data.regidate+"<br/>"+data.size1+" x "+data.size2
				+" cm </div><div class='price mt-1'>￦ <span class='price2'>"+data.price+"</span></div></div></div>";
	});
	$('#show_data').html(tableData); //앞에서만든 tr태그를 테이블에적용
}
function errCallBack(errD) {
	console.log(errD.status+" : "+errD.statusText);
}

$( document ).ready( function() {
	$('#navbarNavAltMarkup div a:first').addClass( 'active' );
	$('a.btn2:first').addClass( 'active' );
	$('a#total').addClass( 'active' );
	$('.orderby li a').click( function(){
		$('.orderby li a').removeClass('active');
		$('.orderby li').removeClass('active');
		$(this).addClass('active');
		$(this).parent('li').addClass('active');
	});
	$('.btn2').click(function (e) {
        e.preventDefault(); // 기존의 클릭 이벤트 방지
        // 현재 URL 가져오기
        var currentUrl = window.location.href.includes('orderby') ? window.location.href.slice(0, -11) : window.location.href;
        var orderbyValue = $(this).attr('href').replace('?', ''); // .btn2의 href 값 가져오기
        // 현재 URL에 이미 매개 변수가 있는지 확인
        var separator = currentUrl.includes('?') ? '&' : '?';
        // 새로운 URL 생성
        var newUrl = currentUrl + separator + orderbyValue;
        // 새로운 URL로 이동
        window.location.href = newUrl;
    });
	$('.page-link').click(function (e) {
        e.preventDefault(); // 기존의 클릭 이벤트 방지
        var cUrl = window.location.href.includes('pageNum') ? window.location.href.slice(0, -10) : window.location.href;
        if(window.location.href.includes('pageNum') && parseInt(getParameterByName('pageNum'))>9) {
        	cUrl = window.location.href.slice(0, -11);}
        var plValue = $(this).attr('href').replace('/shop?&', ''); // .page-link의 href 값 가져오기
        var separator = cUrl.includes('?') ? '&' : '?';
        window.location.href = cUrl + separator + plValue;
    });
	
    // 모든 .btn2에 대해 순회
    $('.btn2').each(function () {
        var hrefValue = $(this).attr('href').slice(-2);
        // 현재 orderby와 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('orderby') === hrefValue) {  $(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
    $('a.btn1').each(function () {
        var hrefValue2 = $(this).attr('href').slice(-2);
        // 현재 파라미터값과 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('sell') === hrefValue2 || getParameterByName('ori') === hrefValue2 || 
        		getParameterByName('size') === hrefValue2 || getParameterByName('cate') === hrefValue2 || getParameterByName('ptype') === hrefValue2) {  
        	$(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
  });
document.addEventListener("DOMContentLoaded", function() {
  // 3자리마다 컴마를 찍는 함수
  function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
});

    function getParameterByName(name) { 
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

document.addEventListener("DOMContentLoaded", function() {
    var titleElements = document.querySelectorAll(".title");
    var yearElements = document.querySelectorAll(".year");
    var price2Elements = document.querySelectorAll(".price2");

    // 각 title 요소에 대해 작업
    titleElements.forEach(function(element) {
      element.textContent = element.textContent.slice(0, 10);
    });

    // 각 year 요소에 대해 작업
    yearElements.forEach(function(element) {
      element.textContent = element.textContent.slice(0, 4);
    });

    // 각 price2 요소에 대해 작업
    price2Elements.forEach(function(element) {
      element.textContent = numberWithCommas(element.textContent);
    });

    // 3자리마다 컴마를 찍는 함수
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  });