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
				<h1>ID 신고 내역</h1>
				<form name="frm" action="blacklist">
				총 검색수:<span id="total">${pm.totalCount}</span>개
					ID 검색 : <span><input type="text" id="txtSearch" name="keyword" value="${cri.keyword}"></span>
					<span><input type="submit" value="검색" id="btnSearch"></span>
				</form>
					<table id="tbl">
					<tr>
						<td>ID</td>
						<td>카카오 ID</td>
						<td>신고한 ID</td>
						<td>사유</td>
						<td>신고 날짜</td>
					</tr>
					<c:forEach items="${blacklist}" var="vo">
					<tr class="row">
						<td class="declairId">${vo.u_to_id}</td>
						<td class="declairKakaoId">${vo.u_to_k_id}</td>
						<td class="fromid">${vo.u_from_id}</td>
						<td>${vo.b_content}</td>
						<td>${vo.b_date}</td>
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
				
				<table id="tblInfo" border=1>
					<tr>
						<td colspan="2">신고 ID 정보</td>
					</tr>
					<tr id="idhidden">
						<td width=200>신고 아이디</td>
						<td width=150><span id="id"></span></td>
					</tr>
					<tr id="kakaohidden">
						<td width=200>신고 카카오 아이디</td>
						<td width=150><span id="kakaoid"></span></td>
					</tr>
					<tr id="idhidden">
						<td width=200>신고한 아이디</td>
						<td width=150><span id="id1"></span></td>
					</tr>
					
					<tr>
						<td>차단상태</td>
						<td><span id="status"></span></td>
					</tr>
					<tr>
						<td><input type="button" value="ID차단" id="lock"></td>
						<td><input type="button" value="신고상태 해제" id="unlock"></td>
					</tr>
				</table>
				<a href="/admin/black">블랙 리스트</a>
			</div>
		</div>
	</div>
</body>
<script>
var keyword="${cri.keyword}";

$("#tblInfo").css("display","none");

$("#unlock").on("click",function(){
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
	$("#id").html(declair);
	$("#id1").html(fromid);
	$("#kakaoid").html(declairkakao);
	$("#tblInfo").css("display","block");
	
	if(declair==0){
		$("#kakaohidden").css("display","block");
		$("#idhidden").css("display","none");
	}else{
		$("#kakaohidden").css("display","none");
		$("#idhidden").css("display","block");
	}
	
	$.ajax({
		type:"get",
		url:"/admin/read",
		data:{"u_id":declair,"u_k_id":declairkakao},
		success:function(data){
			alert(data);
			if(data==0){
				$("#status").html("사용");
			}else{
				$("#status").html("차단");
			}
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