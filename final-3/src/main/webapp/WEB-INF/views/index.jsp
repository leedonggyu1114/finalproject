<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행의 설렘 TOURSUM !</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
</head>
<body>
	<jsp:include page="sidebar.jsp"/>
	<button type="button" name="button" class="ac-sub-go-top">위로</button>
	<div id="page">
		<div id="header"><jsp:include page="header.jsp"/></div>
		<div id="menu"><jsp:include page="menu.jsp"/></div>
		<div id="container">
			<div id="div_container_area1"> <!-- 퀵검색, 테마 -->
				<div id="div_container_quick">
					<div><p>고객님,<br><strong>어떤 여행을 꿈꾸시나요?</strong></p></div>
					<div class="tapmenu">
						<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1"><b>항공</b></li>
							<li class="tab-link" data-tab="tab-2"><b>숙소</b></li>
						</ul>
						<!-- 항공 퀵 검색 -->
						<div id="tab-1" class="tab-content current">
							<ul class="tabs2">
								<li class="tab-link2 current2" data-tab="tab-3">편도</li>
								<li class="tab-link2" data-tab="tab-4">왕복</li>
							</ul>
							<div id="tab-3" class="tab-content2 current2">
								<div id="tab-3-1">
									<input type="text" placeholder="출발지" 
									onfocus="this.placeholder=''" onblur="this.placeholder='출발지'">
									<img src="/resources/img/container/container_icon.png">
									<input type="text" placeholder="도착지" 
									onfocus="this.placeholder=''" onblur="this.placeholder='도착지'"><br>
								</div>
								<div id="tab-3-2">
									<input type="text" class="date" placeholder="가는날"
									onfocus="this.placeholder=''" onblur="this.placeholder='가는날'">
								</div>
								<div id="tab-3-3">
									<input type="text" class="airpersons1" placeholder="인원선택"
									onfocus="this.placeholder=''" onblur="this.placeholder='인원선택'">
									<div class="aircount1">
										<h5>인원</h5>
										<div>
											<div>
												<span>성인</span>
												<button>-</button>
												<input type="text" value="1" readonly>
												<button>+</button>
											</div>
											<div>
												<span>아동</span>
												<button>-</button>
												<input type="text" value="1" readonly>
												<button>+</button>
											</div>
											<div>
												<button id="btn">선택완료</button>
											</div>
										</div>
									</div>
								</div>
								<div id="tab-3-4">
									<input type="button" value="항공권 검색">
								</div>
							</div>
							<div id="tab-4" class="tab-content2">
								<div id="tab-4-1">
									<input type="text" placeholder="출발지"
									onfocus="this.placeholder=''" onblur="this.placeholder='출발지'">
									<img src="/resources/img/container/container_icon.png">
									<input type="text" placeholder="도착지"
									onfocus="this.placeholder=''" onblur="this.placeholder='도착지'"><br>
								</div>
								<div id="tab-4-2">
									<input type="text" class="date" placeholder="가는날"
									onfocus="this.placeholder=''" onblur="this.placeholder='가는날'">
									<input type="text" class="date" placeholder="오는날"
									onfocus="this.placeholder=''" onblur="this.placeholder='오는날'">
								</div>
								<div id="tab-4-3">
									<input type="text" class="airpersons2" placeholder="인원선택"
									onfocus="this.placeholder=''" onblur="this.placeholder='인원선택'">
									<div class="aircount2">
										<h5>인원</h5>
										<div>
											<div>
												<span>성인</span>
												<button>-</button>
												<input type="text" value="1" readonly>
												<button>+</button>
											</div>
											<div>
												<span>아동</span>
												<button>-</button>
												<input type="text" value="1" readonly>
												<button>+</button>
											</div>
											<div>
												<button id="btn">선택완료</button>
											</div>
										</div>
									</div>
								</div>
								<div id="tab-4-4">
									<input type="button" value="항공권 검색">
								</div>
							</div>
						</div>
						<!-- 숙박 퀵 검색 -->
						<div id="tab-2" class="tab-content">
							<div id="tab-2-1">
								<input type="text" placeholder="지역선택"
								onfocus="this.placeholder=''" onblur="this.placeholder='지역선택'">
							</div>
							<div id="tab-2-2">
								<input type="text" class="placedate" placeholder="체크인 / 체크아웃"
								onfocus="this.placeholder=''" onblur="this.placeholder='체크인 / 체크아웃'">
							</div>
							<div id="tab-2-3">
								<input type="text" class="staypersons" placeholder="인원선택"
								onfocus="this.placeholder=''" onblur="this.placeholder='인원선택'" >
								<div class="staycount">
									<h5>인원</h5>
									<div>
										<div>
											<span>성인</span>
											<button>-</button>
											<input type="text" value="1" readonly>
											<button>+</button>
										</div>
										<div>
											<span>아동</span>
											<button>-</button>
											<input type="text" value="1" readonly>
											<button>+</button>
										</div>
										<div>
											<button id="btn">선택완료</button>
										</div>
									</div>
								</div>
							</div>
							<div id="tab-2-4">
								<input type="button" value="숙소 검색">
							</div>
						</div>
					</div>
				</div>
				<div id="div_container_tema">
					<div id="wrapper">
						<div id="slider-wrap">
							<ul id="slider">
								<li>
									<div>
										<h3>Slide #1</h3>
										<span>Sub-title #1</span>
									</div> <img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
								</li>
								<li>
									<div>
										<h3>Slide #2</h3>
										<span>Sub-title #2</span>
									</div> <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
								</li>
								<li>
									<div>
										<h3>Slide #3</h3>
										<span>Sub-title #3</span>
									</div> <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
								</li>
								<li>
									<div>
										<h3>Slide #4</h3>
										<span>Sub-title #4</span>
									</div> <img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
								</li>
								<li>
									<div>
										<h3>Slide #5</h3>
										<span>Sub-title #5</span>
									</div> <img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
								</li>
							</ul>
							<!--controls-->
							<div class="btns" id="next">
								<i class="fa fa-arrow-right"></i>
							</div>
							<div class="btns" id="previous">
								<i class="fa fa-arrow-left"></i>
							</div>
							<div id="counter"></div>
							<div id="pagination-wrap">
								<ul>
								</ul>
							</div>
							<!--controls-->
						</div>
					</div>
				</div>
			</div>
			<div id="div_container_area2"> <!-- 회원별 추천여행 -->
				
			</div>
			<div id="div_container_area3"> <!-- 땡처리 -->
			
			</div>
			<div id="div_container_area4"> <!-- 숙소 예약,결제많은순 -->
			
			</div>
		</div>
		<div id="footer"><jsp:include page="footer.jsp"/></div>
	</div>
</body>
<script>
	$(".staycount").hide();
	$(".aircount1").hide();
	$(".aircount2").hide();
	
	// 항공, 숙소 퀵 검색
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

	$('ul.tabs2 li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs2 li').removeClass('current2');
		$('.tab-content2').removeClass('current2');

		$(this).addClass('current2');
		$("#" + tab_id).addClass('current2');
	})
	
	// 달력
	$(".date").datepicker({});
	
	// 인원선택
	$(".staypersons").toggle(function() {
		$(".staycount").show();
		$("html").animate({
			scrollTop: 300
		}, 500);
	}, function() {
		$(".staycount").hide();
	});

	$(".airpersons1").toggle(function() {
		$(".aircount1").show();
		$("html").animate({
			scrollTop: 300
		}, 500);
	}, function() {
		$(".aircount1").hide();
	});
	
	$(".airpersons2").toggle(function() {
		$(".aircount2").show();
		$("html").animate({
			scrollTop: 300
		}, 500);
	}, function() {
		$(".aircount2").hide();
	});

	// top 스크롤
	$(window).scroll(function() {
		var quickHeight = $(document).scrollTop(); //스크롤 높이가 500 이상이면 나타나기
		if (500 <= quickHeight) {
			$('.ac-sub-go-top').css('display', 'block');
		} else {
			$('.ac-sub-go-top').css('display', 'none');
		}
	});

	$('.ac-sub-go-top').click(function() {//위로가기 버튼을 클릭했을때
		$('html, body').animate({
			scrollTop : '0'
		}, 800);
	});

	/*슬라이드 배너*/
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();

	$(document).ready(function() {

		/*****************
		 BUILD THE SLIDER
		 *****************/
		//set width to be 'x' times the number of slides
		$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

		//next slide    
		$('#next').click(function() {
			slideRight();
		});

		//previous slide
		$('#previous').click(function() {
			slideLeft();
		});

		/*************************
		 //*> OPTIONAL SETTINGS
		 ************************/
		//automatic slider
		var autoSlider = setInterval(slideRight, 3000);

		//for each slide 
		$.each($('#slider-wrap ul li'), function() {

			//create a pagination
			var li = document.createElement('li');
			$('#pagination-wrap ul').append(li);
		});

		//counter
		countSlides();

		//pagination
		pagination();

		//hide/show controls/btns when hover
		//pause automatic slide when hover
		$('#slider-wrap').hover(function() {
			$(this).addClass('active');
			clearInterval(autoSlider);
		}, function() {
			$(this).removeClass('active');
			autoSlider = setInterval(slideRight, 5000);
		});

	});//DOCUMENT READY

	/***********
	 SLIDE LEFT
	 ************/
	function slideLeft() {
		pos--;
		if (pos == -1) {
			pos = totalSlides - 1;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional
		countSlides();
		pagination();
	}

	/************
	 SLIDE RIGHT
	 *************/
	function slideRight() {
		pos++;
		if (pos == totalSlides) {
			pos = 0;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional 
		countSlides();
		pagination();
	}

	/************************
	 //*> OPTIONAL SETTINGS
	 ************************/
	function countSlides() {
		$('#counter').html(pos + 1 + ' / ' + totalSlides);
	}

	function pagination() {
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
	}
</script>
</html>