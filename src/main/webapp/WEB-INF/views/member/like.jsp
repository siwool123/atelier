<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 제이쿼리(메인페이지용) -->
<!-- <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script> -->

<!-- 다음 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<!-- 레프트메뉴 등... -->
<style>
@media ( max-width : 600px) {
	.arttile2 {width: 50% !important;}
	#placeBack {width:100% !important; height:auto !important}
	.placebtn {display:block !important; float:none !important; top:0 !important;}
	.mh {margin-top:20px !important;}
}

.leftmenu li:nth-child(6) { background-color: black; }
.leftmenu li:nth-child(6) a, .leftmenu li:nth-child(6) a i { color: white }
.leftmenu li a { line-height: 30px !important; }
.leftmenu li a i { padding-top: 7px !important; }
.btn3, .btn4 { padding: 0 6% !important; }

.border li {
	line-height: 40px;
}

input {
	margin-right: 10px !important;
}

table.order tr th {
	background-color: #ededed;
}

table.order tr th, table.order tr td {
	padding-left: 20px;
}

.headerL4 {
	border-left: 5px solid black;
	font-weight: 900;
	letter-spacing: 0.2em;
	padding-left: 23px;
	margin-top: 100px;
	font-size: 16px;
}

#placeBack {
	height: 600px;
	padding-top: 250px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}
</style>

<!-- js, css -->
<script src="./js/atelier.js"></script>
<link href="./css/atelier.css" rel="stylesheet" type="text/css" />

<script>
	function placeVal(form) {
		//이미지 용량 제한
		let maxSize = 4 * 1024 * 1024; //* 4MB 사이즈 제한
		let fileSize = form.placeImage.files[0].size; //업로드한 파일용량 
		
		if(fileSize > maxSize){
			alert("파일첨부 사이즈는 4MB 이내로 가능합니다.");
			$(form.placeImage).val(''); //업로드한 파일 제거
			return; 
		}
		
		form.submit();
	}
	
	//좋아요 삭제하기
	function deleteLike(pidx) {
		if(confirm("해당 작품을 좋아요 목록에서 삭제하시겠습니까?")) {
			location.href ='/member/deleteLike.do?pidx='+pidx;
		}
	}
	
	//이미지 선택시 내공간에 띄우기
	function loadChkImg(chk) {
		/*이미지 태그 name 값 마지막 부분(숫자로 되어있음)을 잘라 num이라는 변수로 선언한다.
		이하 div태그 들에도 num을 붙여 뷰에서 foreach로 생성한 엘리먼트들에 각각 대응한다.*/ 
		let num = chk.id.slice(-1);
		//체크박스가 활성화된 경우
		if(chk.checked==true) {
			//이미지가 들어갈 박스 불러오기
			let placeBack = document.getElementById('placeBack');
		 	//새로운 img 태그 만들기
			var selectedImg = document.createElement("img");
		    //이미지 src 가져오기
			selectedImg.src = document.getElementById('likeImg'+num).src;
		    // 이미지에 id 부여
			selectedImg.id='selImg'+num;
		    //이미지 스타일 속성(크기 등) 조정
			selectedImg.setAttribute('style', 'max-width: 150px; box-shadow: 2px 2px 4px #333; z-index:99;');
		    //이미지를 placeBack Div에 추가
			placeBack.append(selectedImg);
		    //새로운 input 태그 만들기
		    var imgWidth = document.createElement("input");
		    //id 및 속성 부여
		    imgWidth.id = 'imgWidth'+num;
		    imgWidth.name = 'imgWidth'+num;
		    imgWidth.setAttribute('type', 'text');
		    imgWidth.setAttribute('placeholder', ''+num+'번째 이미지의 가로 크기(픽셀)');
		    imgWidth.setAttribute('style', 'magin: 0 auto;')
		    imgWidth.setAttribute('class', 'm-2')
		    var inputDiv = document.getElementById('inputDiv');
		    //inputDiv 자식으로 input 추가
		    inputDiv.append(imgWidth);
		} else {
			//체크박스가 비활성화된 경우 이미지 삭제
			document.getElementById('selImg'+num).remove();
			document.getElementById('imgWidth'+num).remove();
		}
		
		//input에 숫자 넘어오면 width값 바꾸기
		document.getElementById('imgWidth'+num).addEventListener('input', function(event) {
			document.getElementById('selImg'+num).setAttribute('style','max-width: '+event.target.value+'; box-shadow: 2px 2px 4px #333; z-index:99;')
		})
		
		// 드래그 셀렉션 막기
		const draggableElement = document.getElementById('selImg'+num);
		draggableElement.addEventListener('mousedown', function(event) {
		    event.preventDefault(); // 드래그 기본 동작 막기
		});
		
		//draggable 기능
		const draggable = document.getElementById('selImg'+num);
		let isDragging = false;
		let offsetX, offsetY;
		
		draggable.addEventListener('mousedown', function(event) {
			isDragging = true;
			offsetX = event.offsetX;
			offsetY = event.offsetY;
		});
		draggable.addEventListener('mousemove', function(event) {
			if (isDragging) {
				draggable.style.position = 'absolute';
				draggable.style.left = (event.clientX - offsetX) + 'px';
				draggable.style.top = (event.clientY - offsetY) + 'px';
			}
		});
		draggable.addEventListener('mouseup', function(event) {
			if (isDragging) { isDragging = false; }
		});
	}
</script>

<%@ include file="index.jsp"%>
<div class="container">
	<div class="row my-5">
		<div class="col-sm-2"><%@ include file="../include/memberSidebar.jsp"%></div>
		<div class="col-sm-10" style="padding-left: 50px;">
			<div class="headerL2 mb-4 mh" style="margin-top: 10px;">내공간에찜</div>
			<p>내 공간의 사진을 올려서 미술작품과 어울리는지 미리 체험해보세요.</p>
			<p>작품을 걸고 싶은 벽의 정면에서 찍은 사진을 올려주세요.</p>
			<p style="color: red;">* 파일첨부 사이즈는 4MB 이내로 가능합니다.</p>
			<form action="/member/editPlace.do" method="POST" enctype="multipart/form-data">
				<input type="file" id="placeImage" name="placeImage" onChange="return placeVal(this.form);" style="position: absolute; width: 0; height: 0; padding: 0; overflow: hidden; border: 0;" />
				<c:choose>
					<c:when test="${empty map.mdto.places}">
						<div class="mt-4" style="background-color: #ECECEC; width: 100%;">
							<div class="text-center" style="padding-top: 230px; height: 500px">
								<label class="me-4 btn1" for="placeImage" style="width: 50px; height: 50px; display: inline-block; vertical-align: middle; cursor: pointer;">+</label>
								<span>업로드한 내공간 이미지가 없습니다.</span>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-end my-4 placebtn" style="display: inline; float: right; position: relative; top: -100px;">
							<label class="btn1" for="placeImage" style="width: 50px; height: 50px; display: inline-block; vertical-align: middle; cursor: pointer;">+</label>
							<span class="ms-3">내공간 이미지 변경하기</span>
						</div>
						<div class="text-center" id="placeBack"  style="background-image: url(/uploads/${map.mdto.places});">
							<%-- <img id="placeImg" src="/uploads/${map.mdto.places}" style="width: 100%;"/> --%>
						</div>
						<div class="text-center" id="inputDiv"></div>

						
					</c:otherwise>
				</c:choose>
			</form>
			<img />

			<div class="headerL2 mt-5 mb-4" style="margin-top: 10px;">찜한작품</div>
			<p>찜한작품을 선택하면 내공간 이미지 위에 작품이 올라갑니다.</p>
			<p>작품 이미지를 적절한 위치로 움직여 내공간과 조화를 확인하세요.</p>

			<div class="my-5" id="show_data">
				<c:choose>
					<c:when test="${ empty plist }">
						<div class="text-center">찜한 작품이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="varrow" style="position: relative; display: inline; float: right; top: -100px;">
							<i class="bi bi-chevron-left slbtn prev" style="font-size: 40px;"></i> <i class="bi bi-chevron-right slbtn next" style="font-size: 40px;"></i>
						</div>
						<div class="swiper swiper-container sc3" style="position:relative; top:-30px">
							<div class="swiper-wrapper" style="height: auto !important;">
								<c:forEach items="${ plist }" var="row" varStatus="loop">
									<div class="swiper-slide arttile2">
										<input type="checkbox" name="likeImgChk" id="likeImgChk${loop.index}" class="ms-3 my-3" onChange="loadChkImg(this);" style="width: 30px; height: 30px;" />
										<i class="bi bi-x-lg mt-4 me-3" id="delLike${loop.index }" style="font-size: 25px; float: right; cursor: pointer;" onclick="deleteLike(${row.pidx });"></i>
										<div class="image">
											<a href="./view?pidx=${row.pidx }">
												<c:choose>
													<c:when test="${row.sfile.length()>40 }">
														<img id="likeImg${loop.index}" src="${row.sfile }" alt="" />
													</c:when>
													<c:otherwise>
														<img id="likeImg${loop.index}" src="./uploads/${row.sfile }" alt="" />
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="sub p-3">
											<div class="title mb-2 fw-bolder" style="font-size: 15px !important;">${row.title }</div>
											<div class="artist">
												<i class="fa-solid fa-user" style="color: #dddddd"></i>&nbsp;&nbsp;${row.m_name }
											</div>
											<div class="ptype">${row.p_type },
												<span class="year">${row.regidate }</span> <br />${row.size1 } x ${row.size2 } cm
											</div>
											<c:choose>
												<c:when test="${row.sold==1 }">
													<div class="price mt-1" style="color: #af0000;">● SOLD</div>
												</c:when>
												<c:otherwise>
													<div class="price mt-1">
														￦ <span class="price2">${row.price }</span>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>


		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>