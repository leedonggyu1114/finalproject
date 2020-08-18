<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<style>
#findid_area {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	width:840px;
	border-radius:5px 5px 5px 5px;
	margin-bottom:60px;
}
#findid_area #idfind {
	border-collapse:collapse;
}
#findid_area .line-findid {
	height:60px;
}
#findid_area .line-findid td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#findid_area .line-findid td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#findid_area .line-findid.a input[type="text"] {
	width:100%;
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#findid_area .line-findid.b input[type="text"] {
	width:32.5%;
	text-align:center;
	height:40px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#findid_area span {
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
		<div id="header"><jsp:include page="../header.jsp"/></div>
		<div id="menu"><jsp:include page="../menu.jsp"/></div>
		<div id="container">
			<div id="findid_area">
				<div style="margin-top:40px; margin-bottom:18px;"><img src="/resources/img/user/findid_title.png" width=250 style="position:relative; left:50%; transform:translate(-50%,0);"/></div>
				<table id="idfind">
					<tr class="line-findid a">
						<td width=170><span>이름</span> </td>
						<td width=500><input type="text" id="txtName" placeholder=NAME value="김창식"></td>
						<td width=170></td>
					</tr>
					<tr class="line-findid b">
						<td><span>생년월일</span></td>
						<td>
							<input type="text" id="txtYear" placeholder=YYYY value="2016">
							<input type="text" id="txtMM" placeholder=MM value="12">
							<input type="text" id="txtdd" placeholder=DD value="13">
						</td>
						<td style="padding-left:7px;">
							<input type="button" value="실명확인" id="btnName" 
							style="width:155.78px; height:40px; border:none; cursor:pointer; 
							outline:none; border-radius:3px 3px 3px 3px;">
						</td>
					</tr>
					<tr class="line-findid a">
						<td><span>이메일</span></td>
						<td><input type="text" id="txtEmail" placeholder=E-MAIL value="d0_heeee@naver.com"></td>
						<td style="padding-left:7px;">
							<input type="button" value="인증 번호 요청" id="btnEmail" 
							style="width:155.78px; height:40px; border:none; cursor:pointer; 
							outline:none; border-radius:3px 3px 3px 3px;">
						</td>
					</tr>
					<tr class="line-findid a">
						<td><span>인증번호</span></td>
						<td><input type="text" id="txtNumber" placeholder=인증번호입력 ></td>
						<td style="padding-left:7px;"><input type="button" value="인증하기" id="btnCheck" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"></td>
					</tr>
				</table>
				
				<div id="idshow" style="position:relative;">
					<div>
						<div id="loadname" style="display:inline-block; text-align:center; font-weight:bold; font-size:20px;"></div> 님의 정보와 일치하는 아이디 목록입니다. 
					</div>
					<div style="margin-top:10px; text-align:center; border:0.5px solid white; border-radius:15px; position:relative; padding:30px; background:#edf2f3">
						<table id="tbl" style="position:relative; left:50%; transform:translate(-50%,0);"></table>
						<script id="temp" type="text/x-handlebars-template">
						{{#each list}}
							<tr style="height:50px;">
								<td width=300 style="background:white;">{{u_id}}</td>
							</tr>
						{{/each}}
						</script>
					</div>
				</div>
			</div>	
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
	</div>
</body>
<script>
$("#idshow").hide();
//실명인증
	$("#btnName").on("click",function(){
		var name=$("#txtName").val();
		var year=$("#txtYear").val();
		var MM=$("#txtMM").val();
		var dd=$("#txtdd").val();
		var birthday=year+"-"+MM+"-"+dd;
		$.ajax({
			type:"get",
			url:"/user/nameCheck",
			data:{"name":name,"birthday":birthday},
			success:function(data){
				if(data==1){
					alert("실명인증이 완료 되었습니다.");
					$("#txtName").attr("readonly",true);
					$("#txtYear").attr("readonly",true);
					$("#txtMM").attr("readonly",true);
					$("#txtdd").attr("readonly",true);
					$("#txtEmail").attr("readonly",false);
					$("#txtNumber").attr("readonly",false);
				}else{
					alert("이름과 생년월일을 확인하십시오.")
				}
			}
		});
	});
	
	//이메일 인증키 보내기
	var code;
	$("#btnEmail").on("click",function(){
		var name=$("#txtName").val();
		var year=$("#txtYear").val();
		var MM=$("#txtMM").val();
		var dd=$("#txtdd").val();
		var birthday=year+"-"+MM+"-"+dd;
		var email=$("#txtEmail").val();
			$.ajax({
				type:"post",
				url:"/user/emailCheck",
				data:{"email":email,"name":name,"birthday":birthday},
				success:function(data){
						alert("인증번호 발송 요청이 완료되었습니다. 인증번호가 오지 않는 경우, 입력한 이메일을 확인 후 다시 요청해주세요.");
						code=data.email;
						var temp=Handlebars.compile($("#temp").html());
						 $("#tbl").html(temp(data));
						 $("#loadname").html(name);
				}
			});
	});
	//키 인증
	$("#btnCheck").on("click",function(){
		if($("#txtNumber").val()==code){
			alert("인증되었습니다");
			$("#idshow").show();
			$("#idfind").hide();
		}else{
			alert("인증키가 올바르지 않습니다");
		}
	});
</script>
</html>