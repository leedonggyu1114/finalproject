<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행의 설렘 TOURSUM !</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script> -->

</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp"/></div>
		<div id="menu"><jsp:include page="../menu.jsp"/></div>
		<div id="container">
			<div style="height:100px"></div>
			<!-- 여행추천list시작 -->
			<div>
				<c:forEach items="${list }" var="vo">
					<div style="float:left">
						<img  class="mainimage" src="/admin/display?fileName=${vo.h_image}"
						 width=300 height=300 x="${vo.h_x }" y="${vo.h_y }" address="${vo.h_address }" 
						 detail="${vo.h_detail }"/>
						 <div>${vo.h_title }</div>
					</div>			
				</c:forEach>
			</div>
			<!-- 여행추천list끝 -->
		</div>
	</div>
</body>
<script>
	//read
	$(".mainimage").on("click",function(){
		var x=$(this).attr("x");
		var y=$(this).attr("y");
		location.href="/admin/hotplace_read?h_x="+x+"&h_y="+y;
	});
</script>
</html>