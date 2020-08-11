<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#div_menu_area {
	width: 1200px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
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
	margin-left: 25%;
}

#main_menu>li>a {
	display: block;
	padding: 14px 15px 13.5px 15px;
	text-align: center;
	text-decoration: none;
	color: black;
}

#sub_menu {
	position: absolute;
	background: white;
	opacity: 0;
	visivility: hidden;
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

#main_menu>li:hover #sub_menu {
	opacity: 1;
	visibility: visible;
	z-index: 10;
}

.div_menu_area_Fixed {
	position: fixed;
	top: 0px;
}
</style>

<div id="div_menu_area">
	<ul id="main_menu">
		<li><a href="/air/search">항공예약</a></li>
		<li><a href="">숙소예약</a></li>
		<li><a href="/hotplace/list" id="hotplace">여행추천</a></li>
		<li><a href="">땡처리</a>
			<ul id="sub_menu">
				<li><a href="">항공</a></li>
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
