<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
<style>
#airdiscount-area {
	margin-bottom:60px;
	width:100%;
}
#discount {
	margin-top:20px;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	border-collapse:collapse;
	text-align:center;
}
#discount-title {
	background:black;
	color:white;
	height:80px;
	border:none;
}
#discount .next_img {
	position:relative;
	top:2px;
	margin:0px 10px 0px 10px;
}
#discount input[type="text"] {
	cursor:pointer;
	outline:none;
	border:none;
	height:80px;
	width:130px;
	text-align:center;
}
#discount input[type="button"] {
	border:none;
	outline:none;
	cursor:pointer;
	height:40px;
	width:80px;
	border-radius:5px;
}
.aircount1 {
	background:orange;
	margin-top:20px;
}
</style>
</head>
<body>
	<jsp:include page="../floatmenu.jsp"/>
	<jsp:include page="../sidebar.jsp"/>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div id="airdiscount-area">
				<img src="/resources/img/sale/sale_title2.jpg"/>
				<table id="discount">
					<tr id="discount-title">
						<td width=180>구분</td>
						<td colspan=2 width=180>항공편<br>항공사</td>
						<td width=130>출발시간<br>도착시간</td>
						<td width=130>운행시간</td>
						<td width=100>남은좌석</td>
						<td width=130>가격</td>
						<td width=150>인원선택</td>
						<td width=130></td>
					</tr>
					<c:forEach items="${list }" var="vo">
						<tr class="row" style="height:50px;">
							<td rowspan=2 style="border-bottom:0.5px solid gray;">${vo.a_startplace }﻿<img src="/resources/img/user/next.png" class="next_img">${vo.a_endplace }</td>
							<td width=76 style="text-align:right; padding-right:10px; padding-top:27px;"><img src="/air/display?fileName=${vo.a_image}"/></td>
							<td class="a_number" style="text-align:left; padding-top:25px;">${vo.a_number }</td>
							<td style="padding-top:25px; color:red;">${vo.a_starttime }</td>
							<td rowspan=2 style="border-bottom:0.5px solid gray;">${vo.a_runtime }</td>
							<td class="a_emptyseat" rowspan=2 style="border-bottom:0.5px solid gray;">${vo.a_emptyseat }</td>
							<td style="padding-top:25px;text-decoration:line-through;"><fmt:formatNumber value="${vo.a_price}" pattern="#,###"/> 원</td>
							<td rowspan=2 style="border-bottom:0.5px solid gray;"> <input type="text" class="a_emptyseat" placeholder="인원선택" size=4> </td>
							<td rowspan=2 style="border-bottom:0.5px solid gray;"><input type="button" value="결제하기" class="paybtn"></td>
						</tr>
						<tr style="height:50px; border-bottom:0.5px solid gray;">
							<td colspan=2 style="padding-bottom:25px;">${vo.a_company }</td>
							<td style="padding-bottom:25px;">${vo.a_endtime }</td>
							<td class="a_price" style="border-bottom:0.5px solid gray; padding-bottom:25px;"><fmt:formatNumber value="${vo.a_price/2 }" pattern="#,###"/> 원</td>
						</tr>
						<tr class="aircount1">
							<td colspan=4 class="row">
								<h5>인원</h5>
								<span class="age">성인</span> 
								<input type="button" value="-" class="peopleSubtract"> 
								<input type="text" value="1" size="1" class="people"> 
								<input type="button" value="+" class="peoplePlus">
								<span class="age">청소년/어린이</span> 
								<input type="button" value="-" class="childSubtract"> 
								<input type="text" value="0" readonly size="1" class="child"> 
								<input type="button" value="+" class="childPlus">
							</td>
						</tr>
					</c:forEach>
				</table>
				<div id="reserver">
					<div class="aircount1">
						<h5>인원</h5>
						<div class="aircount_row">
							<div class="row">
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

			</div>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>		


</body>
<script>
	var people = 1;
	var child = 0;
	var discountsum;

	$(".aircount1").hide();
	//인원선택
// 	$(".a_emptyseat").on("click", function() {
// 		discountsum = $(this);
// 		discountsum.parent().parent().next().next().show().addClass("open");
// 		if(discountsum){
			
// 		}
// 	});
	

	$(".a_emptyseat").click(
		function(event) {
			$target = $(event.target);
			discountsum = $(this);
			discountsum.parent().parent().next().next().show();
			if (!$target.closest(discountsum.parent().parent().next().next()).length
					&& $(discountsum.parent().parent().next().next()).is(":visible")) {
				discountsum.parent().parent().next().next().hide();
			}
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
	//선택완료시 성인 청소년 넣기 
	$("#btn").on("click", function() {
		discountsum.val(people + "," + child);
		$(".aircount1").hide();
	});
	$("#discount").on(
			"click",
			".row .paybtn",
			function() {
				var row = $(this).parent().parent();
				var a_number = row.find(".a_number").html();
				var sum = parseInt(people) + parseInt(child);
				var a_emptyseat = row.find(".a_emptyseat").html();
				var price = row.find(".a_price").html();
				alert(a_number + sum + a_emptyseat + price);
				if (a_emptyseat < sum) {
					alert("예약 인원이 너무 많습니다");
				} else {
					location.href = "/air/bookingPeople?a_number=" + a_number
							+ "&sum=" + sum + "&price=" + price;
				}
			});
</script>
</html>