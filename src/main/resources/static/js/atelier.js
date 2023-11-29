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
});

$(function () {

    // 파일업로드
    $("#fileInput").on('change', function () {  // 값이 변경되면
        if (window.FileReader) {  // modern browser
            var filename = $(this)[0].files[0].name;
        } else {  // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop();//파일명만 추출
        }
        // 추출한 파일명 삽입
        $("#userfile").val(filename);
    });
    
    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/g;
    $("input[name=id]").keyup(function () {
        if (regExp.test($(this).val())) {
            $("input[name=id]").val('');
        }
    });
    // 문의사항 작성페이지에서 textarea 태그내에 키업이벤트시 글자수 카운팅 > 표시
    $('textarea').keyup(function (e) {
        var content = $(this).val();
        $('#ta_count').html(content.length);
        if (content.length > 500) {
            $(this).val(content.substring(0, 500));
            $('#ta_count').html("500");
        }
    });
});

function formValidate(frm) {
    if (frm.id.value == '') {
        alert("아이디를 입력해주세요.");
        frm.id.focus();
        return false;
    }
    if (frm.id.value.length < 8 || frm.id.value.length > 12) {
        alert("아이디는 8~12자 사이만 가능합니다.");
        frm.id.focus();
        return false;
    }
    if (isNaN(frm.id.value.charAt(0)) == false) {
        alert('아이디는 숫자로 시작할 수 없습니다.');
        frm.id.focus();
        return false;
    }
    if (frm.id.readOnly == false) {
        alert('아이디 중복확인이 필요합니다.');
        return false;
    }
    //패스워드 입력 확인
    if (frm.pass1.value == '') {
        alert("패스워드를 입력해주세요."); frm.pass1.focus(); return false;
    }
    if (frm.pass2.value == '') {
        alert("패스워드 확인을 위해 재입력해주세요."); frm.pass2.focus(); return false;
    }
    if (frm.pass1.value != frm.pass2.value) {
        alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
        frm.pass1.value = '';
        frm.pass2.value = '';
        frm.pass1.focus();
        return false;
    }
    else {
        alert("로그인에 성공하였습니다!");
        sessionStorage.setItem("login", "true");
        location.href = "./barovone_main.html";
    }
}

function inputEmail(frm) {
    var choiceDomain = frm.email_domain.value;
    if (choiceDomain == '') {
        frm.email1.focus();
    }
    else if (choiceDomain == '직접입력') {
        frm.email2.value = '';
        frm.email2.readOnly = false;
        frm.email2.focus();
    }
    else {
        frm.email2.value = choiceDomain;
        frm.email2.readOnly = true;
    }
}
function focusMove(x, y, z) {
    if (document.getElementById(x).value.length >= z) {
        document.getElementById(y).focus();
    }
}
function validate(frm){ 
    if(!frm.agree1.checked || !frm.agree2.checked) {alert("이용약관과 개인정보취급방침에 동의해주세요."); return false;}
}//가입시 체크 확인 

//회원가입시 폼값인증
function jvalidate(frm) {
	if (frm.name.value == '') {
        alert("이름을 입력해주세요.");
        frm.name.focus(); return false;
    }
    var textColor1 = window.getComputedStyle(document.getElementById('idResult'), null).getPropertyValue("color");
    var textColor2 = window.getComputedStyle(document.getElementById('pwResult'), null).getPropertyValue("color");
    if (textColor1=='rgb(255, 0, 0)') {alert('아이디가 적합하지 않습니다.'); frm.id.focus(); return false;}
    if (textColor2=='rgb(255, 0, 0)') {alert('비밀번호가 일치하지 않습니다.'); frm.pw2.focus(); return false;}
    //패스워드 입력 확인
    if (frm.pw1.value == '') {
        alert("비밀번호를 입력해주세요."); frm.pw1.focus(); return false;
    }
    if (frm.pw1.value.length < 8 || frm.pw1.value.length > 12) {
        alert("비밀번호는 8~12자 사이만 가능합니다.");
        frm.pw1.focus(); return false;
    }
    if (frm.pw2.value == '') {
        alert("비밀번호 확인을 위해 재입력해주세요."); frm.pw2.focus(); return false;
    }
    if(frm.birth.value=='') {
		alert("생년월일을 입력해주세요."); frm.birth.focus(); return false;
	}
    if(frm.tel1.value==''||frm.tel2.value==''||frm.tel3.value=='') {
		alert("전화번호를 입력해주세요."); frm.tel1.focus(); return false;
	}
	if(frm.email1.value==''||frm.email2.value=='') {
		alert("이메일 주소를 입력해주세요."); frm.email1.focus(); return false;
	}
	if(frm.zip.value==''||frm.addr1.value==''||frm.addr2.value=='') {
		alert("주소를 입력해주세요."); frm.zip.focus(); return false;
	}
}
function inputEmail(frm) {
    var choiceDomain = frm.email_domain.value;
    if (choiceDomain == '') {
        frm.email1.focus();
    }
    else if (choiceDomain == '직접입력') {
        frm.email2.value = '';
        frm.email2.readOnly = false;
        frm.email2.focus();
    }
    else {
        frm.email2.value = choiceDomain;
        frm.email2.readOnly = true;
    }
}
function focusMove(x, y, z) {
    if (document.getElementById(x).value.length >= z) {
        document.getElementById(y).focus();
    }
}
//다음 주소 api
function postOpen() {
    new daum.Postcode({
        oncomplete: function (data) {
            console.log(data);
            console.log(data.zonecode);
            console.log(data.address);

            let frm = document.registF;
            frm.zip.value = data.zonecode;
            frm.addr1.value = data.address;
            frm.addr2.focus();
        }
    }).open();
}

$(function () {
	//비번확인 검증
	$('input[name=pw2]').keyup(function () {
        if ($(this).val()!=$("input[name=pw1]").val()) {
			$("#pwResult").text("비밀번호가 일치하지 않습니다.").css("color", "red");
        }else $("#pwResult").text("비밀번호가 일치합니다.").css("color", "blue");
    });
    //id 중복검사
	$('input[name=id]').keyup(function(){
		let params = {id:$('#id').val()}, id = $(this).val();
		$.post('idcheck.jsp', params, function(resD){console.log('콜백데이터', resD);
			if(resD==1) $('#idResult').html('이미 존재하는 아이디입니다.').css('color', 'red');
			else if(resD==0 && id.length>7 && id.length<13 && isNaN(id.charAt(0))){
				$('#idResult').html('사용 가능한 아이디 입니다.').css('color', 'blue');
			}else $('#idResult').html('아이디는 영문소문자로 시작하는 8~12자로 작성해주세요.').css('color', 'red');
		});
	});
});