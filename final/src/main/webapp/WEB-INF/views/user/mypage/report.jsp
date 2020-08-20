<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
body {
	margin:0;
	papdding:0;
}
table {
	border-collapse:collapse;
	border:0.5px solid black;
}
</style>
</head>
<body>
<div style="height:500px; width:400px;">
	<div style="padding-top:20px;">
		<img src="/resources/img/report.png"/>
	</div>
	<div style="padding:10px; text-align:center;">
		<input type="text" value="신고 대상" style="border:none; outline:none; height:20px; background:none; width:60px; cursor:pointer;">
		<input type="text" id="u_to_id" 
		style="border:none; outline:none; margin-left:10px; height:30px;
		padding-left:10px; font-size:18px; width:130px; text-align:center; 
		border-bottom:0.5px solid gray; font-weight:bold;">
	</div>
	
	<form name="frm" action="insertblack" method="post">
		<div><input type="hidden" name="u_from_id" value="${u_id}"></div>
		<div><input type="hidden" name="u_from_k_id" value="${u_k_id}"></div>
		<table>
			<tr style="text-align:center;">
				<td width=400 style="height:40px; background:black; color:white;">
					신고사유
					<input type="hidden" name="u_to_id" id="u_id1">
					<input type="hidden" name="u_to_k_id" id="u_k_id1" value="0">
				</td>
			</tr>
			<tr>
				<td style="height:250px;">
					<textarea name="b_content" 
					style="width:350px; height:210px; outline:none; text-align:left; border:none;
					padding:20px;"></textarea>
				</td>
			</tr>
		</table>
		<div style="padding-top:10px; padding-bottom:10px; text-align:center; margin-top:10px;">
			<input type="submit" value="신고하기" 
			style="background:#0f4c81; color:white; width:200px; height:40px; border:none;
			outline:none; border-radius:5px; cursor:pointer;">
		</div>
	</form>
	
	<form name="frm1" action="insertblack" method="post">
		<div><input type="hidden" name="u_from_id" value="${u_id}"></div>
		<div><input type="hidden" name="u_from_k_id" value="${u_k_id}"></div>
		<table>
			<tr style="text-align:center;">
				<td width=400 style="height:40px; background:black; color:white;">
					신고사유
					<input type="hidden" name="u_to_id" id="u_id2" value="0">
					<input type="hidden" name="u_to_k_id" id="u_k_id2">
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="b_content"
					style="width:350px; height:210px; outline:none; text-align:left; border:none;
					padding:20px;"></textarea>
				</td>
			</tr>
		</table>
		<div style="padding-top:10px; padding-bottom:10px; text-align:center; margin-top:10px;">
			<input type="submit" value="신고하기"
			style="background:#0f4c81; color:white; width:200px; height:40px; border:none;
			outline:none; border-radius:5px; cursor:pointer;">
		</div>
	</form>
	
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
				alert("신고 처리 완료되었습니다.");
			}else if(data==1){
				$(frm1.u_to_k_id).val(u_id);
				$(frm1.b_content).val(b_content);
				$(frm).css("display","none");
				$(frm1).css("display","block");
				frm1.submit();
				alert("신고 처리 완료되었습니다.");
			}else if(data==2){
				alert("신고할 ID가 존재하지 않습니다.");
				$(frm.u_to_id).val("");
				$(frm.u_to_k_id).val("");
			}
		}
	});
});
</script>
</html>