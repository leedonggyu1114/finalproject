<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminstyle.css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script> -->
<style>
.div_over {
	background:black;
}
.admin_title {
	width: 200px;
	height: 60px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(255, 255, 255, 0.7);
	text-align: center;
	box-sizing: border-box;
	z-index: 99;
	vertical-align: middle;
}

.admin_title2 {
	width: 200px;
	height: 60px;
	position: relative;
}

.admin_title:before, 
.admin_title:after, 
.admin_title2:after,
.admin_title2:before {
	transition: all 0.4s ease;
	display: block;
	content: '';
	position: absolute;
	background: #0f4c81;
	z-index: 100;
}

.admin_title:before {
	top: 0;
	left: 0;
	right: 100%;
	height: 4px;
}

.admin_title:after {
	top: 0;
	right: 0;
	bottom: 100%;
	width: 4px;
}

.div_over:hover .admin_title:before {
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
	right: 0;
}

.admin_title2:after {
	bottom: 0;
	right: 0;
	left: 100%;
	height: 4px;
}

.admin_title2:before {
	bottom: 0;
	left: 0;
	top: 100%;
	width: 4px;
}

.div_over:hover .admin_title2:after {
	-webkit-transition-delay: .0s;
	transition-delay: .0s;
	left: 0;
}

.image {
	display: block;
	overflow: hidden;
	width: 300px;
	height: 300px;
	cursor: pointer;
}

.image>img {
	width: 100%;
	transition: transform 0.5s;
}

.image:hover>img {
	transform: translate(0%, 0%) scale(1.1);
	opacity:0.8;
}
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
				<div style="width:100%; padding-left:40px; padding-right:30px;">
					<c:forEach items="${list }" var="vo">
						<div style="float:left; position:relative; width:300px; height:300px;" class="div_over">
							<div class="image"><img  class="mainimage" src="/admin/display?fileName=${vo.h_image}"
							 width=300 height=300 x="${vo.h_x }" y="${vo.h_y }" address="${vo.h_address }" 
							 detail="${vo.h_detail }" style="cursor:pointer;"/></div>
							 <div class="admin_title">
							 	<div class="admin_title2">
							 		<div style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); width:100%;">${vo.h_title }</div>
							 	</div>
							 </div>
						</div>			
					</c:forEach>
				</div>
			</div>
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