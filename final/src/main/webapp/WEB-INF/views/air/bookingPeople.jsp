<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<style>
		#darken-background {position:absolute;top:0px;left:0px;
         	right:0px; height:100%;   display:none;background:rgba(0, 0, 0, 0.5);
         	z-index:10000;overflow-y:scroll;}
		#lightbox {width:700px;margin:20px auto;padding:15px;
       		border: 1px solid #333333;border-radius:5px;background:white;
       		box-shadow:0px 5px 5px rgba(34, 25, 25, 0.4);text-align:center;}
       	.seat{float:left;}
	</style>
</head>
<body>
	<h1>예약info</h1>
	<div>
		<table>
			<tr>
				<td>구분</td>
				<td>항공사</td>
				<td>편명</td>
				<td>출발시간</td>
				<td>도착시간</td>
			</tr>	
			<tr>
				<td>${startplace } > ${endplace }</td>
				<td>${go.a_company }</td>
				<td>${go.a_number }</td>
				<td>${go.a_starttime }</td>
				<td>${go.a_endtime }</td>
			</tr>
			<tr>
				<c:if test="${a_startdate1 == null }">
					<td>${endplace } > ${startplace }</td>
				</c:if>
				<c:if test="${a_startdate1 != '' }">
					<td>${endplace } > ${startplace }</td>
					<td>${back.a_company }</td>
					<td>${back.a_number }</td>
					<td>${back.a_starttime }</td>
					<td>${back.a_endtime }</td>
				</c:if>
			</tr>
		</table>
		<br>
		<br>
		<h1>예약자</h1>
		<form name="frm" action="kakaoPay">
			<input type="hidden" name="a_number" value="${go.a_number }">
			<input type="hidden" name="a_number1" value="${back.a_number }">
			<input type="hidden" name="sum" value="${sum}"> 
			<table>
				<tr>
					<td>이름:<input type="text" name="payName"></td>
					
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 	이메일 : <input type="text" name="str_email01" id="str_email01" size="10"> @ <input type="text" name="str_email02" id="str_email02" size="10"> 
					 	<select name="selectEmail" id="selectEmail"> 
						 	<option value="1">직접입력</option> 
						 	<option value="naver.com">naver.com</option> 
						 	<option value="hanmail.net">hanmail.net</option> 
						 	<option value="hotmail.com">hotmail.com</option> 
						 	<option value="nate.com">nate.com</option> 
						 	<option value="yahoo.co.kr">yahoo.co.kr</option> 
						 	<option value="empas.com">empas.com</option> 
						 	<option value="dreamwiz.com">dreamwiz.com</option> 
						 	<option value="freechal.com">freechal.com</option> 
						 	<option value="lycos.co.kr">lycos.co.kr</option> 
						 	<option value="korea.com">korea.com</option> 
						 	<option value="gmail.com">gmail.com</option> 
						 	<option value="hanmir.com">hanmir.com</option> 
						 	<option value="paran.com">paran.com</option> 
					 	</select>
					</td> 
				</tr>
				<tr>
					<td>핸드폰번호:<input type="text" name=tel id="tel" onkeyup="keyevent(this);" placeholder="-빼고 입력해주세요 " maxlength="13"></td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						생년월일:<input type="text" name="u_birthday" id="birthday" size=15>
					</td>
				</tr>
			</table>
		<br>
		<br>	
	
			<h1>탑승자</h1>		
			<table id="passengers">
				<c:forEach var="i" begin="1" end="${sum }">
					<tr>
						<td>이름:<input type=text name='a_p_name[i].name'></td>
						<td>성별:<select name='a_p_gender[i].name'>
							<option value='male'>남</option>
							<option value='female'>여</option>
						</select>
					</tr>
					<tr class=row>
						<td>주민번호:<input type=text name='a_p_residentRegistration[i].name' id="a_p_residentRegistration" maxlength="6" size="5">-<input type=text name='a_p_residentRegistration1' id="a_p_residentRegistration1" maxlength="7" size="5"></td>
						<td>가는편 좌석:<input type=text seat="${go.a_number }" class=seatSelection name='a_p_seat[i].name' size=1></td>
						<c:if test="${a_startdate1 == null }">
						</c:if>
						<c:if test="${a_startdate1 != '' }">
							<td>오는편 좌석:<input type=text seat="${back.a_number }" class=seatSelection name='a_p_backseat[i].name' size=1></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			 총 운임비:<input type="hidden" name="airsum"><span id="airsum"></span>
		<input type="submit" value="카카오 결제하기">	
	</form>
	</div>
	<div id="darken-background">
		<div id="lightbox">
			<div id="selectseat"></div>
			<br>
			<button id="btnClose">닫기</button>
		</div>
	</div>
	
</body>
<script>
	var sum="${sum}";
	var present;
	var email="";
	var a_startdate1="${a_startdate1}";	
	var goPrice="${go.a_price}";
	var backPrice="${back.a_price}";
	var thisseat;
	var seatSelection;
	var a_p_residentRegistration="";
	
	//이메일 입력방식 선택 
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () { 
			if($(this).val()== '1'){ //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화 
				$("#str_email02").attr("disabled",false); //활성화 
				}else{ //직접입력이 아닐경우 
					$("#str_email02").val($(this).text()); //선택값 입력 
					$("#str_email02").attr("disabled",true); //비활성화 
					} 
			}); 
		});
	
	//핸드폰 하이픈 생성	
	$(document).on("keyup", "#tel", function() { 
		$(this).val( 
				$(this).val().replace(/[^0-9]/g, "").replace(
						/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	});
	
	//총 운임비 계산하기 
	if(a_startdate1==""){
		$(frm.airsum).val(goPrice*sum);
		$("#airsum").html(goPrice*sum);
	}else{
		$(frm.airsum).val((parseInt(goPrice)+parseInt(backPrice))*parseInt(sum));
		$("#airsum").html((parseInt(goPrice)+parseInt(backPrice))*parseInt(sum));
	};

	//결제하기 
	$(frm).submit(function(e){
		e.preventDefault();
		var payName=$(frm.payName).val();
		email += $(frm.str_email01).val();
		email += "@";
		email += $(frm.str_email02).val();
		var tel=$(frm.tel).val();
		var birthday=$(frm.birthday).val();
		var a_p_name=$(frm.a_p_name).val();
		var a_p_gender=$(frm.a_p_gender).val();
		a_p_residentRegistration += $(frm.a_p_residentRegistration).val();
		a_p_residentRegistration += "-";
		a_p_residentRegistration += $(frm.a_p_residentRegistration1).val();
		$(frm.a_p_residentRegistration).val(a_p_residentRegistration);
		var a_p_seat=$(frm.a_p_seat).val();
		//alert(payName+email+tel+birthday+a_p_name+a_p_gender+a_p_residentRegistration+a_p_seat);
		if(!confirm("여행을 떠날 준비가 되셨나요?"))return;
		//alert(email+"/"+a_p_residentRegistration);
		//if(payName!="" || email!="" || tel!="" || birthday!="" || a_p_name!="" || a_p_gender!="" || a_p_residentRegistration!="" || a_p_seat!="" ){
			frm.submit();
		//}else{
			//alert("모든 text 창을 입력해주세요 ");
		//}
	});

	
	//좌석선택(라이트박스)
	$("#passengers").on("click",".row .seatSelection",function(){
		var a_number=$(this).attr("seat");
		seatSelection=$(this);
		$.ajax({
			type:"get",
			url:"/air/seatlist",
			dataType:"json",
			data:{"a_number":a_number},
			success:function(data){
				var html="";
				var datalength=data.length;
				var dataseat;
				present = $(this);
				for(var i=1; i<=12; i++){
					html +="<div class='seat'><button class='seat1'>A"+i+"</button><button class='seat1'>B"+i+"</button></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					html +="<div class='seat'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class='seat1'>C"+i+"</button><button class='seat1'>D"+i+"</button><button class='seat1'>E"+i+"</button><button class='seat1'>F"+i+"</button></div>";
					html +="<div class='seat'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class='seat1'>G"+i+"</button><button class='seat1'>H"+i+"</button></div><br><br>";
				}
				$("#selectseat").html(html);
				$("#darken-background").show();
				
				$(".seat1").each(function(){
					thisseat=$(this);
					for(var n=0; n<datalength; n++){
						dataseat=data[n];
						if(dataseat==thisseat.html()){
							thisseat.attr('disabled',true);
						}
					}
				});
				
			}
		});
		
	});
	//라이트박스 닫기
	$("#btnClose").on("click",function(){
		$("#darken-background").hide();
	});

	//라이트박스안에 버튼선택시 인풋안으로 이동 
	$("#selectseat").on("click",".seat button",function(){
		var seat1=$(this).html();
		//$("#passengers .row .seatSelection").val(seat1);
		seatSelection.val(seat1);
		//$(this).parent().val(seat1);
		$("#darken-background").hide();
	});

	//생일 받기
	$(document).ready(function(){       
	    $( "#birthday" ).datepicker({
	    	  changeMonth: true, //년을 바꿀수 있는 셀렉박스 
	          changeYear: true, //년을 바꿀수 있는 셀렉박스 
	          showMonthAfterYear: true,
	          nextText: '다음 달', 
	          //dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	          dateFormat: "yy년mm월dd일",
	          yearRange: 'c-100:c+0',
	          maxDate:0
	     });
	    
	    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	    $('#sdate').datepicker("option", "onClose", function (selectedDate){
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	        });
	    
	    $('#edate').datepicker();
	    $('#edate').datepicker("option", "minDate", $("#sdate").val());
	    $('#edate').datepicker("option", "onClose", function (selectedDate){
	        $("#sdate").datepicker( "option", "maxDate", selectedDate );
	       });   
	});

	
	
	
</script>
</html>