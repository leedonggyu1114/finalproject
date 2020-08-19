<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<style>
#user-information-area {
	padding:40px;
	position:relative;
	margin-bottom:30px;
}
#user-information-area #info,
#user-information-area #companyInfo {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	margin-top:20px;
}
#user-information-area .line-info {
	height:60px;
}
#user-information-area .line-info td:nth-child(1),
#user-information-area .line-address td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#user-information-area .line-info td:nth-child(2),
#user-information-area .line-address td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#info span,
#companyInfo span {
	background: #0f4c81;
	color:white;
	height:40px;
	width:155.78px;
	display:inline-block;
	padding-top:11px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	font-size:13px;
}
#user-information-area [type="text"],
#user-information-area [type="password"],
#user-information-area [type="submit"] {
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#user-information-area .line-info.a input {
	width:100%;
}
#user-information-area select {
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
	padding-left:10px;
}
#tag img{
	width:180px;
	height:190px;
	cursor:pointer;
	margin-bottom:20px;
	border-radius:8px 8px 8px 8px;
	margin-left:10px;
	margin-right:10px;
}
#hoption img {
	width:198px;
	margin-bottom:25px;
	margin-left:5px;
	cursor:pointer;
}
#companyInfo textarea {
	width:100%;
	height:80px;
	padding:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<jsp:include page="../../sidebar.jsp"/>
		<div id="page">
			<div id="header"><jsp:include page="../../header.jsp" /></div>
			<div id="menu"><jsp:include page="../../menu.jsp" /></div>
			<div id="container">
				<div id="user-information-area">
					
			<h1>신고글 관리</h1>
		
			<div>신고할 ID</div>
			<div><input type="text" id="u_to_id"></div>
			<hr>
			<form name="frm" action="insertblack" method="post">
				<div><input type="hidden" name="u_from_id" value="${u_id}"></div>
				<div><input type="hidden" name="u_from_k_id" value="${u_k_id}"></div>
				<table>
					<tr>
						<td><input type="hidden" name="u_to_id" id="u_id1">
						<input type="hidden" name="u_to_k_id" value="0" id="u_k_id1"></td>
					</tr>
					<tr>
						<td>신고 사유</td>
						<td><textarea name="b_content"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="신고하기">
			</form>
		
			<form name="frm1" action="insertblack" method="post">
				<div><input type="hidden" name="u_from_id" value="${u_id}"></div>
				<div><input type="hidden" name="u_from_k_id" value="${u_k_id}"></div>
				<table>
					<tr>
						<td><input type="hidden" name="u_to_id" id="u_id2" value="0">
						<input type="hidden" name="u_to_k_id" id="u_k_id2"></td>
					</tr>
					<tr>
						<td>신고 사유</td>
						<td><textarea name="b_content"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="신고하기">
			</form>
		</div>
	</div>
</div>
</body>
<script>
$(frm1).css("display","none");

$(frm).submit(function(e){
	e.preventDefault();
	var u_id=$("#u_to_id").val();
	var b_content=$(frm.b_content).val();
	if(!confirm("신고하시겠습니까?")) return;
	$.ajax({
		type:"get",
		url:"/user/mypage/reportread",
		data:{"u_id":u_id},
		success:function(data){
			if(data==0){
				$(frm.u_to_id).val(u_id);
				$(frm).css("display","block");
				$(frm1).css("display","none");
				frm.submit();
			}else if(data==1){
				$(frm1.u_to_k_id).val(u_id);
				$(frm1.b_content).val(b_content);
				$(frm).css("display","none");
				$(frm1).css("display","block");
				frm1.submit();
			}else if(data==3){
				alert("신고할 ID가 존재하지 않습니다.");
				$(frm.u_to_id).val("");
				$(frm.u_to_k_id).val("");
			}
		}
	});
});
</script>
</html>