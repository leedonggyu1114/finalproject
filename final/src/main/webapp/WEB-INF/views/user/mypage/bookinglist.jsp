<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
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
	padding:20px 10px 20px 10px;
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
	width:180px;
	height:40px;
	border-radius:5px;
	border:none;
	background:#e9e9e9;
	outline:none;
	cursor:pointer;
}
#tbl_airlist tr:nth-child(3) {
	height:80px;
}
#tbl_airlist tr:nth-child(3) td {
	text-align:right;
	padding-bottom:20px;
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
								<td width=380><span>50,000</span>원</td>
								<td width=180><button>취소하기</button></td>
							</tr>
						</table>
					</div>
					<input type="checkbox" id="airlist">
					<label for="airlist">항공<em></em></label>
					<div>
						<table id="tbl_airlist">
							<tr>
								<td width=200>구분</td>
								<td width=120>항공편<br>항공사</td>
								<td width=160>출발일</td>
								<td width=120>출발시간<br>도착시간</td>
								<td width=180>가격</td>
							</tr>
							<tr>
								<td>제주 <img src="/resources/img/user/next.png">김포</td>
								<td>아시아나<br>P10001</td>
								<td>2020년08월01일</td>
								<td><span class="starttime">21:00</span><br>22:30</td>
								<td><span class="airprice">39,000</span>원</td>
							</tr>
							<tr>
								<td colspan=5><button>취소하기</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp"/></div>
	</div>		
</body>
</html>