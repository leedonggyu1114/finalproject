<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
	#page{text-align:center;margin:auto;border:1px solid gray; hegiht:1000px;}
	#idfind{margin:auto;}
</style>
</head>
<body>
	<h1>업체 아이디 찾기</h1>
	<div id="page">
		<table id="idfind">
			<tr>
				<td>이름 :</td>
					<td><input type="text" id="txtName" size=50 style="height:25px;"></td>
				<td>
			</tr>
			<tr>
				<td>사업자등록번호 :</td>
				<td>
					<input type="text" id="number1" size=15 style="height:25px;">
					<input type="text" id="number2" size=12 style="height:25px;">
					<input type="text" id="number3" size=15 style="height:25px;">
				</td>
				<td><input type="button" value="실명확인" id="btnName" style="height:25px; width:150px;"></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" id="txtEmail" size=50 style="height:25px;" readonly></td>
				<td><input type="button" value="인증 번호 요청" id="btnEmail" style="height:25px; width:150px;"></td>
			</tr>
			<tr>
				<td>인증번호 :</td>
				<td><input type="text" id="txtNumber" size=50 style="height:25px;" readonly></td>
				<td><input type="button" value="인증하기" id="btnCheck" style="height:25px; width:150px;"></td>
			</tr>
		</table>
				
		<div id="idshow">
			<div>
				<span id="loadname"></span> 님의 정보와 일치하는 아이디 목록입니다. 
			</div>
			<span id="loadid"></span>
		</div>
	</div>
</body>
<script>
$("#idshow").hide();

//실명인증
	$("#btnName").on("click",function(){
		var name=$("#txtName").val();
		var num1=$("#number1").val();
		var num2=$("#number2").val();
		var num3=$("#number3").val();
		var number=num1+num2+num3;
		
		$.ajax({
			type:"get",
			url:"/user/checkNameCompany",
			data:{"name":name,"number":number},
			success:function(data){
				if(data==1){
					alert("실명인증되었습니다.");
					$("#txtName").attr("readonly",true);
					$("#number1").attr("readonly",true);
					$("#number2").attr("readonly",true);
					$("#number3").attr("readonly",true);
					$("#txtEmail").attr("readonly",false);
					$("#txtNumber").attr("readonly",false);
				}else{
					alert("입력한 정보를 확인하세요.")
				}
			}
		});
	});
	
	//이메일 인증키 보내기
	var code;
	$("#btnEmail").on("click",function(){
		var name=$("#txtName").val();
		var num1=$("#number1").val();
		var num2=$("#number2").val();
		var num3=$("#number3").val();
		var number=num1+num2+num3;
		var email=$("#txtEmail").val();
			$.ajax({
				type:"post",
				url:"/user/emailCheckCompany",
				data:{"email":email,"name":name,"number":number},
				success:function(data){
						alert("인증번호 발송 요청이 완료되었습니다. 인증번호가 오지 않는 경우, 입력한 이메일을 확인 후 다시 요청해주세요.");
						alert(data.idCompany);
						code=data.email;
						/*var temp=Handlebars.compile($("#temp").html());
						 $("#tbl").html(temp(data));*/
						$("#loadid").html(data.idCompany);
						$("#loadname").html(name);
				}
			});
	});
	//키 인증
	$("#btnCheck").on("click",function(){
		if($("#txtNumber").val()==code){
			alert("인증되었습니다");
			var name=$("#txtName").html();
			$("#idshow").show();
			$("#idfind").hide();
		}else{
			alert("인증키가 올바르지 않습니다");
		}
	});
</script>
</html>