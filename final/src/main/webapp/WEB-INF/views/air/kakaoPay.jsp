<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
 	var a_number="${vo.a_number}";
 	var a_number1="${vo.a_number1}";
 	var a_p_residentRegistration="${vo.a_p_residentRegistration}";
 	var a_p_name="${vo.a_p_name}";
 	var a_p_gender="${vo.a_p_gender}";
 	var a_p_seat="${vo.a_p_seat}";
 	var a_p_backseat="{vo. a_p_backseat}";
 	var sum = "${vo.sum}";
 	alert(a_number +"||"+ a_p_residentRegistration +"||"+ a_p_name +"||"+ a_p_seat +"||"+ sum);
	//var email="${vo.email}";
	//alert(a_p_residentRegistration+"/"+email);
/*
 	for(var i=0;i<"${vo.sum}";i++){
 		a_p_residentRegistration.push("${vo.a_p_residentRegistration[i]}");
 	}
 	alert(a_p_residentRegistration);
 	//alert("${vo.a_p_residentRegistration[0]}");
 	
 	//alert(sum);
 	//alert(a_p_residentRegistration+"/"+a_p_name[0]+"/"+a_p_gender[0]+"/"+a_emptyseat[0]+"/"+a_number+"/"+a_number1);
 	 */	
	$(function(){
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp63714033'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'kakaopay',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : "항공편",
	        amount : "${vo.airsum}",//가격
	        //buyer_email : "${vo.email}",//이메일
	        buyer_name : "${vo.payName}",//이름 
	        buyer_tel : "${vo.tel}",//전화번호 
	        //buyer_addr : '인천숭의동',
	        //buyer_postcode : '123-456',
	        //m_redirect_url : 'http://www.naver.com'
	    }, function(rsp) {
	    	  if (rsp.success) {
	    		  
				$.ajax({
					type:"post",
					url:"/air/transaction",
					data:{
						"a_p_residentRegistration":a_p_residentRegistration
						//"a_p_name":a_p_name,
						//"a_p_gender":a_p_gender,
						//"a_p_seat":a_p_seat,
						//"a_p_backseat":a_p_backseat,
						//"a_number":a_number,
						//"a_number1":a_number1,
						//"sum":sum,
						},
					success:function(){
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
</script>
</body>
</html>