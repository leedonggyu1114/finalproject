<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<style>
#findpass_area {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	width:840px;
	border-radius:5px 5px 5px 5px;
	overflow:hidden;
	margin-bottom:60px;
}
#findpass_area #idfind,
#findpass_area #passfind,
#findpass_area #passreset {
	border-collapse:collapse;
}
#findpass_area .line-findpass,
#findpass_area .line-findpass-birthday {
	height:60px;
}
#findpass_area .line-findpass td:nth-child(1),
#findpass_area .line-findpass-birthday td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#findpass_area .line-findpass td:nth-child(2),
#findpass_area .line-findpass-birthday td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#findpass_area .line-findpass input[type="text"],
#findpass_area .line-findpass input[type="password"] {
	width:100%;
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#findpass_area .line-findpass-birthday input[type="text"] {
	width:32.5%;
	text-align:center;
	height:40px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#findpass_area #idfind span,
#findpass_area .line-findpass td:nth-child(1) span,
#findpass_area .line-findpass-birthday td:nth-child(1) span {
	background: #0f4c81;
	height:40px;
	width:155.78px;
	display:inline-block;
	padding-top:11px;
	padding-left:10px;
	color:white;
	border-radius:3px 3px 3px 3px;
	font-size:13px;
}
</style>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div id="findpass_area">
				<div style="margin-top:40px; margin-bottom:20px;"><img src="/resources/img/user/findpass_title.png" width=275 style="position:relative; left:50%; transform:translate(-50%,0);"/></div>
				<table id="idfind">
					<tr>
						<td colspan=3 style="padding-left:10px; color:gray;">아이디 확인 후 비밀번호를 재설정할 수 있습니다.</td>
					</tr>
					<tr class="line-findpass">
						<td width=170><span>아이디</span></td>
						<td width=500><input type="text" id="txtId"></td>
						<td width=170 style="padding-left:7px;"><input type="button" value="확인" id="btnidCheck" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"></td>
					</tr>
				</table>
				<table id="passfind">
					<tr>
						<td colspan=3 style="padding-left:10px; color:gray;"><span id="id1"></span>님의 비밀번호를 재설정합니다.</td>
					</tr>
					<tr class="line-findpass">
						<td width=170><span>이름</span></td>
						<td width=500><input type="text" id="txtName"></td>
						<td width=170></td>
					</tr>
					<tr class="line-findpass-birthday">
						<td><span>생년월일</span></td>
						<td>
							<input type="text" id="txtYear"> 
							<input type="text" id="txtMM"> 
							<input type="text" id="txtdd">
						</td>
						<td></td>
					</tr>
					<tr class="line-findpass">
						<td><span>이메일</span></td>
						<td><input type="text" id="txtEmail"></td>
						<td style="padding-left:7px;"><input type="button" value="인증 번호 요청" id="btnEmail" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"></td>
					</tr>
					<tr class="line-findpass">
						<td><span>인증번호</span></td>
						<td><input type="text" id="txtNumber"></td>
						<td style="padding-left:7px;"><input type="button" value="인증하기" id="btnCheck" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"></td>
					</tr>
				</table>
				<table id="passreset">
					<tr>
						<td colspan=2 style="padding-left:10px; color:gray;"><span id="loadid"></span>님 새 비밀번호를 입력해주세요.</td>
					</tr>
					<tr class="line-findpass">
						<td width=170><span>새 비밀번호</span></td>
						<td width=670><input type="password" id="pass"></td>
					</tr>
					<tr class="line-findpass">
						<td><span>새 비밀번호 확인</span></td>
						<td><input type="password" id="passCheck"></td>
					</tr>
					<tr style="height:90px;">
						<td colspan=3 style="text-align:center;"><input type="button" id="btnReset" value="변경하기" style="width:200px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
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
				url:"/user/idCheckPass",
				data:{"u_id":id},
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
	//이름 / 생년월일 / 이메일 체크 /인증번호 발송
	$("#btnEmail").on("click",function(){
		var name=$("#txtName").val();
		var year=$("#txtYear").val();
		var MM=$("#txtMM").val();
		var dd=$("#txtdd").val();
		var birthday=year+"-"+MM+"-"+dd;
		var email=$("#txtEmail").val();
		var id=$("#txtId").val();
		$.ajax({
			type:"post",
			url:"/user/nameCheckPass",
			data:{"u_id":id,"name":name,"birthday":birthday,"email":email},
			success:function(data){
				if(data==0){
					alert("입력한 정보와 일치하는 회원정보가 존재하지 않습니다. 이름,생년월일,이메일 주소를 확인해 주세요.");
				}else{
					//메일 인증키 전송
					$.ajax({
						type:"post",
						url:"/user/emailCheckPass",
						data:{"email":email,"birthday":birthday,"name":name},
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
			url:"/user/resetPass",
			data:{"pass":pass,"id":id},
			success:function(){
				alert("비밀번호가 재설정되었습니다.");
				location.href="/user/login";
			}
		});
	});
	
	
</script>
</html>