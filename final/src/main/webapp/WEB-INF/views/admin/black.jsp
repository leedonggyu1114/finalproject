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
.row button {
	width:100%;
	height:100%;
	background:none;
	outline:none;
	border:none;
	cursor:pointer;
}
.row button:hover {
	color:red;
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
#pagination .active a {
	color:red;
}
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
				<div>
					<img src="/resources/img/admin/blacklist_title.png"/>
					<form name="frm" action="black">
					<span><input type="text" id="txtSearch" name="keyword" value="${cri.keyword}"></span>
					<span><input type="submit" value="검색" id="btnSearch"></span>
					<span id="total">( ${pm.totalCount} 건 )</span>
					</form>
					<table id="tbl" border=1>
						<tr id="tbl_title">
							<td width=400>ID</td>
							<td width=400>카카오 ID</td>
							<td width=200>차단 해제</td>
						</tr>
						<c:forEach items="${black}" var="vo1">
						<tr class="row">
							<td class="id">${vo1.u_id}</td>
							<td class="kakaoid">${vo1.u_k_id}</td>
							<td><button>차단 해제</button></td>
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
	</div>
</body>
<script>
var keyword="${cri.keyword}";

$("#tbl").on("click",".row button",function(){
	var u_id=$(this).parent().parent().find(".id").html();
	var u_k_id=$(this).parent().parent().find(".kakaoid").html();
	
	$.ajax({
		type:"get",
		url:"/admin/unlockStatus",
		data:{"u_id":u_id,"u_k_id":u_k_id},
		success:function(){
			alert("차단해제되었습니다.");
			location.href="/admin/black";
		}
	});
});


$("#tblInfo").css("display","none");

$("#btnSearch").on("click",function(){
	var text=$("#txtSearch").val();
});

$("#pagination").on("click","a",function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="black?keyword="+keyword+"&&page="+page;
});


</script>
</html>