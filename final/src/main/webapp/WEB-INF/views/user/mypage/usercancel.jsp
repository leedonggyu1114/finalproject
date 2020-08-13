<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<style>
#user-delete-area {
	padding:40px;
	position:relative;
	margin-bottom:30px;
}
</style>
</head>
<body>
	<h1>회원 탈퇴</h1>
	
	<c:if test="${u_id!=null}">
		<table border=1 id="usertb">
			<tr>
				<td colspan=2>탈퇴를 원하시는 분의 아이디, 비밀번호가 일치하면 자동으로 탈퇴가 됩니다.</td>
			</tr>
			<tr>
				<td colspan=2>주의 사항</td>
			</tr>
			<tr>
				<td colspan=2>탈퇴 시에 개인정보가 모두 삭제되어 복구 불가능하오니 신중을 가해주세요.<br>
					아래의 정보를 정확히 입력하시면 자동탈퇴 처리됩니다.<br>
					탈퇴 후에는 개인정보가 모두 삭제되어 복구가 불가능합니다.
				</td>
			</tr>
			<tr>
				<td colspan=2>개인정보를 확인하세요.</td>
			</tr>
			<tr id="user">
				<td>아이디</td>
				<td><span id="u_id">${u_id}</span></td>
			</tr>
			
			<tr>
				<td colspan=2>탈퇴를 위해 고객님의 회원 정보를 입력해 주세요.</td>
			</tr>
			<tr id="company">
				<td colspan=2><input type="password" id="u_pass" placeholder="비밀번호"></td>
			</tr>
			<tr><td colspan=2><input type="button" value="취소하기" onClick="location.href='/user/mypage/infomation'">
			<input type="button" value="회원탈퇴" id="cancelUser"></td></tr>
		</table>
	</c:if>
	
	<c:if test="${c_id!=null}">
		<table border=1 id="companytb">
			<tr>
				<td colspan=2>탈퇴를 원하시는 분의 아이디, 비밀번호가 일치하면 자동으로 탈퇴가 됩니다.</td>
			</tr>
			<tr>
				<td colspan=2>주의 사항</td>
			</tr>
			<tr>
				<td colspan=2>탈퇴 시에 개인정보가 모두 삭제되어 복구 불가능하오니 신중을 가해주세요.<br>
					아래의 정보를 정확히 입력하시면 자동탈퇴 처리됩니다.<br>
					탈퇴 후에는 개인정보가 모두 삭제되어 복구가 불가능합니다.
				</td>
			</tr>
			<tr>
				<td colspan=2>개인정보를 확인하십시오.</td>
			</tr>
			<tr id="company">
				<td>아이디</td>
				<td><span id="c_id">${c_id}</span></td>
			</tr>
			<tr>
				<td colspan=2>탈퇴를 위해 고객님의 회원 정보를 입력해 주세요.</td>
			</tr>
			<tr id="company">
				<td colspan=2><input type="password" id="c_pass" placeholder="비밀번호"></td>
			</tr>
			<tr><td colspan=2><input type="button" value="취소하기" onClick="location.href='/user/mypage/infomation'">
			<input type="button" value="회원탈퇴" id="cancelCompany"></td></tr>
		</table>
	</c:if>

</body>
<script>
$("#cancelUser").on("click",function(){
	var u_id="${u_id}";
	var u_pass=$("#u_pass").val();
	$.ajax({
		type:"get",
		url:"/user/mypage/UserPass",
		data:{"u_id":u_id,"u_pass":u_pass},
		success:function(data){
			if(data==0){
				alert("비밀번호를 다시 확인하십시오.")
			}else{
				getCancel();
			}
		}
	});
});

$("#cancelCompany").on("click",function(){
	var c_id="${c_id}";
	var c_pass=$("#c_pass").val();
	$.ajax({
		type:"get",
		url:"/user/mypage/CompanyPass",
		data:{"c_id":c_id,"c_pass":c_pass},
		success:function(data){
			if(data==0){
				alert("비밀번호를 다시 확인하십시오.")
			}else{
				getCompanyCancel();
			}
		}
	});
});
	
function getCancel(){
		if(!confirm("회원 탈퇴하시겠습니까?")) return;
		var u_id=$("#u_id").html();
		var u_k_id="${u_k_id}";
		$.ajax({
			type : "post",
			url : "/user/mypage/usercancel",
			data : {
				"u_id" : u_id,
				"u_k_id": u_k_id
			},
			success : function() {
				alert("회원 탈퇴되었습니다.");
				location.href = "/user/login";
			}
		});
}
function getCompanyCancel(){
		if(!confirm("회원 탈퇴하시겠습니까?")) return;
		var c_id=$("#c_id").html();

		$.ajax({
			type : "post",
			url : "/user/mypage/companycancel",
			data : {
				"c_id" : c_id
			},
			success : function() {
				alert("회원 탈퇴되었습니다.");
				location.href = "/user/login";
			}
		});
}
</script>
</html>