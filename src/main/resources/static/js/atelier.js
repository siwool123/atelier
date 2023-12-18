document.addEventListener('DOMContentLoaded', function () {
    var swiper = new Swiper('.sc1', {
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
    var swiper3 = new Swiper('.sc3', {
        slidesPerView: 4, // 한 번에 보여지는 슬라이드 개수
        spaceBetween: 0, // 슬라이드 사이의 간격 (픽셀)*/
        navigation: {
            nextEl: ".bi-chevron-right",
        	prevEl: ".bi-chevron-left",
        },
    	loop: false, // 무한 루프 활성화
    	//loopAdditionalSlides: 0,
    });
    
});


/*function handleActiveClass(selector, attributeName) {
    $(selector).each(function () {
        var hrefValue = $(this).attr('href').slice(-2);
        var isActive = getParameterByName(attributeName) === hrefValue;
        console.log(hrefValue);
        $(this).toggleClass('active', isActive);
        $(this).parent('li').toggleClass('active', isActive);
    });
}*/
/*document.addEventListener("DOMContentLoaded", function() {
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
  });*/
  
// 3자리마다 컴마를 찍는 함수
function numberWithCommas(x) {return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
//주소창에서 파라미터 가져오는 함수
function getParameterByName(name) { 
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
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

function postOpen2() {
	new daum.Postcode({
		oncomplete : function(data) {
			console.log(data);
			console.log(data.zonecode);
			console.log(data.address);

			let frm = document.orderFm;
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
		frm.id.focus(); return false;
	}

	// 비밀번호 정규식 검증
	var newPassword = document.getElementById('newPassword').value;
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	if (passwordRegex.test(newPassword)) {
		if (newPassword != frm.pass.value) {
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
		frm.name.focus(); return false;
	}

	// 휴대전화 입력 확인
	if (frm.phone.value == '') {
		alert("휴대전화를 인증해주세요.");
		frm.phone.focus(); return false;
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
	window.open('/guest/emailCheck', 'emailOver', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

//휴대전화 인증
function smsCheck() {
	var popupWidth = 600;
	var popupHeight = 320;
	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
	window.open('/guest/smsCheck', 'emailOver', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
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

$(document).on('change', '#chkAll', function() {
    $('input[name=chk]').prop('checked', this.checked);
    updateTotal();
});

$(document).on('change', 'input[name=chk]', function() {
    updateTotal();
});
function updateTotal() {
    var total = $('input[name=chk]').length;
    var totalChecked = $('input[name=chk]:checked').length;

    $('#chkAll').prop('checked', total === totalChecked);

    var sum = 0;
    var selectedPidxList = [];
    var selectedTitleList = [];
    $('input[name=chk]:checked').each(function() {
		var row = $(this).closest('tr');
        sum += parseInt(row.find('.price2').text().replace(/,/g, ''), 10);
    	selectedPidxList.push(row.attr('id').replace('cartItem_', ''));
    	selectedTitleList.push(row.find('b').text());
    });
    
    // 배열을 문자열로 변환하여 hidden input에 할당
    $('#pidxList').val(selectedPidxList.join(','));
    $('#titleList').val(selectedTitleList.join(','));
    
	console.log($('#titleList').val(), sum, selectedPidxList.join(','));
    $('#tnum').text(totalChecked);
    $('#tprice, #tprice2, #tprice3, #fprice').html(numberWithCommas(sum));
}
function inputMsg(frm) {
    var choiceMsg = frm.msg.value;
    if (choiceMsg == '직접입력') {
        frm.msg2.readOnly = false;
        frm.msg2.focus();
    }else {
        frm.msg2.value = choiceMsg;
        frm.msg2.readOnly = true;
    }
}
function submitFm(payMethod) {
        var fm = document.getElementById('orderFm');

		if (fm.m_name.value == '') {
				alert('수령인 이름을 입력해 주세요');
				fm.m_name.focus(); return;
		}
		if (fm.phone.value == '') {
			alert('수령인 휴대폰 번호를 입력해 주세요');
			fm.phone.focus(); return;
		}
		if (fm.zip.value == ''||fm.addr1.value == ''||fm.addr2.value == '') {
			alert('수령하실 주소를 입력해 주세요'); return;
		}
		if (fm.msg2.value == '') {
			alert('배송메세지를 입력해 주세요'); 
			fm.msg2.focus(); return;
		}
			
        fm.paymethod.value = 'bank';
		
        // 입금자명이 입력되었는지 확인
        if (fm.owner.value.trim() === '') {
            alert('무통장 입금 시 입금자명을 입력해야 합니다.'); 
            fm.owner.focus(); return;
        }
        
        fm.submit(); // 서버로 전송
    }

function activeByParam(paramName, paramValue, buttonId) {
    if (getParameterByName(paramName) === paramValue) {
        $('.btn1').removeClass('active');
        $('.btn1').parent('li').removeClass('active');
        $(buttonId).addClass('active');
        $(buttonId).parent('li').addClass('active');
    }
}

function activeByParam2(paramName, paramValue, buttonId) {
    if (getParameterByName(paramName) === paramValue) {
        $('.btn2').removeClass('active');
        $('.btn2').parent('li').removeClass('active');
        $(buttonId).addClass('active');
        $(buttonId).parent('li').addClass('active');
    }
}

$( document ).ready( function() {
	 $('.year').each(function() { $(this).text($(this).text().slice(0, 4));});
    $('.price2, #tprice, #tprice2, #tprice3, #fprice').each(function() { $(this).text(numberWithCommas($(this).text()));});
 	$('.price3 b').each(function() { $(this).text(numberWithCommas($(this).text()));});
 	
	$('a.btn2:first, a.btn2:first parent').addClass( 'active' );
	$('a#total').addClass( 'active' );
	
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
	
	if (window.location.pathname.endsWith("/shop") || window.location.pathname.endsWith("/auction")  || window.location.pathname.endsWith("/")) {
		$('.btn1').removeClass('active'); $('.btn1').parent('li').removeClass('active');
        $('#total').addClass('active');
        
        $('.btn2').removeClass('active'); $('.btn2').parent('li').removeClass('active');
        $('#date').addClass('active'); $('#date').parent('li').addClass('active');
    }
    activeByParam('sell', 'on', '#onsale');
	activeByParam('sell', 'so', '#sold');
	
    activeByParam('ori', 'sq', '#square');
	activeByParam('ori', 'la', '#landscape');
	activeByParam('ori', 'po', '#portrait');
	activeByParam('size', 'xs', '#xs');
	activeByParam('size', 'ss', '#ss');
	activeByParam('size', 'mm', '#mm');
	activeByParam('size', 'll', '#ll');
	activeByParam('size', 'xl', '#xl');
	activeByParam('cate', 'na', '#nature');
	activeByParam('cate', 'pe', '#people');
	activeByParam('cate', 'an', '#animal');
	activeByParam('cate', 'ob', '#obj');
	activeByParam('cate', 'ab', '#abs');
	activeByParam('cate', 'ot', '#oth');
	activeByParam('ptype', 'ac', '#acrylic');
	activeByParam('ptype', 'oi', '#oil');
	activeByParam('ptype', 'wa', '#water');
	activeByParam('ptype', 'in', '#ink');
	activeByParam('ptype', 'sk', '#sketch');
	activeByParam('ptype', 'mi', '#mix');
	
	activeByParam2('orderby', '00', '#date');
	activeByParam2('orderby', '11', '#heart');
	activeByParam2('orderby', '22', '#low');
	activeByParam2('orderby', '33', '#high');

	 activeByParam('status', 'aa', '#aa');
	activeByParam('status', 'bb', '#bb');
	activeByParam('status', 'cc', '#cc');
	/*$('.orderby li a').click( function(){
		$('.orderby li a').removeClass('active');
		$('.orderby li').removeClass('active');
		$(this).addClass('active');
		$(this).parent('li').addClass('active');
	});
    // 모든 .btn2에 대해 순회
    $('.btn2').each(function () {
        var hrefValue = $(this).attr('href').slice(-2);
        console.log(hrefValue);
        // 현재 orderby와 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('orderby') === hrefValue) {  
			$(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
    $('a.btn1').each(function () {
        var hrefValue2 = $(this).attr('href').slice(-2);
        // 현재 파라미터값과 href의 값이 일치하면 active 클래스 추가
        if (getParameterByName('sell') === hrefValue2 || getParameterByName('ori') === hrefValue2 || 
        		getParameterByName('size') === hrefValue2 || getParameterByName('cate') === hrefValue2 || 
        		getParameterByName('ptype') === hrefValue2) {  
        	$(this).addClass('active'); $(this).parent('li').addClass('active');
        } else { $(this).removeClass('active'); $(this).parent('li').removeClass('active');}  // 일치하지 않으면 active 클래스 제거
    });
    
    handleActiveClass('.btn2', 'orderby');
    handleActiveClass('a.btn1', 'sell');
    handleActiveClass('a.btn1', 'ori');
    handleActiveClass('a.btn1', 'size');
    handleActiveClass('a.btn1', 'cate');
    handleActiveClass('a.btn1', 'ptype');*/
    
    // 장바구니 전부 선택
    $("#chkAll").click(function () {
        if ($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    });
    $("input[name=chk]").click(function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;
        
        var sum = 0;
        $('input[name=chk]:checked').each(function() {
            // 체크된 제품의 가격을 가져와서 총합에 더함
            sum += parseInt($(this).closest('tr').find('.price2').text().replace(/,/g, ''));
        });
        
        $('#tnum').html(checked);
         $('#tprice, , #tprice2, #tprice3, #fprice').html(numberWithCommas(sum));
         
        if (total != checked) $("#chkAll").prop("checked", false);
        else $("#chkAll").prop("checked", true);
    });
    
    $('#point').focus(function () {
        if ($(this).val() === '0') { $(this).val(''); }
    });

    // #point 인풋에서 포커스가 빠져나갔을 때, 값이 비어 있다면 0으로 설정
    $('#point').blur(function () { if ($(this).val() === '') { $(this).val('0'); }
    });
    
    // 장바구니에서 결제시 포인트 검증
	$('#point').keyup(function() {
		// 입력된 값에서 숫자가 아닌 문자를 제거
	    if(isNaN($(this).val())) {$(this).val($(this).val().replace(/[^0-9]/g, ''));}
		//var sanitizedValue = $(this).val().replace(/[^0-9]/g, '');
	    // 숫자로 변환
	    var enteredPoint = parseInt($(this).val());
	    var maxPoint = parseInt($('#maxPoint').text());
	
	    if (enteredPoint > maxPoint) {
	        alert('보유하신 포인트를 초과하였습니다.');
	        $(this).val(0);
	    }
	   var ffprice = parseInt($('#tprice3').text().replace(/,/g, ''))-parseInt($(this).val());
	    
	    $('#fprice').html(numberWithCommas(ffprice));
	    $('#futurepoint').html(parseInt($('#tprice3').text().replace(/,/g, ''))*0.01);
	    $('input[name=oprice]').val(ffprice);
	    console.log("최종가격", ffprice);
	});
	
	//포인트 뺀 최종가격표시
	var finalPrice = parseInt($('#tprice3').text().replace(/,/g, '')) - parseInt($('#point').val()); // , 제거 후 숫자로 변환
	
	 $('#futurepoint').html(parseInt($('#tprice3').text().replace(/,/g, ''))*0.01);
	$('#fprice').html(numberWithCommas(finalPrice));
	$('input[name=oprice]').val(finalPrice);
	 
	/*$("#kakao").click(function(){
		
		if($('input[name="m_name"]').val()=='') {
			alert('수령인 이름을 입력해 주세요');
			$('input[name="m_name"]').focus(); return;
		}
		if ($('input[name="phone"]').val()=='') {
			alert('수령인 휴대폰 번호를 입력해 주세요');
			$('input[name="phone"]').focus(); return;
		}
		if ($('input[name="zip"]').val() == '' || $('input[name="addr1"]').val() == ''|| $('input[name="addr2"]').val() == '') {
			alert('수령하실 주소를 입력해 주세요'); return;
		}
		if ($('input[name="msg2"]').val() == '') {
			alert('배송메세지를 입력해 주세요'); 
			$('input[name="msg2"]').focus(); return;
		}
		$('input[name="paymethod"]').val('kakao');
		
		// 필수입력값을 확인
		var name = $("#orderFm input[name='mName']").val();
		var tel = $("#orderFm input[name='mPhone']").val();
		var email = $("#orderFm input[name='mId']").val();
		
		// 결제 정보를 form에 저장한다
		let totalPayPrice = parseInt($("#fprice").text().replace(/,/g,''));
		let totalPrice = parseInt($("#tprice3").text().replace(/,/g,''));
		let discountPrice = totalPrice - totalPayPrice; 
		let usePoint = $("#point").val();
		let useUserCouponNo = 0;
		
		// 카카오페이 결제전송
		$.ajax({
			type:'post'
			,url:'/pay/ready'
			,data:{
				total_amount: totalPayPrice
				,payUserName: name
				,sumPrice:totalPrice
				,discountPrice:discountPrice
				,totalPrice:totalPayPrice
				,tel:tel
				,email:email
				,usePoint:usePoint
				,useCouponNo:useUserCouponNo	
				
			},
			success:function(rsp){
				console.log(rsp);
				var msg = '결제가 완료되었습니다. 카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				$('#kakao').submit();	
			},
			error : function(errD){
				console.log(errD.status+" : "+errD.statusText);
				var msg = '결제에 실패하였습니다.' + errD.error_msg;
				alert(msg);
			}
		}); 
	});*/

	
 });
 
 
 function requestPay2(paymethod1) {
	
	if($('input[name="m_name"]').val()=='') {
		alert('수령인 이름을 입력해 주세요');
		$('input[name="m_name"]').focus(); return;
	}
	if ($('input[name="phone"]').val()=='') {
		alert('수령인 휴대폰 번호를 입력해 주세요');
		$('input[name="phone"]').focus(); return;
	}
	if ($('input[name="zip"]').val() == '' || $('input[name="addr1"]').val() == ''|| $('input[name="addr2"]').val() == '') {
		alert('수령하실 주소를 입력해 주세요'); return;
	}
	if ($('input[name="msg2"]').val() == '') {
		alert('배송메세지를 입력해 주세요'); 
		$('input[name="msg2"]').focus(); return;
	}
	$('input[name="paymethod"]').val(paymethod1);
	
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp76555372"); // 예: imp00000000
	
	var title = $('#titleList').val();
	if(title==''){title="test";}
	var amount = parseInt($('#fprice').text().replace(/,/g, ''));
	
  //IMP.request_pay(param, callback) 결제창 호출
  IMP.request_pay({ // param
      pg: paymethod1, //결제대행사 설정에 따라 다르며 공식문서 참고
      pay_method: "card", //결제방법 설정에 따라 다르며 공식문서 참고
      merchant_uid: $('#pidxList').val(), //주문(db에서 불러옴) 고유번호
      item_name : title,
      name : title,
      amount: amount,
      buyer_email: $('input[name="user_id"]').val(),
      buyer_name: $('input[name="m_name"]').val(),
      buyer_tel: $('input[name="phone"]').val(),
      buyer_addr: $('input[name="zip"]').val()+$('input[name="addr1"]').val()+$('input[name="addr2"]').val(),
      notice_url: "http://localhost:8586/member/orderResult",
      confirm_url: "http://localhost:8586/member/orderResult",
      //buyer_postcode: "01181"
  }, function (rsp) { // callback
		console.log(rsp);  
      if (rsp.success) {
    	// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우 // jQuery로 HTTP 요청
    	alert("1차결제성공");
    	$('input[name="imp_uid"]').val(rsp.imp_uid);
    	$('#orderFm').submit();
          /*jQuery.ajax({
            url: "/pay/proceed", 
            method: "POST",
	    	data : $('#orderFm').serialize() + "&imp_uid=" + rsp.imp_uid,
    		 success : function(data){
    			 if(data.cnt == 1){ 
    				 console.log(data);
    				 alert('주문 및 결제가 성공적으로 처리되었습니다.');
    				 // 성공적으로 처리된 경우, 특정 주소로 이동하면서 데이터를 전달
		            var successUrl = "/member/orderResult?" + encodeURIComponent(JSON.stringify(data));
		            window.location.href = successUrl;
    			 }else{  alert(data.msg)  }
    		 }, 
    		 error : function (e){  alert("에러"+e.status+" : "+e.statusText) 
    		 console.log(e.status+" : "+e.statusText); }
          })*/
      } else { alert('결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg);  }
  });
}

function trackWindow(tnum) {
	var popupWidth = 500;
	var popupHeight = 900;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/trackWindow?tnum='+tnum, 'track', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

function reviewWindow(pidx) {
	var popupWidth = 900;
	var popupHeight = 760;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/reviewW?pidx='+pidx, 'review', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

function reviewE(pidx) {
	var popupWidth = 900;
	var popupHeight = 900;

	var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
	var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));

	window.open('/member/reviewE?pidx='+pidx, 'reviewE', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupX + ', top=' + popupY);
}

//이미지 선택시 바로 이미지 띄우기
 function loadApplyImage(img) {
 	/* 파일용량 제한*/
 	let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
 	let fileSize = img.files[0].size; //업로드한 파일용량
 	
 	if(fileSize > maxSize){
 		alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
 		$(img).val(''); //업로드한 파일 제거
 		return; 
 	}
 	
     var file = img.files[0]; //선택된 파일 가져오기
 	//이미지 태그 name 값 마지막 부분(숫자로 되어있음)을 잘라 num이라는 변수로 선언한다.
 	let num = img.name.slice(-1);
 	
 	var showImgSpan = document.getElementById('showImg_'+num);
     //새로운 img 태그 만들기(img태그는 뷰에서 foreach로 만들어지지 않기 때문에 num을 붙일 필요없다.)
 	var selectedApplyImage = document.createElement("img");
     //이미지 source 가져오기
 	selectedApplyImage.src = URL.createObjectURL(file);
     //이미지 크기 조정
 	selectedApplyImage.setAttribute('style', 'max-width: 100px; max-height: 100px;');
     //이미지를 showImageDiv에 추가
 	showImgSpan.appendChild(selectedApplyImage);
 }
 function toggleDiv(divId) {
   var div = document.getElementById(divId);
   div.style.display = (div.style.display === 'block') ? 'none' : 'block';
}