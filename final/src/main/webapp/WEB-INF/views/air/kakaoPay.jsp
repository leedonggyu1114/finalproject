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
	var a_p_residentregistration=[];
	for(var i=0; i<${residentregistration}.length; i++){
		var data = ${residentregistration}[i].a_p_residentregistration;
		a_p_residentregistration.push(data);
	}
	var a_p_name = new Array();
	for(var i=0; i<${name}.length; i++){
		var data = ${name}[i].a_p_name;
		a_p_name.push(data);
	}
	
	var a_p_gender = new Array();
	for(var i=0; i<${gender}.length; i++){
		var data = ${gender}[i].a_p_gender;
		a_p_gender.push(data);
	}
	
	
	var a_p_backseat = new Array();
	if(${backseat}!=""){
		for(var i=0; i<${backseat}.length; i++){
			var data = ${backseat}[i].a_p_backseat;
			a_p_backseat.push(data);
		}
	}
	
	
	
	var a_p_seat = new Array();
	for(var i=0; i<${seat}.length; i++){
		var data = ${seat}[i].a_p_seat;
		a_p_seat.push(data);
	}
	
	var number = "${number}";
	var number1 = "${number1}";
	var sum = "${sum}";
	
// 	alert(a_p_residentregistration);
// 	alert(a_p_name);
// 	alert(a_p_gender);
// 	alert(a_p_backseat);
// 	alert(a_p_seat);
// 	console.log(a_p_residentregistration);
// 	console.log(a_p_name);
// 	console.log(a_p_gender);
// 	console.log(a_p_backseat);
// 	console.log(a_p_seat);
	
// 	$(function(){
// 		var residentregistration=new Array();
// 		<c:forEach items="${residentregistration}" var="vo">
// 			var json = new Object();
// 			json="${vo}";
// 			residentregistration.push(json);
// 		</c:forEach>
// 		a_p_residentregistration = JSON.parse(JSON.stringify(residentregistration));
// 		for(var i=0; i<a_p_residentregistration.length; i++){
// 			res.push(a_p_residentregistration[i]);
// 			alert("res="+res[i]);
// 		}
		
		
// 		var pname=new Array();
// 		<c:forEach items="${name}" var="vo">
// 			var json = new Object();
// 			json="${vo}";
// 			pname.push(json);
// 		</c:forEach>
// 		a_p_name = JSON.parse(JSON.stringify(pname));
// 		for(var i=0; i<a_p_name.length; i++){
// 			nam.push(a_p_name[i]);
// 			alert("nam="+nam[i]);
// 		}
		
// 		var gender=new Array();
// 		<c:forEach items="${gender}" var="vo">
// 			var json = new Object();
// 			json="${vo}";
// 			gender.push(json);
// 		</c:forEach>
// 		a_p_gender = JSON.parse(JSON.stringify(gender));
// 		for(var i=0; i<a_p_gender.length; i++){
// 			gen.push(a_p_gender[i]);
// 			alert("gen="+gen[i]);
// 		}
		
// 		var backseat=new Array();
// 		<c:forEach items="${backseat}" var="vo">
// 			var json = new Object();
// 			json="${vo}";
// 			backseat.push(json);
// 		</c:forEach>
// 		a_p_backseat = JSON.parse(JSON.stringify(backseat));
// 		for(var i=0; i<a_p_backseat.length; i++){
// 			bac.push(a_p_backseat[i]);
// 			alert("bac="+bac[i]);
// 		}
		
// 		var seat=new Array();
// 		<c:forEach items="${seat}" var="vo">
// 			var json = new Object();
// 			json="${vo}";
// 			seat.push(json);
// 		</c:forEach>
// 		a_p_seat = JSON.parse(JSON.stringify(seat));
// 		for(var i=0; i<a_p_seat.length; i++){
// 			sea.push(a_p_seat[i]);
// 			alert("sea="+sea[i]);
// 		}
	
		
// 		alert("residentregistration="+a_p_residentregistration);
// 		alert("name="+a_p_pname);
// 		alert("gender="+a_p_gender);
// 		alert("seat="+a_p_seat);
// 		alert("backseat="+a_p_backseat);
// 		alert("number="+number);
// 		alert("number1="+number1);
// 		alert("sum="+sum);
	
// 	});
// 	alert("test="+test[0]);
	
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
					type:"get",
					url:"/air/transaction",
					traditional : true,
					data:{
						"a_p_residentregistration":a_p_residentregistration,
						"a_p_name":a_p_name,
						"a_p_gender":a_p_gender,
						"a_p_backseat":a_p_backseat,
						"a_p_seat":a_p_seat,
						"a_number":number,
						"a_number1":number1,
						"sum":sum
						},
					success:function(){
						alert("결제성공");
						location.href="/air/bookinglist";
					}
				});
	    	  }else{
	    		  alert("결제가 실패되었습니다");
	    	    location.href="end";
	    	    alert("dd");
	    	  }
	    });
	});

</script>
</body>
</html>