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
#air_search input[type="radio"] {
	display:none;
}
#air_search label {
	display:inline-block;
	cursor:pointer;
	border-bottom:1px solid black;
}
#air_search input[type="radio"]:checked + label {
	background:#e9e9e9;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<!-- 1start ------------------------------------------------------------------------------->
			<div id="air_search" style="background:orange; height:400px;">
				<form name="frm" action="search" method="get">
					<div>
						<input type="radio" name="ticketing" id="roundTrip"> 
						<label for="roundTrip">왕복</label>
						<input type="radio" name="ticketing" id="oneWay">
						<label for="oneWay">편도</label>
					</div>
					<input type="text" name="a_startplace" placeholder="출발지" size="10">
					<input type="text" name="a_endplace" placeholder="도착지" size="10">
					<input type="text" name="a_startdate" id="sdate" placeholder="가는날"
						size="15"> <input type="text" name="a_startdate1"
						id="edate" placeholder="오는날 " size="15">
					<div id="reserver">
						<input type="text" class="a_emptyseat" placeholder="인원선택">
						<div class="aircount1">
							<h5>인원</h5>
							<div>
								<div class="row">
									<span>성인</span> <input type="button" value="-"
										class="peopleSubtract"> <input type="text" value="1"
										size="1" class="people"> <input type="button" value="+"
										class="peoplePlus">
								</div>
								<div class="row">
									<span>청소년/어린이</span> <input type="button" value="-"
										class="childSubtract"> <input type="text" value="0"
										readonly size="1" class="child"> <input type="button"
										value="+" class="childPlus">
								</div>
								<div>
									<input type="button" id="btn" value="선택완료">
								</div>
							</div>
						</div>
					</div>
					<input type="submit" name="search" value="검색">
				</form>
			</div>
			<!-- 1end -------------------------------------------------------------------------------->
			<div>
				<table id="tbl"></table>
				<script id="temp" type="text/x-handlebars-template">
				<tr>
					<td>선택</td>
					<td>항공편</td>
					<td>항공사</td>
					<td>출발지</td>
					<td>도착지</td>
					<td>출발시간</td>
					<td>도착시간</td>
					<td>운행시간</td>
					<td>가격</td>
					<td>출발일</td>
					<td>잔여좌석</td>
				</tr>
				{{#each startList}}
				<tr class="row">
					<td><input type="radio" name="startList" class="radio" id="startList"></td>
					<td class="a_number">{{a_number}}</td>
					<td class="a_company">{{a_company}}</td>
					<td class="a_startplace">{{a_startplace}}</td>
					<td class="a_endplace">{{a_endplace}}</td>
					<td class="a_starttime">{{a_starttime}}</td>
					<td class="a_endtime">{{a_endtime}}</td>
					<td class="a_runtime">{{a_runtime}}</td>
					<td class="a_price1">{{a_price}}</td>
					<td class="a_startdate">{{a_startdate}}</td>
					<td class="a_emptyseat">{{a_emptyseat}}</td>
				</tr>
				{{/each}} 			
				</script>
			</div>
			<div>
				<table id="tbl1"></table>
				<script id="temp1" type="text/x-handlebars-template">
				<tr>
					<td>선택</td>
					<td>항공편</td>
					<td>항공사</td>
					<td>출발지</td>
					<td>도착지</td>
					<td>출발시간</td>
					<td>도착시간</td>
					<td>운행시간</td>
					<td>가격</td>
					<td>출발일</td>
					<td>잔여좌석</td>
				</tr>
				{{#each backList}}
				<tr class="row">
					<td><input type="radio" name="backList" class="radio" id="backList"></td>
					<td class="a_number">{{a_number}}</td>
					<td class="a_company">{{a_company}}</td>
					<td class="a_startplace">{{a_startplace}}</td>
					<td class="a_endplace">{{a_endplace}}</td>
					<td class="a_starttime">{{a_starttime}}</td>
					<td class="a_endtime">{{a_endtime}}</td>
					<td class="a_runtime">{{a_runtime}}</td>
					<td class="a_price2">{{a_price}}</td>
					<td class="a_startdate">{{a_startdate}}</td>
					<td class="a_emptyseat">{{a_emptyseat}}</td>
				</tr>
				{{/each}} 			
				</script>
			</div>
			<table id="booking"></table>
			<script id="bookingtemp" type="text/x-handlebars-template">
			<tr>
				<td>항공편 {{a_startplace}}</td> 
				<td>▶</td>
				<td>{{a_endplace}}</td>
			</tr>
			<tr class="row">
				<td>{{a_company}}</td>
				<td class="a_number">{{a_number}}</td>  
				<td>{{a_startdate}}</td> 
				<td>{{a_starttime}}출발</td>
			</tr>
			<tr>
				<td class="bookPoeple" colspan=3></td>
				<td class="a_price"></td>
			</tr>
			</script>
			<table id="booking1"></table>
			<script id="bookingtemp1" type="text/x-handlebars-template">
			<tr>
				<td>항공편 {{a_startplace}}</td>
				<td>▶</td> 
				<td>{{a_endplace}}</td>
			</tr>
			<tr class="row">
				<td>{{a_company}}</td>
				<td class="a_number">{{a_number}}</td>  \
				<td>{{a_startdate}}</td> 
				<td>{{a_starttime}}출발</td>
			</tr>
			<tr>
				<td class="bookPoeple" colspan=3>성인</td>
				<td class="a_price1" ></td>
			</tr>
			</script>
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
	//var sum=people+child;

	$("#roundTrip").prop('checked', true);
	$(".aircount1").hide();

	$("#oneWay").on("click", function() {
		$("#edate").hide();
	})
	$("#roundTrip").on("click", function() {
		$("#edate").show();
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
		$(".a_emptyseat").val("성인:" + people + "청소년:" + child);
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
				}/*else{
							function airList(){
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
									var template = Handlebars.compile($("#temp").html());
									$("#tbl").html(template(data));
									
									var template1 = Handlebars.compile($("#temp1").html());
									$("#tbl1").html(template1(data));
									//alert(startdate1);
							
								}
							});
						}
						};
				 */
			});

	//booking
	$("#tbl").on("click", ".row .radio", function() {
		var row = $(this).parent().parent();
		var a_number = row.find(".a_number").html();
		var a_price = row.find(".a_price1").html();
		//alert(a_price);
		$.ajax({
			type : "post",
			url : "/air/listRead",
			dataType : "json",
			data : {
				"a_number" : a_number
			},
			success : function(data) {
				var template = Handlebars.compile($("#bookingtemp").html());
				$("#booking").html(template(data));

				$("#booking .bookPoeple").html("성인" + people + "청소년" + child);
				//$("#booking .bookChild").append(child); 
				//alert(people+"/" + child +"/"+ a_price);
				$("#booking .a_price").html(a_price * (people + child));
				//location.href="bookingPeople?a_number"+a_number;
			}
		});
	});

	//booking1
	$("#tbl1").on("click", ".row .radio", function() {
		var row = $(this).parent().parent();
		var a_number = row.find(".a_number").html();
		var a_price = row.find(".a_price2").html();
		//alert(a_price);
		$.ajax({
			type : "post",
			url : "/air/listRead",
			dataType : "json",
			data : {
				"a_number" : a_number
			},
			success : function(data) {
				var template1 = Handlebars.compile($("#bookingtemp1").html());
				$("#booking1").html(template1(data));

				$("#booking1 .bookPoeple").html("성인" + people + "청소년" + child);
				//$("#booking1 .bookChild").append(child); 
				$("#booking1 .a_price1").html(a_price * (people + child));
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
									dateFormat : "yy년mm월dd일",
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
















