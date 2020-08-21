<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<style>
ul,li{list-style:none;}
.slide{height:400px;}
.slide ul{position:relative;height:100%;}
.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
.slide li:nth-child(1){background-image:url("/resources/img/stay/1.jpg");animation-delay:0s}
.slide li:nth-child(2){background-image:url("/resources/img/stay/2.jpg");animation-delay:4s}
.slide li:nth-child(3){background-image:url("/resources/img/stay/3.jpg");animation-delay:8s}
.slide li:nth-child(4){background-image:url("/resources/img/stay/4.jpg");animation-delay:12s}
 /* 100 / 8 = 12.5 */
@keyframes fade {
	0% {opacity:0;}
	5% {opacity:1;}
	25% {opacity:1;}
	30% {opacity:0;}
	100% {opacity:0;}
}
#air_search {
	background:white;
	background-color: rgba( 255, 255, 255, 0.7 );
	height:100px;
	width:950px;
	position:absolute;
	top:250px;
	left:50%;
	transform:translate(-50%,0);
	margin-bottom:-300px;
}
#air_search input[type="text"] {
	height:50px; 
	border-radius:5px; 
	border:0.5px solid #e9e9e9;
	padding-left:10px;
	cursor:pointer;
	line-height:50px;
	margin-top:25px;
}
</style>
</head>
<body>
	<jsp:include page="../floatmenu.jsp"/>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
		
			<!-- 1start ------------------------------------------------------------------------------->
			<div style="position:relative; margin-bottom:10px;">
				<div class="slide">
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>	
				<div id="air_search">
					<div style="height:177.33px; text-align:center;">
						<input type="text" placeholder=지역선택 style="width:150px; margin-right:10px;">
						<input type="text" placeholder=체크인&nbsp;/&nbsp;체크아웃 style="width:280px; margin-right:10px;">
						<input type="text" placeholder=인원선택 style="margin-right:10px;">
						<input type="button" value="검색" 
						style="width:200px; height:50px; border:0.5px solid #e9e9e9; outline:none; 
						border-radius:5px; background:#0f4c81; color:white; cursor:pointer;">
					</div>
				</div>
			</div>	
			<!-- 1end -------------------------------------------------------------------------------->
			
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
	</div>		
</body>
</html>