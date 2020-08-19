<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<style>
#user-booking-list-area {
	position:relative;
	left:50%;
	width:1000px;
	transform:translate(-50%,0);
	padding-top:40px;
	padding-bottom:60px;
}
input[id*="list"] {
	display:none;
}
input[id*="list"] + label {
	display:block;
	padding: 20px 20px 20px 5px;
	border-bottom:1px solid #e9e9e9;
	cursor:pointer;
	position:relative;
	width:800px;
	left:50%;
	transform:translate(-50%,0);
}
input[id*="list"] + label em {
	position:absolute;
	top:50%;
	right:10px;
	width:30px;
	height:30px;
	margin-top:-15px;
	display:inline-block;
	background:url('/resources/img/user/down-arrow2.png') 0 0 no-repeat;
}
input[id*="list"] + label + div {
	max-height:0;
	transition:all .25s;
	overflow:hidden;
	width:800px;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
}
input[id*="list"]:checked + label + div {
	max-height:1000px;
	padding:20px 0px 20px 0px;
}
input[id*="list"]:checked + label em {
	background-position:0 -30px;
}
table {
	border-collapse:collapse;
}
#tbl_staylist {
	border-bottom:1px solid gray;
}
#tbl_staylist td {
	height:60px;
}
#tbl_staylist tr:nth-child(1) td:nth-child(1) {
	padding-bottom:15px;
}
#tbl_staylist tr:nth-child(2) td {
	padding-bottom:38px;
}
#tbl_staylist tr:nth-child(3) td{
	height:80px;
	padding-bottom:15px;
}
#tbl_staylist button {
	width:100%;
	height:40px;
	border-radius:5px;
	border:none;
	background:#e9e9e9;
	outline:none;
	cursor:pointer;
}
#tbl_staylist tr:nth-child(3) span {
	font-size:20px;
	font-weight:900;
	margin-right:10px;
}
#tbl_staylist span:nth-child(1) {
	font-size:25px;
	font-weight:900;
}
#tbl_staylist span:nth-child(2) {
	color:gray;
}
#tbl_airlist {
	text-align:center;
	border-bottom:1px solid gray;
	margin-bottom:10px;
}
#tbl_airlist tr {
	height:60px;
	font-size:13px;
}
#tbl_airlist tr:nth-child(1) {
	background:#edf2f3;
}
#tbl_airlist img {
	position:relative;
	top:2px;
	margin-left:5px;
	margin-right:10px;
}
#tbl_airlist .starttime {
	color:red;
}
#tbl_airlist .airprice {
	font-size:15px;
	margin-right:5px;
}
#tbl_airlist button {
	width:100%;
	height:40px;
	border-radius:5px;
	border:none;
	background:#e9e9e9;
	outline:none;
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../../header.jsp" /></div>
		<div id="menu"><jsp:include page="../../menu.jsp" /></div>
		<div id="container">
			<div id="user-booking-list-area">
				<img src="/resources/img/user/bookinglist-title.png" style="position:relative; left:50%; transform:translate(-50%,0); margin-bottom:20px;"/>
				<div class="accordion">
					<input type="checkbox" id="staylist">
					<label for="staylist">숙소<em></em></label>
					<div>
						<table id="tbl_staylist">
							<tr>
								<td rowspan=3 width=220><img src="/resources/img/user/smaple.jpg" width=210 height=170></td>
								<td colspan=2><span>HOTEL이름</span> <span>(302호)</span></td>
							</tr>
							<tr>
								<td colspan=2>2020.02.02~2020.02.04</td>
							</tr>
							<tr>
								<td width=400><span>50,000</span>원</td>
								<td width=180><button>취소하기</button></td>
							</tr>
						</table>
					</div>
					<input type="checkbox" id="airlist">
					<label for="airlist">항공<em></em></label>
					<div>
						<jsp:useBean id="now" class="java.util.Date" />
						<table id="tbl_airlist">
							<tr>
								<td width=120>구분</td>
								<td width=110>항공편<br>항공사</td>
								<td width=120>출발일</td>
								<td width=70>출발시간<br>도착시간</td>
								<td width=110>가격</td>
								<td width=100>상태</td>
								<td width=150></td>
							</tr>
							<c:forEach items="${bookinglist }" var="vo">
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="nowDate" />
								<fmt:parseDate value="${vo.a_startdate} ${vo.a_starttime }" pattern="yyyy-MM-dd HH:mm" var="startDate" />
								<tr style="border-bottom:0.5px solid #e9e9e9; height:100px;">
									<td>${vo.a_startplace } <img src="/resources/img/user/next.png">${vo.a_endplace }</td>
									<td>${vo.a_company}<br>${vo.a_number }</td>
									<td>${vo.a_startdate }</td>
									<td><span class="starttime">${vo.a_starttime }</span><br>${vo.a_endtime }</td>
									<td><span class="airprice">${vo.a_price }</span>원</td>
									<c:if test="${vo.a_startdate > nowDate}">
										<td style="color:blue">탑승대기</td>
										<td><button>취소하기</button></td>
									</c:if>
									<c:if test="${vo.a_startdate <= nowDate}">
										<td style="color:gray">탑승완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp"/></div>
	</div>		
</body>
</html>