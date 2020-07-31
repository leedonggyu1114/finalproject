<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
	<meta charset="UTF-8">
	<title>여행의 설렘 TOURSUM !</title>
	<link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
</head>
<body>
<div>${u_id}</div>
<div>${c_id}</div>
	<div id="div_header_signup">
		<c:if test="${u_id==null && c_id==null}">
			<a href="/user/login">로그인</a>
		</c:if>
		<c:if test="${u_id!=null || c_id!=null}">
			<a href="/user/logout">로그아웃</a>
		</c:if>
		<a href="/user/signupselect">회원가입</a>
	</div>
	<img src="${pageContext.request.contextPath}/resources/img/logo.png" width=200 id="header_logo">
	<div id="div_header_search">
		<input type="text" placeholder=search..>
		<img src="${pageContext.request.contextPath}/resources/img/header/search_icon.png" width=30>
	</div>
	<div id="div_header_burgermenu">
		<a href="#" class="menu">
			<span>메뉴</span>	
		</a>
	</div>
	<div id="div_header_bubble">
		<div id="bubble">
			<div id="information">
			</div>
			<div id="menu">
				<a href="/user/mypage/infomation">
					<img src="${pageContext.request.contextPath}/resources/img/header/mypage_icon.png" 
					onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/mypage_icon_hover.png'" 
					onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/mypage_icon.png'" 
					width=50>
				</a>
				<a href="">
					<img src="${pageContext.request.contextPath}/resources/img/header/booking_icon.png" 
					onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/booking_icon_hover.png'" 
					onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/booking_icon.png'" 
					width=50>
				</a>
				<a href="">
					<img src="${pageContext.request.contextPath}/resources/img/header/like_icon.png" 
					onmouseover="this.src='${pageContext.request.contextPath}/resources/img/header/like_icon_hover.png'" 
					onmouseout="this.src='${pageContext.request.contextPath}/resources/img/header/like_icon.png'" 
					width=50>
				</a>
			</div>
		</div>
	</div>
</body>
<script>
	$(".menu").click(function(e){
		e.preventDefault();
		$(this).toggleClass("on");
		$("#div_header_bubble").toggleClass("visible");
	});
</script>
</html>