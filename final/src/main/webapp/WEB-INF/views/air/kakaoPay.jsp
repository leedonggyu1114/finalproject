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
	var a_p_residentregistration;
	var a_p_name;
	var a_p_gender;
	var a_p_backseat;
	var a_p_seat;
	var number = "${number}";
	var number1 = "${number1}";
	var sum = "${sum}";
	var test=[];
	
	$(function(){
		var residentregistration=new Array();
		<c:forEach items="${residentregistration}" var="vo">
			var json = new Object();
			json="${vo}";
			residentregistration.push(json);
		</c:forEach>
		a_p_residentregistration = JSON.parse(JSON.stringify(residentregistration));
// 		for(var i=0; i<a_p_residentregistration.length; i++){
// 			alert("test="+a_p_residentregistration[i]);
// 			test.push(a_p_residentregistration[i]);
// 		}
		var name=new Array();
		<c:forEach items="${name}" var="vo">
			var json = new Object();
			json="${vo}";
			name.push(json);
		</c:forEach>
		a_p_name = JSON.parse(JSON.stringify(name));
		var gender=new Array();
		<c:forEach items="${gender}" var="vo">
			var json = new Object();
			json="${vo}";
			gender.push(json);
		</c:forEach>
		a_p_gender = JSON.parse(JSON.stringify(gender));
		var backseat=new Array();
		<c:forEach items="${backseat}" var="vo">
			var json = new Object();
			json="${vo}";
			backseat.push(json);
		</c:forEach>
		a_p_backseat = JSON.parse(JSON.stringify(backseat));
		var seat=new Array();
		<c:forEach items="${seat}" var="vo">
			var json = new Object();
			json="${vo}";
			seat.push(json);
		</c:forEach>
		a_p_seat = JSON.parse(JSON.stringify(seat));
	
		alert("residentregistration="+a_p_residentregistration);
		alert("name="+JSON.stringify(name));
		alert("gender="+JSON.stringify(gender));
		alert("seat="+JSON.stringify(seat));
		alert("backseat="+JSON.stringify(backseat));
		alert("number="+number);
		alert("number1="+number1);
		alert("sum="+sum);
	
	
	$(function(){
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp63714033'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'kakaopay',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : "항공편",
	        amount : "${airsum}",//가격
	        //buyer_email : "${vo.email}",//이메일
	        buyer_name : "${payName}",//이름 
	        buyer_tel : "${tel}",//전화번호 
	        //buyer_addr : '인천숭의동',
	        //buyer_postcode : '123-456',
	        //m_redirect_url : 'http://www.naver.com'
	    }, function(rsp) {
	    	  if (rsp.success) {
	    		  
				$.ajax({
					type:"post",
					url:"/air/transaction",
					data:{
						"a_p_residentregistration":a_p_residentregistration,
						"a_p_name":a_p_name,
						"a_p_gender":a_p_gender,
						"a_p_seat":a_p_seat,
						"a_p_backseat":a_p_backseat,
						"a_number":number,
						"a_number1":number1,
						"sum":sum,
						},
					success:function(){
						alert("결제성공");
						location.href="end";
					}
				});
	    	  }else{
	    		  alert("결제가 실패되었습니다");
	    	    location.href="end";
	    	    alert("dd");
	    	  }
	    });
	});
});
</script>
</body>
</html>