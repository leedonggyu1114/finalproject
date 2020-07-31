<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	#page{text-align:center;margin:auto;border:1px solid gray;}
	#tbl{margin:auto;}
	#page{border:1px solid gray; width:750px;}
	h1{text-align:center;}
	.alert-danger{border:1px solid gray; margin:auto; display:none; width:500px; padding:30px;}
</style>
</head>
<body>
<h1>Login</h1>
<div id="page">
	<!-- 유저 로그인 -->
	<input type="button" id="selectUser" value="일반회원">
	<input type="button" id="selectCompany" value="업체">
	<br><br>
	<form action="loginCheck" method="post" name="frm" id="user">
	<table id="tbl">
		<tr>
			<td>아이디 :</td>
			<td><input type="text" id="id" placeholder="id" name="u_id"></td>
		</tr>
		<tr>
			<td>패스워드 :</td>
			<td><input type="password" id="pass" placeholder="pass" name="u_pass"></td>
		</tr>
	</table>
	<input type="checkbox" name="chkLogin">로그인 상태 유지
	<input type="submit" id="btnInsert" value="로그인">
	<div class="alert-danger">
		<span>
		"아직 본인인증이 되지 않은 이메일입니다."
		<br>
		" 발송된 본인인증 메일에서 '인증하기' 버튼을 클릭해주세요."
		<br>
		" 본인인증 메일을 다시 받으려면, 동일한 이메일로 재가입해주세요."
		</span>
	</div>
		<br><br>
		<a href="/user/find(id)">아이디 찾기</a> | <a href="find(pass)">패스워드 찾기</a> |
		<a href="/user/signupselect">회원 가입</a>
		<br>
		<hr><br>
	</form>
	<!-- 업체 로그인 -->
	<form action="loginCheckCompany" method="post" name="frm1" id="company">
		<div>
			<div>
				<span>사업자번호 :</span>
				<span><input type="text" id="number1" size=8></span> -
				<span><input type="text" id="number2" size=5></span> -
				<span><input type="text" id="number3" size=8></span>
			</div>
			<br>
			<div>
				<span>아이디 :</span> &nbsp;
				<span><input type="text" id="id" placeholder="id" name="c_id" size=15></span>
			</div>
			<br>
			<div>
				<span>패스워드 :</span>
				<span><input type="password" id="pass" placeholder="pass" name="c_pass" size=15></span>
			</div>
			<br>
		</div>
		<input type="checkbox" name="chkLogin">로그인 상태 유지
		<input type="submit" id="btnInsertCompany" value="업체로그인">
	
	<div class="alert-danger">
		<span>
		"아직 본인인증이 되지 않은 이메일입니다."
		<br>
		" 발송된 본인인증 메일에서 '인증하기' 버튼을 클릭해주세요."
		<br>
		" 본인인증 메일을 다시 받으려면, 동일한 이메일로 재가입해주세요."
		</span>
		<br>
	</div>
	<br><br>
	<a href="/user/findCompany(id)">업체 아이디 찾기</a> | <a href="findCompany(pass)">업체 패스워드 찾기</a> |
	<a href="/user/signupselect">회원 가입</a>
	<br>
	<hr><br>
	</form>
	
	<!-- <img src="/kakao_login_large_narrow.png" width="50"> -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=44c4398b724d06191dbaf99c087795b1&redirect_uri=http://localhost:8088/oauth&response_type=code">카카오 로그인</a>
</div>
</body>
<script>
var chkLogin=0;

$("#company").hide();

$("#selectUser").on("click",function(){
	$("#user").show();
	$("#company").hide();
});
$("#selectCompany").on("click",function(){
	$("#user").hide();
	$("#company").show();
});

$(frm).submit(function(e){
	e.preventDefault();
	$(".alert-danger").css("display", "none");
	var u_id=$(frm.id).val();
	var u_pass=$(frm.pass).val();
	
	if($(frm.chkLogin).is(":checked"))
		chkLogin=1;
	
	$.ajax({
		type:"post",
		url:"/user/loginCheck",
		data:{"u_id":u_id,"u_pass":u_pass,"chkLogin":chkLogin},
		success:function(data){
			if(data==0){
				alert("아이디가 존재하지 않습니다.");
			}else if(data==1){
				alert("패스워드가 틀렸습니다.");
			}else if(data==2){
				location.href="/";
			}else {
				$(".alert-danger").css("display", "block");
			}
		}
	});
});

$(frm1).submit(function(e){
	e.preventDefault();
	$(".alert-danger").css("display", "none");
	var c_id=$(frm1.id).val();	
	var c_pass=$(frm1.pass).val();
	var c_num1=$("#number1").val();
	var c_num2=$("#number2").val();
	var c_num3=$("#number3").val();
	var c_number=c_num1+c_num2+c_num3;
	
	$.ajax({
		type:"post",
		url:"/user/loginCheckCompany",
		data:{"c_id":c_id,"c_pass":c_pass,"c_number":c_number},
		success:function(data){
			if(data==0){
				alert("아이디가 존재하지 않습니다.");
			}else if(data==1){
				alert("패스워드가 틀렸습니다.");
			}else if(data==2){
				location.href="/";
			}else if(data==3){
				$(".alert-danger").css("display", "block");
			}else if(data==4){
				alert("해당 아이디의 사업자번호가 존재하지 않습니다.");
			}
		}
	});
});
	
	
</script>
</html>