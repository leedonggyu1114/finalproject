<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container" style="position:relative; margin-bottom:-3px;">
			<img src="/resources/img/success_id_background.png" width=1200 style="margin-top:75px;"/>
			<div style="position:absolute; top:115px; left:390px; font-size:20px;">${param.user_id}</div>
			<a href="/user/login" style="position:absolute; top:295px; right:193px;">
				<img src="${pageContext.request.contextPath}/resources/img/success_id_login.png" 
					onmouseover="this.src='${pageContext.request.contextPath}/resources/img/success_id_login_hover.png'"
					onmouseout="this.src='${pageContext.request.contextPath}/resources/img/success_id_login.png'" 
					width=150 style="cursor:pointer;"/>
			</a>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
</body>
</html>