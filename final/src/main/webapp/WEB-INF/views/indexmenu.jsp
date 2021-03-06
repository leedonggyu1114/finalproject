<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#div_menu_area {
	width: 100%;
	border-top: 0.5px solid black;
	border-bottom: 0.5px solid black;
	background: white;
	height: 50px;
	text-align: center;
	z-index: 10;
}

#main_menu, #sub_menu {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#main_menu>li {
	display: block;
	float: left;
	width: 150px;
}

#main_menu>li:nth-child(1) {
	margin-left: 34.3%;
}

#main_menu>li>a {
	display: block;
	padding: 14px 15px 13.5px 15px;
	text-align: center;
	text-decoration: none;
	color: black;
}

#sub_menu {
	display:none;
	position: absolute;
	background: white;
	opacity: 0;
	transition: all 0.5s;
}

#sub_menu>li {
	padding: 14px 15px 13.5px 15px;
	width: 150px;
}

#sub_menu>li:nth-child(1) {
	padding-top: 20px;
}

#sub_menu>li>a {
	text-decoration: none;
	color: black;
}

#sub_menu>li>a:hover {
	color:red;
}

#main_menu>li:hover #sub_menu {
	display:block;
	opacity: 1;
	z-index: 10;
	box-shadow:0px 6px 8px black;
}
.div_menu_area_Fixed {
	position: fixed;
	top: 0px;
}
.div_menu_area_Fixed #main_menu>li:nth-child(1) {
	margin-left:650px;
}
</style>

<div id="div_menu_area">
	<ul id="main_menu">
		<li><a href="/air/search">항공예약</a></li>
		<li><a href="/stay/search">숙소예약</a></li>
		<li><a href="/hotplace/list" id="hotplace">여행추천</a></li>
		<li><a href="">땡처리</a>
			<ul id="sub_menu">
				<li><a href="/air/discount">항공</a></li>
				<li><a href="">숙소</a></li>
			</ul></li>
	</ul>
</div>

<script>
	var bannerOffset = $('#div_menu_area').offset();
	$(window).scroll(function() { //window에 스크롤링이 발생하면
		if ($(document).scrollTop() > bannerOffset.top) { // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.
			$('#div_menu_area').addClass('div_menu_area_Fixed');
		} else {
			$('#div_menu_area').removeClass('div_menu_area_Fixed');
		}
	});
</script>
