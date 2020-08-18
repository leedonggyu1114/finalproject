<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<style>
#user-booking-list-area {
	position:relative;
	left:50%;
	width:1000px;
	transform:translate(-50%,0);
	padding-top:40px;
	padding-bottom:60px;
	background:orange;
}
</style>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../../header.jsp" /></div>
		<div id="menu"><jsp:include page="../../menu.jsp" /></div>
		<div id="container">
			<div id="user-booking-list-area">
				
			</div>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp"/></div>
	</div>		
</body>
</html>