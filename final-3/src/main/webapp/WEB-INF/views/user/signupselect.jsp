<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<style>
		#page{text-align:center; border:1px solid gray; padding:50px;}
		h1{text-align:center;}
		#submit{text-align:center; margin:auto;}
	</style>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>[회원 가입]</h1>
	
	<div id="page">
		<span id="select">
			<input type="button" value="일반 회원 가입" id="signup">
			<input type="button" value="업체 회원 가입" id="signupCompany">
		</span>
		<div id="Regular">
			일반 회원 가입하기
			<br>
			<jsp:include page="signup.jsp"></jsp:include>
		</div>
	
		<div id="company">
			업체 회원 가입하기
			<br>
			<jsp:include page="signupcompany.jsp"></jsp:include>
		</div>
	</div>
</body>
<script>
	$("#company").hide();

	$("#signup").on("click",function(){
		$("#company").hide();
		$("#Regular").show();
	});
	
	$("#signupCompany").on("click",function(){
		$("#Regular").hide();
		$("#company").show();
	});

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
</html>