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
	background:orange;
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
	text-align:center;
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
						<tr>
							<td>TO</td>
							<td>KAKAO ID</td>
							<td>FROM</td>
							<td>DATE</td>
							<td>SET</td>
							<td>DELETE</td>
						</tr>
						<c:forEach items="${blacklist}" var="vo">
						<tr class="row">
							<td class="declairId">${vo.u_to_id}</td>
							<td class="declairKakaoId">${vo.u_to_k_id}</td>
							<td class="fromid">${vo.u_from_id}</td>
							<td>${vo.b_content}</td>
							<td>${vo.b_date}</td>
							<td><input type="button" value="ID차단" id="lock"></td>
							<td><input type="button" value="신고상태 해제" id="unlock"></td>
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
							<td>사유</td>
						</tr>
						<tr id="idhidden">
							<td width=200></td>
						</tr>
					</table>
				</div>
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