<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
ul,li{list-style:none;}
.slide{height:400px;}
.slide ul{position:relative;height:100%;}
.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
.slide li:nth-child(1){background-image:url("/resources/img/air/aira.jpg");animation-delay:0s}
.slide li:nth-child(2){background-image:url("/resources/img/air/airb.jpg");animation-delay:4s}
.slide li:nth-child(3){background-image:url("/resources/img/air/airc.jpg");animation-delay:8s}
.slide li:nth-child(4){background-image:url("/resources/img/air/aird.jpg");animation-delay:12s}
 /* 100 / 8 = 12.5 */
@keyframes fade {
	0% {opacity:0;}
	5% {opacity:1;}
	25% {opacity:1;}
	30% {opacity:0;}
	100% {opacity:0;}
}
#air_search input[type="radio"] {
	display:none;
}
#air_search label {
	display:inline-block;
	cursor:pointer;
	color:gray;
	padding-bottom:5px;
	margin-right:5px;
}
#air_search input[type="radio"]:checked + label {
	cursor:pointer;
	color:black;
	border-bottom:1px solid #0f4c81;
	padding-botoom:5px;
}
#air_search {
	background:white;
	background-color: rgba( 255, 255, 255, 0.7 );
	height:300px;
	width:700px;
	position:absolute;
	top:50px;
	left:50%;
	transform:translate(-50%,0);
	margin-bottom:-300px;
}
#div_SEplace {
	padding:10px 0px 0px 20px;
	position:relative;
}
#div_SEplace input[type="text"]:nth-child(1) {
	margin-right:50px;
}
#div_SEplace input[type="text"] {
	width:300px; 
	height:50px; 
	border-radius:5px; 
	border:0.5px solid #e9e9e9;
	padding-left:10px;
	cursor:pointer;
	line-height:51px;
}
#div_SEplace img {
	position:absolute;
	width:25px;
	top:23px;
	left:335px;
}
#div_Sdate {
	padding:10px 0px 0px 20px;
	display:inline-block;
}
#div_Sdate input[type="text"]:nth-child(1) {
	margin-right:5px;
}
#div_Sdate #sdate,
#div_Sdate #edate {
	width:145px; 
	height:50px; 
	border-radius:5px; 
	border:0.5px solid #e9e9e9;
	cursor:pointer;
	text-align:center;
}

#reserver .a_emptyseat {
	width:300px;
	margin-top:10px;
	margin-right:24px;
	height:50px; 
	border-radius:5px; 
	border:0.5px solid #e9e9e9;
	padding-left:10px;
	cursor:pointer;
}
/*인원선택*/
#reserver .aircount1 {
	position:absolute;
	top:70px;
	background:white;
	width:300px;
	height:350px;
	z-index:30;
	border-radius:3px 3px 3px 3px;
	transtion:all 1s;
	padding:10px;
}
#reserver .aircount1 h5 {
	text-align:left;
	margin-top:5px;
	margin-bottom:10px;
	font-size:20px;
	color:gray;
}
#reserver .aircount1>.aircount_row {
	background:white;
	border-top:2px solid gray;
	border-bottom:2px solid black;
	padding-top:5px;
	padding-bottom:5px;
	height:280px;
	text-align:center;
}
#reserver .aircount1>.aircount_row>.row {
	margin:5px 0px 5px 0px;
	height:50px;
}
#reserver .aircount1>.aircount_row>.row:nth-child(1) {
	margin-bottom:5px;
	margin-top:10px;
}
#reserver .aircount1 .age {
	display:inline-block;
	width:120px;
}
#reserver .aircount1 .aircount_row input[type="button"] {
	width:40px;
	height:40px;
	border-radius:50%;
	border:1px solid #0f4c81;
	cursor:pointer;
	font-size:15px;
}
#reserver .aircount1 .aircount_row #btn {
	width:100%;
	border-radius:3px 3px 3px 3px;
	background:#0f4c81;
	color:white;
	float:right;
	margin-top:100px;
}
#reserver .aircount1 .aircount_row input[type="text"] {
	width:40px;
	height:40px;
	text-align:center;
	padding-left:0;
	background:none;
	outline:none;
	border:none;
}
#div_tbl {
	width:600px;
	float:left;
	height:800px;
	border-top:1px solid black;
	border-bottom:0.5px solid black;
	margin-top:-10px;
}
#div_tbl1 {
	width:600px;
	float:left;
	height:800px;
	border-top:1px solid black;
	border-bottom:0.5px solid black;
	margin-top:-10px;
}
#div_tbl_2 {
	width:600px;
	height:718px;
	overflow-y:auto; 
	overflow-x:hidden; 
}
#div_tbl1_2 {
	width:600px;
	height:718px;
	overflow-y:auto; 
	overflow-x:hidden;
}
#div_tbl table {
	border-collapse:collapse;
	text-align:center;
	font-size:13px;
}
#div_tbl1 table {
	border-collapse:collapse;
	text-align:center;
	font-size:13px;
}
.tbl_title {
	height:80px;
}
#btnbooking {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	width:300px;
	height:50px;
	outline:none;
	border:none;
	background:#0f4c81;
	color:white;
	border-radius:5px;
	margin-top:10px;
	margin-bottom:30px;
	cursor:pointer
}
#tbl img,
#tbl1 img {
	position:relative;
	top:3px;
}
</style>
</head>
<body>
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
				<form name="frm" action="search" method="get">
					<!-- 왕복, 편도 -->
					<div style="padding:20px 0px 10px 20px;">
						<input type="radio" name="ticketing" id="roundTrip"> 
						<label for="roundTrip">왕복</label>
						<input type="radio" name="ticketing" id="oneWay">
						<label for="oneWay">편도</label>
					</div>
					
					<!-- 줄발지, 도착지 -->
					<div id="div_SEplace">
						<input type="text" name="a_startplace" placeholder="출발지" value="${vo.a_startplace }">
						<img src="/resources/img/container/container_icon.png">
						<input type="text" name="a_endplace" placeholder="도착지" value="${vo.a_endplace }">
					</div>
					
					<!-- 가는날, 오는날 -->
					<div id="div_Sdate">
						<input type="text" name="a_startdate" id="sdate" placeholder="가는날" value="${vo.a_startdate }"> 
						<input type="text" name="a_startdate1" id="edate" placeholder="오는날 " value="${vo.a_startdate1 }">
					</div>
					
					<!-- 인원선택 -->
					<div id="reserver" style="float:right; position:relative;">
							<input type="text" class="a_emptyseat" placeholder="성인 1  청소년 0">
							<div class="aircount1">
								<h5>인원</h5>
								<div class="aircount_row">
									<div class="row" style="">
										<span class="age">성인</span> 
										<input type="button" value="-" class="peopleSubtract"> 
										<input type="text" value="1" size="1" class="people"> 
										<input type="button" value="+" class="peoplePlus">
									</div>
									<div class="row">
										<span class="age">청소년/어린이</span> 
										<input type="button" value="-" class="childSubtract"> 
										<input type="text" value="0" readonly size="1" class="child"> 
										<input type="button" value="+" class="childPlus">
									</div>
									<div>
										<input type="button" id="btn" value="선택완료">
									</div>
								</div>
							</div>
					</div>
					
					<!-- 검색 -->
					<div style="text-align:center; padding-top:30px;">
						<input type="submit" name="search" value="검색" 
						style="width:200px; height:50px; border:0.5px solid #e9e9e9; outline:none; border-radius:5px; background:#0f4c81; color:white; cursor:pointer;">
					</div>
					
				</form>
				</div>
				</div>
			<!-- 1end -------------------------------------------------------------------------------->
			<div>
			<div id="div_tbl">
				<table style="border-collapse:collapse; border-bottom:0.5px solid black;">
					<tr class="tbl_title">
						<td width=49>선택</td>
						<td width=118>항공편<br>항공사</td>
						<td width=78>출발시간<br>도착시간</td>
						<td width=86>운행시간</td>
						<td width=69>가격</td>
						<td width=117>출발일</td>
						<td width=84>잔여좌석</td>
					</tr>
				</table>
				<div id="div_tbl_2">
				<table id="tbl"></table>
				<script id="temp" type="text/x-handlebars-template">
				{{#each startList}}
				<tr class="row" style="border-top:0.5px solid black;">
					<td rowspan=2 width=50><input type="radio" name="startList" class="radio" id="startList" style="cursor:pointer;"></td>
					<td width=50 style="padding-top:10px; padding-left:20px;"><img src="/air/display?fileName={{a_image}}"/></td>
					<td class="a_number" style="height:40px; padding-top:10px; padding-right:20px;" width=70 >{{a_number}}</td>
					<td class="a_starttime" width=80 style="padding-top:10px; color:red;">{{a_starttime}}</td>
					<td rowspan=2 class="a_runtime" width=90>{{a_runtime}}</td>
					<td rowspan=2 class="a_price1" width=70>{{a_price}}</td>
					<td rowspan=2 class="a_startdate" width=120>{{a_startdate}}</td>
					<td rowspan=2 class="a_emptyseat" width=70>{{a_emptyseat}}</td>
				</tr>
				<tr class="row" style="border-bottom:0.5px solid black;">
					<td class="a_company" style="height:40px; padding-bottom:10px;" colspan=2>{{a_company}}</td>
					<td class="a_endtime" style="padding-bottom:10px;">{{a_endtime}}</td>
				</tr>
				{{/each}} 			
				</script>
				</div>
			</div>
			<div id="div_tbl1">
				<table style="border-collapse:collapse; border-bottom:0.5px solid black;">
					<tr class="tbl_title">
						<td width=49>선택</td>
						<td width=118>항공편<br>항공사</td>
						<td width=78>출발시간<br>도착시간</td>
						<td width=86>운행시간</td>
						<td width=69>가격</td>
						<td width=117>출발일</td>
						<td width=84>잔여좌석</td>
					</tr>
				</table>
				<div id="div_tbl_2">
				<table id="tbl1"></table>
				<script id="temp1" type="text/x-handlebars-template">
				{{#each backList}}
				<tr class="row" style="border-top:0.5px solid black;">
					<td rowspan=2 width=50><input type="radio" name="backList" class="radio" id="startList" style="cursor:pointer;"></td>
					<td width=50 style="padding-top:10px; padding-left:20px;"><img src="/air/display?fileName={{a_image}}"/></td>
					<td class="a_number" style="height:40px; padding-top:10px; padding-right:20px;" width=70 >{{a_number}}</td>
					<td class="a_starttime" width=80 style="padding-top:10px; color:red;">{{a_starttime}}</td>
					<td rowspan=2 class="a_runtime" width=90>{{a_runtime}}</td>
					<td rowspan=2 class="a_price2" width=70>{{a_price}}</td>
					<td rowspan=2 class="a_startdate" width=120>{{a_startdate}}</td>
					<td rowspan=2 class="a_emptyseat" width=70>{{a_emptyseat}}</td>
				</tr>
				<tr class="row" style="border-bottom:0.5px solid black;">
					<td class="a_company" style="height:40px; padding-bottom:10px;" colspan=2>{{a_company}}</td>					
					<td class="a_endtime" style="padding-bottom:10px;">{{a_endtime}}</td>
				</tr>
				{{/each}} 			
				</script>
				</div>
			</div>
			</div>
			<div id="div_air_check">
			<table id="air_check_none1">
				<tr class="none_title" style="border-bottom:0.5px solid gray;">
					<td width=150 style="border-right:0.5px solid gray; background:#E3B8C7; font-size:15px; font-weight:bold;">가는항공</td>
					<td width=180></td>
					<td width=40>▶</td>
					<td width=180></td>
				</tr>
				<tr class="none_title2">
					<td style="border-right:0.5px solid gray;"></td>
					<td colspan=3 rowspan=2></td>
				</tr>
				<tr class="none_title2" style="border-bottom:0.5px solid gray;">
					<td style="border-right:0.5px solid gray;"></td>
				</tr>
				<tr class="none_title">
					<td colspan=3 style="border-right:0.5px solid gray;"></td>
					<td style="text-align:right; padding-right:10px; font-size:18px; font-weight:bold;">원</td>
				</tr>
			</table>
			<table id="air_check_none2">
				<tr class="none_title" style="border-bottom:0.5px solid gray;">
					<td width=150 style="border-right:0.5px solid gray; background:#67ACC3; font-size:15px; font-weight:bold;">오는항공</td>
					<td width=180></td>
					<td width=40>▶</td>
					<td width=180></td>
				</tr>
				<tr class="none_title2">
					<td style="border-right:0.5px solid gray;"></td>
					<td colspan=3 rowspan=2></td>
				</tr>
				<tr class="none_title2" style="border-bottom:0.5px solid gray;">
					<td style="border-right:0.5px solid gray;"></td>
				</tr>
				<tr class="none_title">
					<td colspan=3 style="border-right:0.5px solid gray;"></td>
					<td style="text-align:right; padding-right:10px; font-size:18px; font-weight:bold;">원</td>
				</tr>
			</table>
			<table id="booking"></table>
			<script id="bookingtemp" type="text/x-handlebars-template">
				<tr class="none_title" style="border-bottom:0.5px solid gray;">
					<td width=150 style="border-right:0.5px solid gray; background:#E3B8C7; font-size:15px; font-weight:bold;">가는항공</td>
					<td width=180>{{a_startplace}}</td>
					<td width=40>▶</td>
					<td width=180>{{a_endplace}}</td>
				</tr>
				<tr class="none_title2 row">
					<td class="a_number" style="padding-top:10px; border-right:0.5px solid gray;">{{a_number}}</td>
					<td colspan=3 rowspan=2 style="font-size:15px; font-weight:bold;">{{a_startdate}}  {{a_starttime}}  출발</td>
				</tr>
				<tr class="none_title2" style="border-bottom:0.5px solid gray;">
					<td style="padding-bottom:10px;border-right:0.5px solid gray;">{{a_company}}</td>
				</tr>
				<tr class="none_title">
					<td colspan=3 class="bookPoeple" style="border-right:0.5px solid gray;"></td>
					<td style="text-align:right; padding-right:10px; font-size:18px; font-weight:bold;" class="a_price"></td>
				</tr>
			</script>
			<table id="booking1"></table>
			<script id="bookingtemp1" type="text/x-handlebars-template">
				<tr class="none_title" style="border-bottom:0.5px solid gray;">
					<td width=150 style="border-right:0.5px solid gray; background:#67ACC3; font-size:15px; font-weight:bold;">오는항공</td>
					<td width=180>{{a_startplace}}</td>
					<td width=40>▶</td>
					<td width=180>{{a_endplace}}</td>
				</tr>
				<tr class="none_title2 row">
					<td class="a_number" style="padding-top:10px; border-right:0.5px solid gray;">{{a_number}}</td>
					<td colspan=3 rowspan=2 style="font-size:15px; font-weight:bold;">{{a_startdate}}  {{a_starttime}}  출발</td>
				</tr>
				<tr class="none_title2" style="border-bottom:0.5px solid gray;">
					<td style="padding-bottom:10px;border-right:0.5px solid gray;">{{a_company}}</td>
				</tr>
				<tr class="none_title">
					<td colspan=3 class="bookPoeple" style="border-right:0.5px solid gray;"></td>
					<td style="text-align:right; padding-right:10px; font-size:18px; font-weight:bold;" class="a_price1"></td>
				</tr>
			</script>
			</div>
			<div style="text-align:right; padding-right:30px; font-size:25px;">결제예정금액</div>
			<div style="text-align:right; padding-right:30px; font-size:30px; margin-top:10px;"><span id=priceSum style="display:inline-block; width:500px; color:red;"></span> 원</div>
			<br>
			<input type="button" value="예약하기" id="btnbooking">
		</div>
		<div id="footer"><jsp:include page="../footer.jsp"/></div>
	</div>
</body>
<script>
	var people = 1;
	var child = 0;
	var startplace;
	var endplace;
	var startdate;
	var startdate1;
	var emptyseat;

	
	
	//새로고침시 url파라미터 제거
	window.onkeydown = function() {
		var kcode = event.keyCode;
		if (kcode == 116) {
			history.replaceState({}, null, location.pathname);
		}
	}

	//인덱스에서 넘어온뒤 바로 검색
	$(document).ready(function() {
		if ("${vo.a_startplace }" != ""){
			if("${vo.a_startdate1 }" == ""){
				$("#oneWay").click();
			}
			$("#reserver .a_emptyseat").val("성인 ${vo.people}  청소년 ${vo.child}");
			$(frm.search).click();
		}
	});

	// 합계
	$("#tbl").on("click", ".row .radio", function() {
		var row = $(this).parent().parent();
		var a_price1 = row.find(".a_price1").html();
		var a_price2 = $("#booking1").find(".a_price1").html();
		if (a_price2 != null) {
			$("#priceSum").html(parseInt(a_price1) + parseInt(a_price2));
		} else if (a_price2 == null) {
			$("#priceSum").html(a_price1);
		}
	});
	$("#tbl1").on("click", ".row .radio", function() {
		var row = $(this).parent().parent();
		var a_price2 = row.find(".a_price2").html();
		var a_price = $("#booking").find(".a_price").html();
		if (a_price != null) {
			$("#priceSum").html(parseInt(a_price) + parseInt(a_price2));
		} else if (a_price == null) {
			$("#priceSum").html(a_price2);
		}
	});

	$("#roundTrip").prop('checked', true);
	$(".aircount1").hide();

	$("#oneWay").on("click", function() {
		$("#edate").val("");
		$("#edate").hide();
		$("#sdate").css("width", "300px");
	})
	$("#roundTrip").on("click", function() {
		$("#edate").show();
		$("#sdate").css("width", "145px");
	})
	//예약하기 눌럿을때
	$("#btnbooking").on(
			"click",
			function() {
				var a_number = $("#booking .row").find(".a_number").html();
				var a_number1 = $("#booking1 .row").find(".a_number").html();
				var peopleSum = $("#reserver").find(".row .people").val();
				var childSum = $("#reserver").find(".row .child").val();
				var sum = parseInt(peopleSum) + parseInt(childSum);
				var startplace = $(frm.a_startplace).val();
				var endplace = $(frm.a_endplace).val();
				var a_startdate = $(frm.a_startdate).val();
				var a_startdate1 = $(frm.a_startdate1).val();
				if ($("#roundTrip").is(":checked")) {
					if (a_number == null || a_number1 == null) {
						alert("모든 항목을 선택해주세요");
					} else {
						location.href = "/air/bookingPeople?a_number="
								+ a_number + "&a_number1=" + a_number1
								+ "&sum=" + sum + "&startplace=" + startplace
								+ "&endplace=" + endplace + "&a_startdate1="
								+ a_startdate1;
					}
				} else if ($("#oneWay").is(":checked")) {
					if (a_number == null) {
						alert("모든 항목을 선택해주세요");
					} else {
						location.href = "/air/bookingPeople?a_number="
								+ a_number + "&a_number1=" + a_number1
								+ "&sum=" + sum + "&startplace=" + startplace
								+ "&endplace=" + endplace + "&a_startdate1="
								+ a_startdate1;
					}
				}
				;
			});

	//인원선택
	$(".a_emptyseat").on("click", function() {
		$(".aircount1").show();
		$("#btn").on("click", function() {
			$(".aircount1").hide();
		});
	});
	//인원
	$("#btn").on("click", function() {
		//people=$("#reserver").find(".people").val();
		//child=$("#reserver").find(".child").val();
		$(".a_emptyseat").val("성인 " + people + "  청소년 " + child);
	});
	//성인-
	$("#reserver").on("click", ".peopleSubtract", function() {
		if (people == 0) {

		} else if (people > 1) {
			people = people - 1;
			$(".people").val(people);
		}

	});
	//성인+
	$("#reserver").on("click", ".row .peoplePlus", function() {
		people = people + 1;
		$(".people").val(people);
	});

	//청소년-
	$("#reserver").on("click", ".childSubtract", function() {
		if (child == 0) {

		} else if (child > 0) {
			child = child - 1;
			$(".child").val(child);
		}

	});
	//청소년+
	$("#reserver").on("click", ".row .childPlus", function() {
		child++;
		$(".child").val(child);
	});
	/**/
	//항공리스트 
	$(frm).submit(
			function(e) {
				e.preventDefault();
				startplace = $(frm.a_startplace).val();
				endplace = $(frm.a_endplace).val();
				startdate = $(frm.a_startdate).val();
				startdate1 = $(frm.a_startdate1).val();
				emptyseat = people;
				if ($("#roundTrip").is(":checked")) {
					if (startplace == "" || endplace == "" || startdate == ""
							|| startdate1 == "") {
						alert("모든 항목을 선택해주세요");
					} else {
						airList();
					}
				} else if ($("#oneWay").is(":checked")) {
					if (startplace == "" || endplace == "" || startdate == "") {
						alert("모든 항목을 선택해주세요");
					} else {
						airList();
					}
				}
			});

	//booking
	$("#tbl").on(
			"click",
			".row .radio",
			function() {
				var row = $(this).parent().parent();
				var a_number = row.find(".a_number").html();
				var a_price = row.find(".a_price1").html();
				$("#air_check_none1").hide();
				//alert(a_price);
				$.ajax({
					type : "post",
					url : "/air/listRead",
					dataType : "json",
					data : {
						"a_number" : a_number
					},
					success : function(data) {
						var template = Handlebars.compile($("#bookingtemp")
								.html());
						$("#booking").html(template(data));

						$("#booking .bookPoeple").html(
								"성인 " + people + "  청소년 " + child);
						//$("#booking .bookChild").append(child); 
						//alert(people+"/" + child +"/"+ a_price);
						$("#booking .a_price").html(
								a_price * (people + child) + " 원");
						//location.href="bookingPeople?a_number"+a_number;
						$("#air_check_none2").show();
						sumprice1 = a_price * (people + child);
						$("#priceSum").html(
								parseInt(sumprice1) + parseInt(sumprice2));
					}

				});
			});

	//booking1
	$("#tbl1").on(
			"click",
			".row .radio",
			function() {
				var row = $(this).parent().parent();
				var a_number = row.find(".a_number").html();
				var a_price = row.find(".a_price2").html();
				$("#air_check_none2").hide();
				//alert(a_price);
				$.ajax({
					type : "post",
					url : "/air/listRead",
					dataType : "json",
					data : {
						"a_number" : a_number
					},
					success : function(data) {
						var template1 = Handlebars.compile($("#bookingtemp1")
								.html());
						$("#booking1").html(template1(data));

						$("#booking1 .bookPoeple").html(
								"성인 " + people + "  청소년 " + child);
						//$("#booking1 .bookChild").append(child); 
						$("#booking1 .a_price1").html(
								a_price * (people + child) + " 원");
						sumprice2 = a_price * (people + child);
						$("#priceSum").html(
								parseInt(sumprice1) + parseInt(sumprice2));
					}
				});

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

	function airList() {
		$.ajax({
			type : "post",
			url : "/air/airList",
			dataType : "json",
			data : {
				"a_startplace" : startplace,
				"a_endplace" : endplace,
				"a_startdate" : startdate,
				"a_startdate1" : startdate1,
				"a_emptyseat" : emptyseat
			},
			success : function(data) {
				$("html").animate({
					scrollTop : 450
				}, 500);
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));

				var template1 = Handlebars.compile($("#temp1").html());
				$("#tbl1").html(template1(data));
				//alert(startdate1);
			}
		});
	};
</script>
</html>