<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminstyle.css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<style>
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
				
			</div>
		</div>
	</div>
</body>
<script>
	var bannerOffset = $('#admin_menu').offset();
	$(window).scroll(function() { //window에 스크롤링이 발생하면
		if ($(document).scrollTop() > bannerOffset.top) { // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.
			$('#admin_menu').addClass('admin_menu_Fixed');
		} else {
			$('#admin_menu').removeClass('admin_menu_Fixed');
		}
	});
</script>
</html>