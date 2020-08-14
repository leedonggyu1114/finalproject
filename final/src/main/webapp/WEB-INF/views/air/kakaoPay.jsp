<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	
</head>
<body>
<script>

	$(function(){
		var residentRegistration=new Array();
		<c:forEach items="${residentRegistration}" var="vo">
			var json = new Object();
			json="${vo}";
			residentRegistration.push(json);
		</c:forEach>
		var name=new Array();
		<c:forEach items="${name}" var="vo">
			var json = new Object();
			json="${vo}";
			name.push(json);
		</c:forEach>
		var gender=new Array();
		<c:forEach items="${gender}" var="vo">
			var json = new Object();
			json="${vo}";
			gender.push(json);
		</c:forEach>
		var backseat=new Array();
		<c:forEach items="${backseat}" var="vo">
			var json = new Object();
			json="${vo}";
			backseat.push(json);
		</c:forEach>
		var seat=new Array();
		<c:forEach items="${seat}" var="vo">
			var json = new Object();
			json="${vo}";
			seat.push(json);
		</c:forEach>
		alert("residentRegistration="+JSON.stringify(residentRegistration));
		alert("name="+JSON.stringify(name));
		alert("gender="+JSON.stringify(gender));
		alert("seat="+JSON.stringify(seat));
		alert("backseat="+JSON.stringify(backseat));
// 		for(var i=0; i<2; i++){
// 			alert("TEST"+residentRegistration[i]);
// 		}
	
	});
	
	
	
//  	var a_number="${vo.a_number}";
//  	var a_number1="${vo.a_number1}";
//  	var a_p_residentRegistration="${vo.a_p_residentRegistration}";
//  	var a_p_name="${vo.a_p_name}";
//  	var a_p_gender="${vo.a_p_gender}";
//  	var a_p_seat="${vo.a_p_seat}";
//  	var a_p_backseat="{vo. a_p_backseat}";
//  	var sum = "${vo.sum}";
//  	alert(a_number +"||"+ a_p_residentRegistration +"||"+ a_p_name +"||"+ a_p_seat +"||"+ sum);

// 	$(function(){
// 	    var IMP = window.IMP; // 생략가능
// 	    IMP.init('imp63714033'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// 	    var msg;
	    
// 	    IMP.request_pay({
// 	        pg : 'kakaopay',
// 	        pay_method : 'card',
// 	        merchant_uid : 'merchant_' + new Date().getTime(),
// 	        name : "항공편",
// 	        amount : "${vo.airsum}",//가격
// 	        //buyer_email : "${vo.email}",//이메일
// 	        buyer_name : "${vo.payName}",//이름 
// 	        buyer_tel : "${vo.tel}",//전화번호 
// 	        //buyer_addr : '인천숭의동',
// 	        //buyer_postcode : '123-456',
// 	        //m_redirect_url : 'http://www.naver.com'
// 	    }, function(rsp) {
// 	    	  if (rsp.success) {
	    		  
// 				$.ajax({
// 					type:"post",
// 					url:"/air/transaction",
// 					data:{
// 						"a_p_residentRegistration":a_p_residentRegistration,
// 						"a_p_name":a_p_name,
// 						"a_p_gender":a_p_gender,
// 						"a_p_seat":a_p_seat,
// 						"a_p_backseat":a_p_backseat,
// 						"a_number":a_number,
// 						"a_number1":a_number1,
// 						"sum":sum,
// 						},
// 					success:function(){
// 						location.href="end";
// 					}
// 				});
// 	    	  }else{
// 	    		  alert("결제가 실패되었습니다");
// 	    	    location.href="end";
// 	    	    alert("dd");
// 	    	  }
// 	    });
// 	});
</script>
</body>
</html>