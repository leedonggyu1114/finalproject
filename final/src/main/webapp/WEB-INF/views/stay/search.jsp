<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
ul,li{list-style:none;}
.slide{height:400px;}
.slide ul{position:relative;height:100%;}
.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
.slide li:nth-child(1){background-image:url("/resources/img/stay/1.jpg");animation-delay:0s}
.slide li:nth-child(2){background-image:url("/resources/img/stay/2.jpg");animation-delay:4s}
.slide li:nth-child(3){background-image:url("/resources/img/stay/3.jpg");animation-delay:8s}
.slide li:nth-child(4){background-image:url("/resources/img/stay/4.jpg");animation-delay:12s}
 /* 100 / 8 = 12.5 */
@keyframes fade {
	0% {opacity:0;}
	5% {opacity:1;}
	25% {opacity:1;}
	30% {opacity:0;}
	100% {opacity:0;}
}
#air_search {
	background:white;
	background-color: rgba( 255, 255, 255, 0.7 );
	height:100px;
	width:950px;
	position:absolute;
	top:250px;
	left:50%;
	transform:translate(-50%,0);
	margin-bottom:-300px;
}
#air_search input[type="text"] {
	height:50px; 
	border-radius:5px; 
	border:0.5px solid #e9e9e9;
	padding-left:10px;
	cursor:pointer;
	line-height:50px;
	margin-top:25px;
}
</style>
</head>
<body>
	<jsp:include page="../sidebar.jsp" />
	<jsp:include page="../floatmenu.jsp"/>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
		
			<!-- 1start ------------------------------------------------------------------------------->
			<div style="position:relative; margin-bottom:10px;">
				<div class="slide">
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>	
				<div id="air_search">
					<div style="height:177.33px; text-align:center;">
						<input type="text" placeholder=지역선택 style="width:150px; margin-right:10px;" id="areasearch">
						<input type="hidden" placeholder=체크인&nbsp;/&nbsp;체크아웃 style="width:280px; margin-right:10px;" id="check">
						<input type="text" name="a_startdate" id="sdate" placeholder="체크인"> 
						<input type="text" name="a_startdate1" id="edate" placeholder="체크아웃">
						<input type="text" placeholder=인원선택 style="margin-right:10px;" id="persons">
						<input type="button" value="검색" id="btnsearch"
						style="width:200px; height:50px; border:0.5px solid #e9e9e9; outline:none; 
						border-radius:5px; background:#0f4c81; color:white; cursor:pointer;">
					</div>
				</div>
			</div>	
			<!-- 1end -------------------------------------------------------------------------------->
			<span id="total">( ${pm.totalCount} 건 )</span>
				<table id="companylist">
			      <tr>
			            <td>호텔 이미지</td>
			            <td>호텔 이름</td>
			            <td>가격</td>
			         </tr>
			      <c:forEach items="${list}" var="vo" >
			         <tr class="row">
			            <td class="c_id">${vo.c_id}</td>
			            <td><img src="/company/hoteldisplay?fileName=${vo.c_image}" id="image" width=150></td>
			            <td>${vo.c_name }</td>
			            <td>${vo.r}~</td>
			         </tr>
			      </c:forEach>
			      </table>
			      <div id="pagination">
			         <c:if test="${pm.prev}">
			            <a href="${pm.startPage-1}">◀</a>
			         </c:if>
			         <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			            <c:if test="${pm.cri.page == i}">
			               <a href="${i}" class='active'>${i}</a>
			            </c:if>
			            <c:if test="${pm.cri.page != i}">
			               <a href="${i}">${i}</a>
			            </c:if>
			         </c:forEach>
			         <c:if test="${pm.next}">
			            <a href="${pm.endPage+1}">▶</a>
			         </c:if>
			      </div>
			   </div>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
</body>
<script>
var id="${u_id}";
$("#air_search").on("click", "#btnsearch",function(){
	var area=$("#areasearch").val();
	var check=$("#check").val();
	var persons=$("#persons").val();
	alert(area+check+persons);
/*	$.ajax({
		type:"get",
		url:"",
		data:{""}
	});*/
});

//날짜 받기
$(document).ready(
		function() {
			$("#sdate,#edate")
					.datepicker(
							{
								changeMonth : true, //년을 바꿀수 있는 셀렉박스 
								changeYear : true, //년을 바꿀수 있는 셀렉박스 
								showMonthAfterYear : true,
								nextText : '다음 달',
								//dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
								dayNamesMin : [ '일', '월', '화', '수', '목',
										'금', '토' ],
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월',
										'10월', '11월', '12월' ],
								monthNames : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월',
										'10월', '11월', '12월' ],
								dateFormat : "yy/mm/dd",
								minDate : 0
							});

			$('#sdate').datepicker("option", "maxDate", $("#edate").val());
			$('#sdate').datepicker(
					"option",
					"onClose",
					function(selectedDate) {
						$("#edate").datepicker("option", "minDate",
								selectedDate);
					});

			$('#edate').datepicker();
			$('#edate').datepicker("option", "minDate", $("#sdate").val());
			$('#edate').datepicker(
					"option",
					"onClose",
					function(selectedDate) {
						$("#sdate").datepicker("option", "maxDate",
								selectedDate);
					});
		});


//페이징
$("#pagination").on("click", "a", function(e) {
   e.preventDefault();
   page = $(this).attr("href");
   location.href = "/stay/search?page=" + page;
});
//호텔읽기 
$("#companylist").on("click",".row",function(){
   var c_id=$(this).find(".c_id").html();
   location.href="/stay/read?c_id="+c_id;
});

</script>
</html>