<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style>
#header_menu {
	width: 300px;
	height: 50px;
	background: orange;
}

.menu-trigger, .menu-trigger span {
	display: inline-block;
	transition: all .4s;
	box-sizing: border-box;
}

.menu-trigger {
	position: relative;
	width: 35px;
	height: 28px;
}

.menu-trigger span {
	position: absolute;
	left: 0;
	width: 100%;
	height: 2px;
	display:inline-block;
	background-color: black;
	border-radius: 10px;
}

.menu-trigger span:nth-of-type(1) {
	top: 0;
}

.menu-trigger span:nth-of-type(2) {
	top: 50%;
	transform:translate(0,-50%);
}

.menu-trigger span:nth-of-type(3) {
	bottom: 0;
}

<!--
-->
.menu-trigger.active span:nth-of-type(1) {
	-webkit-transform: translateY(13px) rotate(-45deg);
	transform: translateY(13px) rotate(-45deg);
}

.menu-trigger.active span:nth-of-type(2) {
	opacity: 0;
}

.menu-trigger.active span:nth-of-type(3) {
	-webkit-transform: translateY(-12.9px) rotate(45deg);
	transform: translateY(-12.9px) rotate(45deg);
}
</style>
</head>
<body>
<%-- ${u_id},${u_k_id} --%>
	<div id="div_header_signup">
		<c:if test="${u_id==null && u_k_id==null && c_id==null}">
			<a href="/user/login">로그인</a>
			<a href="/user/signupselect">회원가입</a>
		</c:if>
		<c:if test="${u_id!=null && u_k_id=='0' || c_id!=null}">
				<a href="/user/logout">로그아웃</a>
		</c:if>
		<c:if test="${u_k_id!=null && u_id=='0'}">
			<a href="https://kauth.kakao.com/oauth/logout?client_id=44c4398b724d06191dbaf99c087795b1&logout_redirect_uri=http://localhost:8088/user/login">로그아웃</a>
		</c:if>
	</div>
	<a href="/"><img src="${pageContext.request.contextPath}/resources/img/logo4.png" width=300 id="header_logo"></a>

	<div style="display:inline-block; position:absolute; top:50%; transform:translate(0,-50%); right:10px;">
		<a href="/user/mypage/infomation">
			<img src="${pageContext.request.contextPath}/resources/img/header/mypage_icon.png" 
			onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/mypage_icon_hover.png'" 
			onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/mypage_icon.png'" 
			width=50>
		</a>
		<a href="/air/bookinglist" style="margin-left:15px; margin-right:15px;">
			<img src="${pageContext.request.contextPath}/resources/img/header/booking_icon.png" 
			onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/booking_icon_hover.png'" 
			onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/booking_icon.png'" 
			width=50>
		</a>
		<a href="/hotplace/likelist">
			<img src="${pageContext.request.contextPath}/resources/img/header/like_icon.png" 
			onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/like_icon_hover.png'" 
			onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/like_icon.png'" 
			width=50>
		</a>
	</div>
	<div id="header_menu">
		<a class="menu-trigger" href="#">
			<span> </span>
			<span> </span>
			<span> </span>
		</a>
	</div>
</body>
<script>
	$(".menu-trigger").on("click", function(){
		$(this).toggleClass('active');
	});
</script>
</html>