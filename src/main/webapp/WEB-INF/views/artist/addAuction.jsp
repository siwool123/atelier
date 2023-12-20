<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 레프트메뉴 등... -->
<style>
@media (max-width: 600px) {
}
.leftmenu li:nth-child(2) {background-color: black;}
.leftmenu li:nth-child(2) a,
.leftmenu li:nth-child(2) a i {color:white}
.leftmenu li a {line-height:30px !important;}
.btn3, .btn4 {padding:0 6% !important;}
.border li {line-height:40px;}
input {margin-right:10px !important;}
table.order tr th {background-color:#ededed;}
table.order tr th, table.order tr td {padding-left:20px;}
.headerL4 {border-left:5px solid black; font-weight:900; letter-spacing: 0.2em; padding-left: 23px; margin-top:100px; font-size: 16px;}
._table {display: table;}
._row {display: table-row;}
._cell {display: table-cell;}
input,
select {width: 80%; padding: 0px !important;}
tr {padding-top: 20px; padding-bottom: 20px;}
.headerL2 {margin-top: 10px !important;}
</style>

<script>

window.onload = function() {
	let defSrc = document.getElementById('selectedBgimg').src;
	let bgimgSrc = defSrc.split('images/')[1];
	document.getElementById('bgimg').value = bgimgSrc;
}


//이미지 선택시 바로 이미지 띄우기
function loadAddProdImg(img) {
	
	//체크박스가 비활성화된 경우 이미지 삭제
	if(document.getElementById('imgForBac') != null) {
		document.getElementById('imgForBac').remove();
		document.getElementById('imgWidth').remove();
	}
	
	/* 파일용량 제한*/
	let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
	let fileSize = img.files[0].size; //업로드한 파일용량
	
	if(fileSize > maxSize){
		alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
		$(img).val(''); //업로드한 파일 제거
		return; 
	}
	
	//선택된 파일 가져오기
    var file = img.files[0];
	
    //기존 childProdSpan태그를 삭제후 다시 만든다(이미지 두번 선택 방지)
   	document.getElementById("childProdSpan").remove();
    //img태그가 담길 span 태그 새로 만들기
    var childProdSpan = document.createElement("span");
    //새로 만든 div 태그에 id 부여
    childProdSpan.id='childProdSpan'
    //td(addProdTd) 태그에 div(childProdSpan) 태그 추가
    document.getElementById('addProdTd').append(childProdSpan);
    
    //새로운 img 태그 만들기
	var selAddImg = document.createElement("img");
    //이미지 source 가져오기
	selAddImg.src = URL.createObjectURL(file);
    
    // test후 지울것
    console.log(selAddImg.src);
    
    //이미지 크기 조정
	selAddImg.setAttribute('style', 'max-width: 150px; max-height: 150px;');
    //이미지를 childProdSpan에 추가
	childProdSpan.appendChild(selAddImg);
    
 	//배경에 넣을 img 태그 만들기
	var imgForBac = document.createElement("img");
    //이미지 src 가져오기
	imgForBac.src = selAddImg.src;
    // 이미지에 id 부여
	imgForBac.id='imgForBac';
    //이미지 스타일 속성(크기 등) 조정
	imgForBac.setAttribute('style', 'position: relative; max-width: 100px; top: 200px; box-shadow: 2px 2px 4px #333; z-index:99;');
    //이미지를 넣을 td 태그 불러오기
    let bgimgTd = document.getElementById('bgimgTd')
    //이미지를 placeBack Div에 추가
	bgimgTd.prepend(imgForBac);
    
    //새로운 input 태그 만들기
    var imgWidth = document.createElement("input");
    //id 및 속성 부여
    imgWidth.id = 'imgWidth';
    imgWidth.name = 'imgWidth';
    imgWidth.setAttribute('type', 'text');
    imgWidth.setAttribute('placeholder', '작품 이미지의 가로 크기(픽셀)');
    imgWidth.setAttribute('style', 'magin: 0 auto;')
    imgWidth.setAttribute('class', 'm-2')
    
    //bgimgTd 자식으로 input 추가
    bgimgTd.append(imgWidth);
	
	//input에 숫자 넘어오면 width값 바꾸기
	document.getElementById('imgWidth').addEventListener('input', function(event) {
		document.getElementById('imgForBac').setAttribute('style','position: relative; max-width: '+event.target.value+'; top: 200px; box-shadow: 2px 2px 4px #333; z-index:99;')
	})
}

function changeBgimg1() {
	document.getElementById('selectedBgimg').src = document.getElementById('bgimg1').src;
	let bgimgSrc = document.getElementById('selectedBgimg').src.split('images/')[1];
	document.getElementById('bgimg').value = bgimgSrc;
}

function changeBgimg2() {
	document.getElementById('selectedBgimg').src = document.getElementById('bgimg2').src;
	let bgimgSrc = document.getElementById('selectedBgimg').src.split('images/')[1];
	document.getElementById('bgimg').value = bgimgSrc;
}

function changeBgimg3() {
	document.getElementById('selectedBgimg').src = document.getElementById('bgimg3').src;
	let bgimgSrc = document.getElementById('selectedBgimg').src.split('images/')[1];
	document.getElementById('bgimg').value = bgimgSrc;
}

document.addEventListener('DOMContentLoaded', function() {
    var titleInput = document.querySelector('input[name=title]');
    var titleLength = document.getElementById('titleLength');
    
    titleInput.addEventListener('keyup', function() {
        titleLength.textContent = this.value.length;
        if (this.value.length > 80) {
            alert("작품명은 80자 이내로 입력해주세요.");
            this.value = this.value.substring(0, 80);
            titleLength.textContent = "80";
            this.focus();
        }
    });

    var introTextarea = document.querySelector('textarea[name=p_intro]');
    var introLength = document.getElementById('introLength');
    
    introTextarea.addEventListener('keyup', function() {
        introLength.textContent = this.value.length;
        if (this.value.length > 800) {
            alert("작품 소개는 800자 이내로 입력해주세요.");
            this.value = this.value.substring(0, 800);
            introLength.textContent = "800";
            this.focus();
        }
    });
});

function addProdValidate(form) {
	//작가 소개 글자수 검증
	if(form.title.value.length<2 || form.title.value.length>80) {
		alert('작품명은 2자 이상 80자 이내로 입력해주세요.');
		form.title.focus(); return false;
	}
	if(form.price.value == "") {
		alert('희망 판매가를 입력해주세요.');
		form.price.focus(); return false;
	}
	if(form.size1.value == "") {
		alert('가로 사이즈를 입력해주세요.');
		form.size1.focus(); return false;
	}
	if(form.size2.value == "") {
		alert('세로 사이즈를 입력해주세요.');
		form.size2.focus(); return false;	
	}
	if(form.theme.value == 0) {
		alert('작품 주제를 선택해주세요.');
		form.theme.focus(); return false;
	}
	if(form.framed.value == -1) {
		alert('프레임 여부를 선택해주세요');
		form.gramed.focus(); return false;
	}
	if(form.p_type.value == 0) {
		alert('작품 타입을 선택해주세요.');
		form.p_type.focus(); return false;		
	}
	if(form.p_intro.value == "") {
		alert('작품 소개를 입력해주세요.');
		form.p_intro.focus(); return false;
	}
	if(form.addProdImg.value == "") {
		alert('작품 이미지를 업로드해주세요.');
		form.addProdImg.focus(); return false;
	}
	var enddateValue = document.getElementById('enddate').value;

	if (!enddateValue) {
	    alert('경매 종료일을 선택해주세요.');
	    return false;
	} else {
	    var selectedDate = new Date(enddateValue);
	    var now = new Date();
	    var oneDayInMillis = 24 * 60 * 60 * 1000; // 1일을 밀리초로 변환
	    var thirtyDaysInMillis = 30 * oneDayInMillis; // 30일을 밀리초로 변환
	    if (selectedDate.getTime() < now.getTime() + oneDayInMillis) {
	        alert('경매 종료일은 현재로부터 최소 1일 이후, 최대 30일 이내여야 합니다.');
	        return false;
	    } else if (selectedDate.getTime() - now.getTime() > thirtyDaysInMillis) {
	    	alert('경매 종료일은 현재로부터 최소 1일 이후, 최대 30일 이내여야 합니다.');
	    	return false;
	    }
	}
}
</script>

<%@ include file="artistIndex.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/artistSidebar.jsp" %></div>
		<div class="col-sm-10" style="padding-left:50px;">
			<ul class="nav nav-tabs" style="width: 112px; float: right;">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="sell-tab" data-bs-toggle="tab" data-bs-target="#sellP" type="button" role="tab" aria-controls="sell" aria-selected="false" onClick="location.href='/artist/addProduct'">
						판매
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="auction-tab" data-bs-toggle="tab" data-bs-target="#auctionP" type="button" role="tab" aria-controls="sell" aria-selected="true" onClick="location.href='/artist/addAuction'">
						경매
					</button>
				</li>
			</ul>
			<!-- <span class="btn1" style="float: right; cursor: pointer;">경매</span>
			<span class="btn1" style="float: right; cursor: pointer;">판매</span> -->
			<p class="headerL2 mb-5">경매작품 등록</p>
			<form id="addProdFrm" action="/artist/addAuction.do" onSubmit="return addProdValidate(this);" enctype="multipart/form-data" method="post">
			<table class="mt-4" style="width: 85%;">
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tr style="height: 80px;">
					<td>
						<span>작품명</span><br/>
						<span id="titleLength" style="color: gray;">0</span><span style="color: gray;">/80</span>
					</td>
					<td colspan="3">
						<input name="title" type="text" placeholder="2자 이상 80자 이내로 입력하세요."></input>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td>
						<span>경매 시작가</span><br/>
						<span style="color: gray;">(원)</span>
					</td>
					<td colspan="3">
						<input type="number" name="price" min="10000" step="10000" style="width: 40%;" value="10000" />
						<span style="color: red;">판매수수료의 10%를 제외한 나머지가 정산됩니다.</span>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td>
						<span>가로 사이즈(cm)</span>
					</td>
					<td>
						<input name="size1" type="number" min="10"/>
					</td>
					<td>
						<span>세로 사이즈(cm)</span>
					</td>
					<td>
						<input name="size2" type="number" min="10"/>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td>
						<span>작품 주제</span>
					</td>
					<td>
						<select name="theme">
							<option value="0">작품주제를 선택하세요.</option>
							<option value="자연/풍경">자연/풍경</option>
							<option value="인물">인물</option>
							<option value="동식물">동식물</option>
							<option value="사물">사물</option>
							<option value="추상">추상</option>
							<option value="기타">기타</option>
						</select>
					</td>
					<td>
						<span>작품 타입</span>
					</td>
					<td>
						<select name="p_type">
							<option value="0">작품타입을 선택하세요.</option>
							<option value="아크릴">아크릴</option>
							<option value="유화">유화</option>
							<option value="수채화">수채화</option>
							<option value="수묵화">수묵화</option>
							<option value="스케치">스케치</option>
							<option value="혼합/기타">혼합/기타</option>
						</select>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td>
						<span>프레임 유무</span>
					</td>
					<td>
						<select name="framed"">
							<option value="-1">프레임 유무를 선택하세요.</option>
							<option value="1">유</option>
							<option value="0">무</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">
						<span>작품 소개</span><br/>
						<span id="introLength" style="color: gray">0</span><span style="color: gray">/800</span>
					</td>
					<td colspan="3">
						<textarea name="p_intro" placeholder="80자이상 800자 이내로 입력하세요." rows="10" style="width: 100%;"></textarea>
					</td>
				<tr>
				<tr style="height: 20px;"></tr>
				<tr style="height: 80px;">
					<td style="vertical-align: top;">
						<span>작품 이미지</span><br/>
						<span style="color: gray">(용량 최대 4MB)</span>
					</td>
					<td colspan="3" id="addProdTd" style="vertical-align: top;">
						<label class="btn1" for="addProdImg" style="width: 50px; height: 50px; cursor: pointer;">+</label>
						<input type="file" id="addProdImg" name="addProdImg" onChange="loadAddProdImg(this);" style="position: absolute; width: 0; height: 0; padding: 0; overflow: hidden; border: 0;"/>
						<span id="childProdSpan"></span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<span class="fw-bolder" >작품 배경 이미지 선택</span>
						<span> / 업로드한 작품과 어울리는 배경 이미지를 선택하세요.</span>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 20px; padding-bottom: 40px;">
						<img onClick="changeBgimg1();" id="bgimg1" src="/images/living11.jpg" style="max-width: 150px; max-height: 150px; cursor: pointer"/>
						<img onClick="changeBgimg2();" id="bgimg2" src="/images/desk1.jpg" style="max-width: 150px; max-height: 150px; cursor: pointer;"/>
						<img onClick="changeBgimg3();" id="bgimg3" src="/images/bed1.jpg" style="max-width: 150px; max-height: 150px; cursor: pointer;"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<p>작품이미지를 업로드하고 작품 배경 이미지를 선택하면 하단에 두 이미지가 겹쳐서 표시됩니다.<br/>
						상단 레이어에 있는 작품 이미지를 적절한 위치로 움직이고 크기를 맞춰 작품이 공간에 걸린 모습을 연출해주세요.</p>
					</td>
				</tr>
				<tr>
					<td class="text-center" id="bgimgTd" colspan="4">
						<img id="selectedBgimg" src="/images/living11.jpg" style="width: 100%"/>
						<input type="hidden" id="bgimg" name="bgimg"/>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td colspan="4">
						<p>경매종료일은 등록일로부터 최대 30일 내에서 설정 가능합니다.</p>
					</td>
				</tr>
				<tr style="height: 80px;">
					<td>
						<span>경매종료일</span>
					</td>
					<td colspan="3">
						<input type="hidden" name="auction" value="1"/>
						<input type="date" id="enddate" name="enddate" style="width: 200px"/>
					</td> 
				</tr>
				<tr style="height: 50px;">
					<td class="text-center" colspan="4">
						<input type="submit" class="btn btn-dark" style="max-width: 105px; height: 40px;" value="경매 상품 등록"/>
					</td>
				</tr>
			</table>
			</form>
			
		</div>
	</div>
</div>		
<%@ include file="../include/footer.jsp" %>