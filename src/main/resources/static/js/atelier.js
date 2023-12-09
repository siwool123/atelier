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

$( document ).ready( function() {
	 $(".year").each(function() { $(this).text($(this).text().slice(0, 4));});
    $(".price2").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$(".price3 b").each(function() { $(this).text(numberWithCommas($(this).text()));});
 	
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
    
    // 장바구니 전부 선택
    $("#chkAll").click(function () {
        if ($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    });
    $("input[name=chk]").click(function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;
        if (total != checked) $("#chkAll").prop("checked", false);
        else $("#chkAll").prop("checked", true);
    });
  });

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
    function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
    //주소창에서 파라미터 가져오는 함수
    function getParameterByName(name) { 
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
  });
  
 // 다음 주소 찾기 api
function postOpen() {
	new daum.Postcode({
		oncomplete : function(data) {
			console.log(data);
			console.log(data.zonecode);
			console.log(data.address);

			let frm = document.myMotherform;
			frm.zip.value = data.zonecode;
			frm.addr1.value = data.address;
			frm.addr2.focus();
		}
	}).open();
}

// 회원가입 버튼 클릭
function formValidate(frm) {
	//이메일에 입력 확인 
	if (frm.id.value == '') {
		alert("이메일을 인증해주세요.");
		frm.id.focus();
		return false;
	}

	// 비밀번호 정규식 검증
	var newPassword = document.getElementById('newPassword').value;
	var pass = document.getElementById('pass').value;
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	if (passwordRegex.test(newPassword)) {
		if (newPassword != pass) {
			alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
			//입력상자로 포커싱 한다. 
			document.getElementById('newPassword').focus();
			return false;
		}
	} else {
		alert("비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.");
		//입력상자로 포커싱 한다. 
		document.getElementById('newPassword').focus();
		return false;
	}

	//이름 입력 확인
	if (frm.name.value == '') {
		alert('이름을 입력해 주세요');
		frm.name.focus();
		return false;
	}

	// 휴대전화 입력 확인
	if (frm.phone.value == '') {
		alert("휴대전화를 인증해주세요.");
		frm.phone.focus();
		return false;
	}

	// 주소 입력 확인
	if (frm.zip.value == '') {
		alert("주소를 입력해 주세요.");
		frm.zip.focus(); return false;
	}

	if (frm.addr1.value == '') {
		alert("주소를 입력해 주세요.");
		frm.addr1.focus(); return false;
	}

	if (frm.addr2.value == '') {
		alert("상세주소를 입력해 주세요.");
		frm.addr2.focus(); return false;
	}

	if (frm.agreeCheck.checked == false) {
		alert("이용약관과 개인정보취급방침에 동의해주세요."); return false;
	}
}

//아이디 중복확인 
function idCheck(fn) {
	if (fn.id.value == '') {
		alert("아이디를 입력후 중복확인 해주세요.");
		fn.id.focus();
	} else {
		//아이디 중복확인 창을 띄울때 입력한 아이디를 쿼리스트링으로 넘겨준다. 
		window.open('RegiIdOverlap?id=' + fn.id.value, 'idOver', 'width=400,height=200');
		//입력한 아이디를 수정할 수 없도록 속성을 추가한다. 
		fn.id.readOnly = true;
	}
}

//이메일 인증
function emailCheck() {
	var popupWidth = 600;
	var popupHeight = 320;
	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
	window.open('guest/emailCheck', 'emailOver', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

//휴대전화 인증
function smsCheck() {
	var popupWidth = 600;
	var popupHeight = 320;
	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
	window.open('guest/smsCheck', 'emailOver', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

// 실시간 유효성 검증
$(function () {
	// 비밀번호 정규식 검증
	$("#newPassword").keyup(function() {
		var newPassword = document.getElementById('newPassword').value;
		var pass = document.getElementById('pass').value;
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
		if (passwordRegex.test(newPassword)) {
			$("#newPassword").attr("class", "form-control is-valid");
			$("#pass").attr("disabled", false);
		} else {
			$("#newPassword").attr("class", "form-control is-invalid");
			$("#pass").attr("disabled", true);
			$("#pass").attr("class", "form-control");
		}
	});
	
	//비밀번호 일치 검증
	$('input[id=pass]').keyup(function () {
        if ($("#pass").val()!=$("input[id=newPassword]").val()) {
			//$("#newPassword").attr("class", "form-control is-invalid");
			$("#pass").attr("class", "form-control is-invalid");
        }else {
			//$("#newPassword").attr("class", "form-control is-valid");
			$("#pass").attr("class", "form-control is-valid");
		}
    });
    
    // 이름 유효성 검사
    $('#m_name').keyup(function() {
    	var n_RegExp = /^[가-힣a-zA-Z]{2,15}$/;
    	var m_name = $('#m_name').val(); 
		if (n_RegExp.test(m_name)) {
			$("#m_name").attr("class", "form-control is-valid");
		} else {
			$("#m_name").attr("class", "form-control is-invalid");
		}
		
		/* 이름을 모두 지울경우 vaildation 표시 제거
		else if ($("input[name='name']").value=="") {
			$("input[name='name']").attr("class", "form-control");
		}   */
		
	})
	
	// 약관 동의 체크 확인
	$("#agreeCheck").click(function() {
		if ($("#agreeCheck").is(":checked")==true) {
			$("#agreeCheck").attr("class", "form-check-input is-valid");
		} else {
			$("#agreeCheck").attr("class", "form-check-input is-invalid");
		}
	})
	
	/*  일반회원-작가회원 버튼 클릭시
	$("#loginBtn").click(function() {
		$("#registBtn").attr("class", "btn btn-outline-danger")
		$("#loginBtn").attr("class", "btn btn-outline-danger active")
	})
	$("#registBtn").click(function() {
		$("#loginBtn").attr("class", "btn btn-outline-danger")
		$("#registBtn").attr("class", "btn btn-outline-danger active")
	}) */
	
});