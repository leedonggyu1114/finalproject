<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
	<style>
		#page{text-align:center;margin:auto;border:1px solid gray; hegiht:1000px;}
		#idfind{margin:auto;}
		 #passfind{margin:auto; text-align:center;}
		 #idshow{margin:auto;} 
	</style>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>패스워드 찾기</h1>
		<div id="page">
			<table id="idfind">	
				<tr>
					<td colspan="2">아이디 확인 후 비밀번호를 재설정할 수 있습니다.</td>
				</tr>	
				<tr>
					<td>아이디 :</td>
					<td><input type="text" id="txtId" size=40 style="height:25px;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="확인" style="height:50px;width:300px;" id="btnidCheck"></td>
				</tr>
			</table>
			<table id="passfind">
				<tr>
					<td colspan=2><span id="id1"></span>님의 비밀번호를 재설정합니다.</td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" id="txtName" size=50 style="height:25px;"></td>
				</tr>
				<tr>
					<td>사업자번호 :</td>
					<td>
						<input type="text" id="number1" size=15 style="height:25px;">
						<input type="text" id="number2" size=12 style="height:25px;">
						<input type="text" id="number3" size=15 style="height:25px;">
					</td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" id="txtEmail" size=50 style="height:25px;"></td>
					<td><input type="button" value="인증 번호 요청" id="btnEmail" style="height:25px; width:150px;"></td>
				</tr>
				<tr>
					<td>인증번호 :</td>
					<td><input type="text" id="txtNumber" size=50 style="height:25px;"></td>
					<td><input type="button" value="인증하기" id="btnCheck" style="height:25px; width:150px;"></td>
				</tr>
			</table>
			<div id="passreset">
				<span id="loadid"></span>님 새 비밀번호를 입력해주세요.
				<br>
				 <span><input type="password" id="pass"  size=40 style="height:30px;"></span><br><br>
				 <span><input type="password" id="passCheck"  size=40 style="height:30px;"></span><br><br>
				 <span><input type="button" id="btnReset" value="확인" style="height:50px;width:300px;"></span>
			</div>
		</div>
</body>
<script>
	$("#passfind").hide();
	$("#idshow").hide();
	$("#passreset").hide();
	//아이디 확인
	$("#btnidCheck").on("click",function(){
		var id=$("#txtId").val();
			$.ajax({
				type:"get",
				url:"/user/idCheckPassCompany",
				data:{"c_id":id},
				success:function(data){
					if(data==1){
						$("#idfind").hide();
						$("#passfind").show();
						$("#id1").html(id);
					}else{
						alert("아이디가 존재하지 않습니다.");
					}
				}
			});
	});
	var code;
	//이름 / 이메일 체크 /인증번호 발송
	$("#btnEmail").on("click",function(){
		var name=$("#txtName").val();
		var num1=$("#number1").val();
		var num2=$("#number2").val();
		var num3=$("#number3").val();
		var number=num1+num2+num3;
		var email=$("#txtEmail").val();
		var id=$("#txtId").val();
		$.ajax({
			type:"post",
			url:"/user/nameCheckPassCompany",
			data:{"id":id,"name":name,"email":email,"number":number},
			success:function(data){
				if(data==0){
					alert("입력한 정보와 일치하는 회원정보가 존재하지 않습니다. 이름,생년월일,이메일 주소를 확인해 주세요.");
				}else{
					//메일 인증키 전송
					$.ajax({
						type:"post",
						url:"/user/emailCheckPassCompany",
						data:{"email":email,"name":name,"number":number},
						success:function(data){
							alert("전송되었습니다.");
							code=data;
							$("#loadid").html(id);
						}
					});
				}
			}
		});
	})
	
	
	//키 인증
	$("#btnCheck").on("click",function(){
		if($("#txtNumber").val()==code){
			alert("인증되었습니다");
			$("#passreset").show();
			$("#idfind").hide();
			$("#passfind").hide();
		}else{
			alert("인증키가 올바르지 않습니다");
		}
	});
	//비밀번호 재설정
	$("#btnReset").on("click",function(){
		var pass=$("#passCheck").val();
		var id=$("#loadid").html();
		alert(id);
		$.ajax({
			type:"post",
			url:"/user/resetPassCompany",
			data:{"pass":pass,"id":id},
			success:function(){
				alert("비밀번호가 재설정되었습니다.");
				location.href="/user/login";
			}
		});
	});
	
	
</script>
</html>