<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminstyle.css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
#admin_true>div {
	width:1000px;
	height:100%;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
}
#txtSearch {
	width:240px;
	height:40px;
	border:none;
	outline:none;
	padding-left:20px;
	border-radius:20px;
	cursor:pointer;
}
#btnSearch {
	background:none;
	height:40px;
	outline:none;
	cursor:pointer;
	border:none;
}
#btnSearch:hover {
	color:red;
}
#total {
	font-size:14px;
	margin-bottom:2px;
}
#tbl {
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
	border-collapse:collapse;
}
#tbl_title {
	height:70px;
	background:black;
	color:white;
}
#tbl .row {
	height:70px;
}
#tbl #lock {
	width:100%;
	height:100%;
	background:none;
	outline:none;
	border:none;
	cursor:pointer;
}
#tbl #lock:hover {
	color:red;
}
#tbl #unlock {
	background:none;
	outline:none;
	border:none;
	cursor:pointer;
}
#pagination a {
	text-decoration:none;
	color:black;
}
#pagination span {
	display:inline-block;
	width:30px;
	height:25px;
	padding-top:3px;
}
#pagination .active {
	border-bottom:0.5px solid black;
}
#tblInfo {
	background:white;
	width:300px;
	height:350px;
	position:absolute;
	right:25px;
	top:250px;
	border:1px solid black;
}
#tblInfo button {
	width:30px;
	height:29.5px;
	cursor:pointer;
	border:none;
	border-left:1px solid black;
	outline:none;
}
#tblInfo button:hover {
	color:red;
}
#tblInfo #div_content {
	padding:10px 10px 10px 10px;
}
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
				<div>
					<img src="/resources/img/admin/report_title.png"/>
					<form name="frm" action="blacklist">
						<span><input type="text" id="txtSearch" name="keyword" value="${cri.keyword}"></span>
						<span><input type="submit" value="검색" id="btnSearch"></span>
						<span id="total">( ${pm.totalCount} 건 )</span>
					</form>
						<table id="tbl" border=1>
						<tr id="tbl_title">
							<td width=150>TO</td>
							<td width=150>KAKAO ID</td>
							<td width=150>FROM</td>
							<td width=300>DATE</td>
							<td width=150>SET</td>
							<td width=100>DELETE</td>
						</tr>
						<c:forEach items="${blacklist}" var="vo">
						<tr class="row">
							<td class="declairId">${vo.u_to_id}</td>
							<td class="declairKakaoId">${vo.u_to_k_id}</td>
							<td class="fromid">${vo.u_from_id}</td>
							<td class="date">${vo.b_date}</td>
							<td><input type="button" value="차단하기" id="lock"></td>
							<td><button id="unlock"><img src="/resources/img/hotplace/close_icon.png" width=10 height=15/></button></td>
						</tr>
						</c:forEach>
					</table>
					
					<div id="pagination" style="padding:10px 0px 10px 0px; text-align:center;">
						<c:if test="${pm.prev}">
							<a href="${pm.startPage-1}">◀</a>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
							<c:if test="${cri.page==i}">
								<span class="active"><a href="${i}">${i}</a></span>
							</c:if>
							<c:if test="${cri.page!=i}">
								<span><a href="${i}">${i}</a></span>
							</c:if>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="${pm.endPage+1}">▶</a>
						</c:if>
					</div>
					
					
				</div>
			</div>
		</div>
		<div id="tblInfo">
			<div style="height:30px; background:#e9e9e9; text-align:right; border-bottom:1px solid black; margin-left:0.5px;"><button id="btnClose">x</button></div>
			<div id="div_content">
				<span style="width:100%; display:inline-block; font-size:20px; margin-bottom:10px;">사유</span>
				<span id="content"></span>
			</div>
		</div>
	</div>
</body>
<script>
var keyword="${cri.keyword}";

$("#tblInfo").css("display","none");

$("#unlock").on("click",function(){
	$("#tblInfo").css("display","none");
	if(!confirm("신고 해제하시겠습니까?"))return;
	var u_id=$("#id").html();
	var u_k_id=$("#kakaoid").html();
	$.ajax({
		type:"get",
		url:"/admin/unlockStatus",
		data:{"u_id":u_id,"u_k_id":u_k_id},
		success:function(){
			alert("신고 해제되었습니다.");
		}
	});
	
});

$("#lock").on("click",function(){
	if($("#status").html()=="사용"){
		if(!confirm("ID를 차단 등록하시겠습니까?"))return;
		var u_id=$("#id").html();
		var u_k_id=$("#kakaoid").html();
		$.ajax({
			type:"get",
			url:"/admin/lockStatus",
			data:{"u_id":u_id,"u_k_id":u_k_id},
			success:function(){
				alert("차단 등록되었습니다.");
			}
		});
	}else{
		alert("이미 차단된 상태입니다.");
	}
	
	
});


$("#tbl").on("click",".row",function(){
	var declair=$(this).find(".declairId").html();
	var declairkakao=$(this).find(".declairKakaoId").html();
	var fromid=$(this).find(".fromid").html();
	var date=$(this).find(".date").html();
	$("#id").html(declair);
	$("#id1").html(fromid);
	$("#kakaoid").html(declairkakao);
	$("#tblInfo").css("display","block");
	$("#btnClose").on("click", function(){
		$("#tblInfo").css("display","none");
	});
	
	$.ajax({
		type:"get",
		url:"/admin/read",
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		data:{"u_id":declair,"u_k_id":declairkakao,"date":date},
		success:function(data){
			$("#content").html(data);
		}
	});
})

$("#btnSearch").on("click",function(){
	var text=$("#txtSearch").val();
});

$("#pagination").on("click","a",function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="blacklist?keyword="+keyword+"&&page="+page;
});


</script>
</html>