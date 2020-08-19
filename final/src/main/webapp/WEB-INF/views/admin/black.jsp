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
	#tbl, #tblInfo, #tblblack{border:1px solid gray; width:700px; text-align:center; }
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
				<h1>현재 차단중인 ID(블랙리스트)</h1>
				<form name="frm" action="black">
				총 검색 ID:<span id="total">${pm.totalCount}</span>개
					ID 검색 : <span><input type="text" id="txtSearch" name="keyword" value="${cri.keyword}"></span>
					<span><input type="submit" value="검색" id="btnSearch"></span>
				</form>
				<table id="tbl">
					<tr>
						<td>ID</td>
						<td>카카오 ID</td>
						<td>차단 해제</td>
					</tr>
					<c:forEach items="${black}" var="vo1">
					<tr class="row">
						<td class="id">${vo1.u_id}</td>
						<td class="kakaoid">${vo1.u_k_id}</td>
						<td><button>차단 해제</button></td>
					</tr>
					</c:forEach>
				</table>
				<div id="pagination">
					<c:if test="${pm.prev}">
						<a href="${pm.startPage-1}">◀</a>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<c:if test="${cri.page==i}">
							[<a href="${i}" class="active">${i}</a>]
						</c:if>
						<c:if test="${cri.page!=i}">
							[<a href="${i}">${i}</a>]
						</c:if>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="${pm.endPage+1}">▶</a>
					</c:if>
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