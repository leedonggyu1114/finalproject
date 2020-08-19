<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css" />
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
	<jsp:include page="../floatmenu.jsp"/>
	<jsp:include page="../sidebar.jsp"/>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div id="user-information-area">
			<h1>룸 등록</h1>
			<form name="frm" action="insertroom" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
				<table>
					<tr>
						<td>숙소아이디</td>
						<td><input type="text" name="r_id"></td>
					</tr>
					<tr>
						<td> 호 수 </td>
						<td><input type="text" name="r_roomnum"></td>
					</tr>
					<tr>
						<td> 방 이름 </td>
						<td><input type="text" name="r_title"></td>
					</tr>
					<tr>
						<td> 룸 설명 </td>
						<td><textarea name="r_detail"></textarea></td>
					</tr>
					<tr>
						<td> 수용 인원 수 </td>
						<td><input type="text" name="r_persons"></td>
					</tr>
					<tr>
						<td> 대표 이미지 </td>
						<td><input type="file" name="file" style="visibility: hidden;"><br>
						<img src="http://placehold.it/150x150" id="image" width=200 height=200><br></td>
					</tr>
					<tr>
						<td> 서브 이미지</td>
						<td></td>
					</tr>
					<tr>
						<td> 가격 </td>
						<td><input type="text" name="r_price"></td>
					</tr>
					<tr>
						<td> 평점 </td>
						<td><input type="text" name="r_grade"></td>
					</tr>
				</table>
				<input type="submit" value="룸 등록">
				</form>
			</div>
		</div>
		
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
</body>
<script>


//이미지 클릭시
$("#image").click(function() {
	$(frm.file).click();
});
//대표 이미지 화면 출력
$(frm.file).on("change", function() {
	var file = $(frm1.file1)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});

</script>
</html>