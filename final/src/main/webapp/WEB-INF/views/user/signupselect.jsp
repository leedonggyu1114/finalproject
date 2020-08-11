<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<style>
	#signup-area {
		padding:40px;
		position:relative;
	}
	#signup-area ul.signup-tab {
		list-style:none;
	}
	#signup-area ul.signup-tab li {
		background:none;
		color:black;
		display:inline-block;
		cursor:pointer;
		width:200px;
		padding:10px 5px 10px 5px;
		text-align:center;
		z-index:9;
	}
	#signup-area ul.signup-tab li:nth-child(1) {
		position:relative;
		left:50%;
		transform:translate(-100%,0);
	}
	#signup-area ul.signup-tab li:nth-child(2) {
		position:relative;
		left:50%;
		transform:translate(-100%,0);
		margin-left:-5px;
	}
	#signup-area .signup-content {
		display:none;
		width:840px;
		overflow:hidden;
		border-top:0.5px solid gray;
		padding-bottom:30px;
		position:relative;
		left:50%;
		transform:translate(-50%,0);
	}
	#signup-area .signup-content.current {
		display:inherit;
	}
	#signup-area ul.signup-tab li.current {
		background:white;
		border:0.5px solid gray;
		border-top:3px solid #0f4c81;
		border-bottom:3px solid white;
		z-index:9;
		margin-bottom:-2px;
	}
	
	#div_header_burgermenu{
		display:none;
	}
</style>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div id="signup-area">
				<ul class="signup-tab">
					<li class="tab-link current" data-tab="Regular">
						<b>일반 회원 가입하기</b>
					</li>
					<li class="tab-link" data-tab="company">
						<b>업체 회원 가입하기</b>
					</li>
				</ul>
				<div id="Regular" class="signup-content current">
					<jsp:include page="signup.jsp"></jsp:include>
				</div>
				<div id="company" class="signup-content">
					<jsp:include page="signupcompany.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
	</div>
</body>
<script>
	$('ul.signup-tab li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.signup-tab li').removeClass('current');
		$('.signup-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
</html>