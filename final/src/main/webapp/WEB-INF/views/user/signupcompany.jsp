<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#company-area {
	position: relative;
	left: 50%;
	transform: translate(-50%, 0);
	width: 840px;
	border-radius: 5px 5px 5px 5px;
}
#companyCheck {
	border-collapse:collapse;
	margin-top:40px;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
}
#companyCheck .line-id,
#companyCheck .line-pass,
#companyCheck .line-pass2,
#companyCheck .line-email,
#companyCheck .line-tel,
#companyCheck .line-name,
#companyCheck .line-bno,
#companyCheck .line-cname,
#companyCheck .line-ctel,
#companyCheck .line-info,
#companyCheck .line-area {
	height:60px;
}
#companyCheck .line-id>td:nth-child(1),
#companyCheck .line-pass>td:nth-child(1),
#companyCheck .line-pass2>td:nth-child(1),
#companyCheck .line-email>td:nth-child(1),
#companyCheck .line-tel>td:nth-child(1),
#companyCheck .line-name>td:nth-child(1),
#companyCheck .line-address>td:nth-child(1),
#companyCheck .line-bno>td:nth-child(1),
#companyCheck .line-cname>td:nth-child(1),
#companyCheck .line-ctel>td:nth-child(1),
#companyCheck .line-info>td:nth-child(1),
#companyCheck .line-area>td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#companyCheck .line-id>td:nth-child(2),
#companyCheck .line-pass>td:nth-child(2),
#companyCheck .line-pass2>td:nth-child(2),
#companyCheck .line-email>td:nth-child(2),
#companyCheck .line-tel>td:nth-child(2),
#companyCheck .line-name>td:nth-child(2),
#companyCheck .line-address>td:nth-child(2),
#companyCheck .line-bno>td:nth-child(2),
#companyCheck .line-cname>td:nth-child(2),
#companyCheck .line-ctel>td:nth-child(2),
#companyCheck .line-info>td:nth-child(2),
#companyCheck .line-area>td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#companyCheck input[type="text"],
#companyCheck input[type="password"] {
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#companyCheck #sample6_address1,
#companyCheck #sample6_detailAddress1 {
	margin-top:5px;
	width:100%;
}
#companyCheck .line-id input[type="text"],
#companyCheck .line-name input[type="text"],
#companyCheck .line-cname input[type="text"],
#companyCheck .line-ctel input[type="text"],
#companyCheck .line-bno input[type="text"] {
	width:100%;
}
#companyCheck .line-pass input[type="password"],
#companyCheck .line-pass2 input[type="password"] {
	width:100%;
}
#companyCheck .line-email input[type="text"] {
	width:47%;
}
#companyCheck .line-tel input[type="text"] {
	width:30.8%;
	text-align:center;
}
#companyCheck .line-email #email1 {
	width:155.78px;
	height:40px;
}
#companyCheck .line-info textarea {
	width:100%;
	height:80px;
	padding:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
.line-info td {
	height:100px;
}
#companyCheck .line-info span {
	height: 80px;
	padding-top:30px;
}
#hoption img {
	width:200px;
	margin-bottom:25px;
	margin-left:5px;
	cursor:pointer;
}
</style>
</head>
<body>
	<form name="frm1" action="insertCompany" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<div id="company-area">
			<table id="companyCheck">
				<tr class="line-img">
					<td colspan=4>
						<input type="file" name="file1" style="visibility: hidden;"><br>
						<img src="http://placehold.it/150x150" id="image1" width=200 height=200> <br>
						프로필사진
					</td>
				</tr>
				<tr class="line-none">
					<td colspan=4></td>
				</tr>
				<tr class="line-bno">
					<td width=170><span>사업자등록번호</span></td>
					<td width=500>
						<input type="hidden" id="businessNumber" name="c_number">
						<input type="hidden" id="numberread" value="0">
						<input type="text" id="number1" maxlength=3 style="width:30.8%; text-align:center;"> - 
						<input type="text" id="number2" maxlength=2 style="width:30.8%; text-align:center;"> - 
						<input type="text" id="number3" maxlength=5 style="width:30.8%; text-align:center;">
					</td>
					<td width=170 style="text-align:center;">
						<input type="button" id="btncheckNumber" value="중복확인" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"> 
					</td>
				</tr>
				<tr class="line-id">
					<td ><span>아이디</span></td>
					<td>
						<input type="text" id="id1" size=50 name="c_id" placeholder="ID"> 
						
						<input type="hidden" id="idread1" value="0">
					</td>
					<td style="text-align:center;">
						<input type="button" id="btnCheck1" value="중복확인" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"> 
					</td>
				</tr>
				<tr class="line-pass">
					<td><span>패스워드</span></td>
					<td>
						<input type="password" id="pass1" size=50 name="c_pass" placeholder="PASSWORD">
					</td>
					<td></td>
				</tr>
				<tr class="line-pass2">
					<td><span>패스워드 확인</span></td>
					<td>
						<input type="password" id="passCheck1" size=50 placeholder="PASSWORD">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td class="alert alert-success1" id="alert-success1" style="padding-left:19px;">비밀번호가 일치합니다.</td>
					<td class="alert alert-danger1" id="alert-danger1" style="padding-left:19px;">비밀번호가 일치하지 않습니다.</td>
					<td><input type="hidden" value="0" id="passread1"></td>
				</tr>
				<tr class="line-name">
					<td><span>회사이름</span></td>
					<td>
						<input type="text" value="" id="businessNumber" name="c_name" placeholder="COMPANY NAME">
					</td>
					<td></td>
				</tr>
				<tr class="line-address">
					<td><span>회사주소</span></td>
					<td>
						<input type="text" id="sample6_postcode1" placeholder="POSTAL CODE"> 
						<input type="button" onclick="sample6_execDaumPostcode1()" value="우편번호 찾기" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"><br>
						<input type="text" id="sample6_address1" placeholder="ADDRESS" size=50><br>
						<input type="text" id="sample6_detailAddress1" placeholder="DETAILED ADDRESS">
						<input type="hidden" id="sample6_extraAddress1" placeholder="참고항목">
						<input type="hidden" id="allAddress1" name="c_address">
					</td>
					<td><input type="hidden" id="c_x" name="c_x"></td>
					<td><input type="hidden" id="c_y" name="c_y"></td>
				</tr>
				<tr class="line-tel">
					<td><span>사업장번호</span></td>
					<td>
					<input type="hidden" id="txtTel2" name="c_tel" placeholder="TEL">
					<select id="selectTel2" style="height:40px; width:30.8%;">
							<option>02</option>
							<option>031</option>
							<option>032</option>
							<option>033</option>
							<option>041</option>
							<option>042</option>
							<option>043</option>
							<option>044</option>
							<option>051</option>
							<option>052</option>
							<option>053</option>
							<option>054</option>
							<option>055</option>
							<option>061</option>
							<option>062</option>
							<option>063</option>
							<option>064</option>
						</select> -
						<input type="text" id="telFirst2"> -
						<input type="text" id="telSecond2">
					</td>
					<td></td>
				</tr>
				<tr class="line-email">
					<td><span>이메일</span></td>
					<td>
						<input type="text" id="txtEmail1" size="20" placeholder="E-MAIL" value=""> @ 
						<input type="text" id="txtEmailType1" size="20" readOnly> 
						<input type="hidden" id="emailAll1" name="c_email">
					</td>
					<td style="text-align:center;">
						<select id="email1">
							<option id="direct1">직접입력</option>
							<option id="gmail1" value="gmail.com">@gmail.com</option>
							<option id="naver1" value="naver.com">@naver.com</option>
							<option id="daum1" value="daum.net">@daum.net</option>
							<option id="nate1" value="nate.com">@nate.com</option>
						</select> 
					</td>
				</tr>
				<tr class="line-cname">
					<td><span>대표 성명</span></td>
					<td>
						<input type="text" id="txtName" size=40 name="c_ceo" placeholder="CEO NAME">
					</td>
					<td></td>
				</tr>
				<tr class="line-tel">
					<td><span>대표 전화번호</span></td>
					<td>
						<input type="hidden" id="txtTel1" size=50 name="c_ceo_tel" placeholder="CEO TEL">
						<select id="selectTel1" style="height:40px; width:30.8%;">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select> -
						<input type="text" id="telFirst1"> -
						<input type="text" id="telSecond1">
					</td>
					<td><input type="hidden" name="status" value=0></td>
				</tr>
				<tr class="line-info">
					<td><span>세부정보</span></td>
					<td><textarea id="detail" name="c_detail"></textarea></td>
					<td><input type="hidden" name="c_status" value=0></td>
				</tr>
				<tr class="line-area">
					<td><span>지역</span></td>
					<td>
						<select id="area" name="c_area" style="height:40px; width:30.8%;">
							<option>인천</option>
							<option>속초</option>
							<option>충주</option>
							<option>전주</option>
							<option>부산</option>
							<option>여수</option>
							<option>제주</option>
						</select>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
		<div style="text-align:center; background:#efefef; padding:10px 0px 10px 0px; border-radius:3px 3px 3px 3px; margin:25px 5px 35px 5px; font-size:14.5px;">호텔 옵션 선택</div>
		<div id="hoption" style="text-align:center;">
			<span id="hoption1">
				<input type="checkbox" id="h_option1" name="hoption" value="01">
					<label for="h_option1" id="tag1"><img src="/resources/img/hoteloption/Hoption_parking_icon2.png"></label>
					<label for="h_option1" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_parking_icon_hover.png"></label>
			</span>
			<span id="hoption2">
				<input type="checkbox" id="h_option2" name="hoption" value="02">
					<label for="h_option2" id="tag1"><img src="/resources/img/hoteloption/Hoption_food_icon2.png"></label>
					<label for="h_option2" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_food_icon_hover.png"></label>
			</span>
			<span id="hoption3">
				<input type="checkbox" id="h_option3" name="hoption" value="03">
					<label for="h_option3" id="tag1"><img src="/resources/img/hoteloption/Hoption_valet_icon2.png"></label>
					<label for="h_option3" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_valet_icon_hover.png"></label>
			</span>
			<span id="hoption4">
				<input type="checkbox" id="h_option4" name="hoption" value="04">
					<label for="h_option4" id="tag1"><img src="/resources/img/hoteloption/Hoption_wifi_icon2.png"></label>
					<label for="h_option4" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_wifi_icon_hover.png"></label>
			</span>
			<span id="hoption5">
				<input type="checkbox" id="h_option5" name="hoption" value="05">
					<label for="h_option5" id="tag1"><img src="/resources/img/hoteloption/Hoption_luggage_icon2.png"></label>
					<label for="h_option5" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_luggage_icon_hover.png"></label>
			</span>
			<span id="hoption6">
				<input type="checkbox" id="h_option6" name="hoption" value="06">
					<label for="h_option6" id="tag1"><img src="/resources/img/hoteloption/Hoption_smoking_option2.png"></label>
					<label for="h_option6" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_smoking_option_hover.png"></label>
			</span>
			<span id="hoption7">
				<input type="checkbox" id="h_option7" name="hoption" value="07">
					<label for="h_option7" id="tag1"><img src="/resources/img/hoteloption/hoption_Fitness_icon3.png"></label>
					<label for="h_option7" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/hoption_Fitness_icon_hover.png"></label>
			</span>
			<span id="hoption8">
				<input type="checkbox" id="h_option8" name="hoption" value="08">
					<label for="h_option8" id="tag1"><img src="/resources/img/hoteloption/Hoption_front_icon2.png"></label>
					<label for="h_option8" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_front_icon_hover.png"></label>
			</span>
			<span id="hoption9">
				<input type="checkbox" id="h_option9" name="hoption" value="09">
					<label for="h_option9" id="tag1"><img src="/resources/img/hoteloption/Hoption_handicapped_icon2.png"></label>
					<label for="h_option9" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_handicapped_icon_hover.png"></label>
			</span>
			<span id="hoption10">
				<input type="checkbox" id="h_option10" name="hoption" value="10">
					<label for="h_option10" id="tag1"><img src="/resources/img/hoteloption/Hoption_swimming_icon.png"></label>
					<label for="h_option10" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_swimming_icon_hover.png"></label>
			</span>
			<span id="hoption11">
				<input type="checkbox" id="h_option11" name="hoption" value="11">
					<label for="h_option11" id="tag1"><img src="/resources/img/hoteloption/Hoption_restaurant_icon2.png"></label>
					<label for="h_option11" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_restaurant_icon_hover.png"></label>
			</span>
			<span id="hoption12">
				<input type="checkbox" id="h_option12" name="hoption" value="12">
					<label for="h_option12" id="tag1"><img src="/resources/img/hoteloption/Hoption_Washing_icon2.png"></label>
					<label for="h_option12" id="tag1-1" style="display:none;"><img src="/resources/img/hoteloption/Hoption_Washing_icon_hover.png"></label>
			</span>
		</div>
		
		
	<input type="submit" value="회원 가입" id="btn_company_insert" style="margin-top:20px;">
	</form>
	<input type="hidden" id="apiSearch">
	<div id="map" style="width: 100%; height:0px; visibility:hidden;"></div>
</body>
<script>
	$(":checkbox").css("display","none");
	
	$("input[name=hoption]").on("click",function(){
			var tag1=$(this).parent().find("#tag1");
			var tag2=$(this).parent().find("#tag1-1");
			
			if($(this).is(":checked")==true){
				tag1.css("display","none");
				tag2.css("display","inline-block");
			}else{
				tag1.css("display","inline-block");
				tag2.css("display","none");
			}
		});

$("#email1").change(function(){
	var email=$("#email1 option:selected").val();
	if(email!="direct1"){
		$("#txtEmailType1").attr("readonly", true);
	}
})

//email 타입
$("#email1").change(function(){
	var email=$("#email1 option:selected").val();
	if(email==$("#direct1").val()){
		$("#txtEmailType1").attr("readonly",false);
		$("#txtEmailType1").val("");
		$("#txtEmailType1").focus();
	}else{
		$("#txtEmailType1").val(email);
	}
});

//좌표 자동 입력
$("#sample6_address1").focusout(function(){
	var address=$("#sample6_address1").val();
	var addressDetail=$("#sample6_detailAddress1").val();
	 $("#apiSearch").val(address);
	 if($("#apiSearch").val()==""){
		 alert("선택한 주소의 좌표가 존재하지 않습니다.");
	 }
	getMarker();
});
//사업자번호 중복체크
$("#btncheckNumber").on("click",function(){
	var num1=$("#number1").val();
	var num2=$("#number2").val();
	var num3=$("#number3").val();
	var number=num1+num2+num3;
	$("#businessNumber").val(number);
	if($("#businessNumber").val()!=""){
		var c_number=$("#businessNumber").val();
		$.ajax({
			type:"get",
			url:"/user/companyNumberCheck",
			data:{"c_number":c_number},
			success:function(data){
				if(data==1){
					alert("사용 불가능한 번호입니다.");
				}else{
					alert("사용 가능한 번호입니다.");
					$("#numberread").val("1");
				}
			}
		});
	}else{
		alert("사업자등록번호를 입력하세요.");
	}
});

//아이디 중복 체크
$("#btnCheck1").on("click",function(){
	if($("#id1").val()!=""){
		var c_id=$("#id1").val();
		
		$.ajax({
			type:"get",
			url:"/user/companyidCheck",
			data:{"c_id":c_id},
			success:function(data){
				if(data==1){
					alert("사용 불가능한 아이디입니다.");
				}else{
					alert("사용 가능한 아이디입니다.");
					$("#idread1").val("1");
				}
			}
		});
	}else{
		alert("아이디를 입력하세요.");
	}
});

//지도카카오api
function getMarker(){
	   var  query = $("#apiSearch").val();
	      
	   //마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	   var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	   
	   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	       mapOption = {
	           center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	           level: 3 // 지도의 확대 레벨
	       };  
	   
	   // 지도를 생성합니다    
	   var map = new kakao.maps.Map(mapContainer, mapOption); 
	   
	   // 장소 검색 객체를 생성합니다
	   var ps = new kakao.maps.services.Places(); 
	   
	   // 키워드로 장소를 검색합니다
	   ps.keywordSearch(query, placesSearchCB); 
	   
	   // 키워드 검색 완료 시 호출되는 콜백함수 입니다
	   function placesSearchCB (data, status, pagination) {
	       if (status === kakao.maps.services.Status.OK) {
	   
	           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	           // LatLngBounds 객체에 좌표를 추가합니다
	           var bounds = new kakao.maps.LatLngBounds();
	   
	           for (var i=0; i<data.length; i++) {
	               displayMarker(data[i]);    
	               bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	               
	           }   
	           x=data[0].x;
	           y=data[0].y;
	           $("#c_x").val(x);
	           $("#c_y").val(y);
	           // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	           map.setBounds(bounds);
	       } 
	   }
	   
	   // 지도에 마커를 표시하는 함수입니다
	   function displayMarker(place) {
	       
	       // 마커를 생성하고 지도에 표시합니다
	       var marker = new kakao.maps.Marker({
	           map: map,
	           position: new kakao.maps.LatLng(place.y, place.x) 
	       });
	   
	       // 마커에 클릭이벤트를 등록합니다
	       kakao.maps.event.addListener(marker, 'click', function() {
	          
	          $(frm.h_x).val(place.x);
	          $(frm.h_y).val(place.y);
	          $(frm.h_address).val(place.road_address_name);
	           // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	           infowindow.setContent('<div style="padding:5px;font-size:12px;height:40px;">' + place.place_name +' 주소:'+ place.road_address_name + ' X:'+place.x + ' Y:'+place.y + '</div>');
	           infowindow.open(map, marker);
	       });
	   }
}

//비밀번호 확인
$(function(){
	$("#alert-success1").hide(); 
	$("#alert-danger1").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pass1").val(); 
		var pwd2=$("#passCheck1").val(); 
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success1").show(); 
				$("#alert-danger1").hide(); 
				$("#submit").removeAttr("disabled");
				$("#passread1").val("1");
				}else{ $("#alert-success1").hide(); 
				$("#alert-danger1").show(); 
				$("#submit").attr("disabled", "disabled"); 
				} 
			} 
		}); 
	});

function sample6_execDaumPostcode1() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
	        var addr='';//주소 변수
	        var extraAddr='';//참고 항목 변수
	        
	        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress1").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress1").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode1').value = data.zonecode;
            document.getElementById("sample6_address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_address1").focus();
	    }
	}).open();
}
var txtEmail=$("#txtEmail").val();
var txtEmailType=$("#txtEmailType").val();
	//회원 가입 등록
	$(frm1).submit(function(e){
		e.preventDefault();
		var address=$("#sample6_address1").val();
		var addressDetail=$("#sample6_detailAddress1").val();
		var allAddress=address+","+addressDetail;
		var txtEmail=$("#txtEmail1").val();
		var txtEmailType=$("#txtEmailType1").val();
		var emailAll=txtEmail+"@"+txtEmailType;
		
		$("#emailAll1").val(emailAll);
		$("#allAddress1").val(allAddress);
		//사업장번호 합치기
		var ctel1=$("#selectTel2 option:selected").val();
		var ctel2=$("#telFirst2").val();
		var ctel3=$("#telSecond2").val();
		$("#txtTel2").val(ctel1+"-"+ctel2+"-"+ctel3);
		
		//대표번호 합치기
		var tel1=$("#selectTel1 option:selected").val();
		var tel2=$("#telFirst1").val();
		var tel3=$("#telSecond1").val();
		$("#txtTel1").val(tel1+"-"+tel2+"-"+tel3);
		if(!confirm("회원 가입 하시겠습니까?")) return;
		
		//사업자등록번호
		var num1=$("#number1").val();
		var num2=$("#number2").val();
		var num3=$("#number3").val();
		var number=num1+num2+num3;
		$("#businessNumber").val(number);
		
		
		var passread=$("#passread1").val();
		var idread=$("#idread1").val();
		var numread=$("#numberread").val();
		if($("input:checkbox[name='r_o_option']").is(":checked")==false){
			alert("호텔 옵션을 1개이상 선택해주세요.");
		}else{
			if($("#c_x").val()=="" || $("#c_y").val()==""){
			alert("좌표가 존재하지 않습니다. 주소를 확인하세요");
		}else{
			if(idread==0){
				if(passread==0){
					if(numread==0){
						alert("아이디를 확인하세요");
					}else if(numread==1){
						alert("아이디를 확인하세요");
						}
					}else if(passread==1){
						if(numread==0){
							alert("아이디를 확인하세요");
						}else if(numread==1){
							alert("아이디를 확인하세요");
						}
					}
			}else if(idread==1){
				if(passread==0){
					if(numread==0){
						alert("패스워드를 확인하세요");
					}else if(numread==1){
						alert("패스워드를 확인하세요")
					}
				}else if(passread==1){
					if(numread==0){
						alert("사업자번호를 확인하세요");
					}else{
						frm1.submit();
					}
				}
			}
		}
		}
	});

	//이미지 클릭시
	$("#image1").click(function() {
		$(frm1.file1).click();
	});
	//대표 이미지 화면 출력
	$(frm1.file1).on("change", function() {
		var file = $(frm1.file1)[0].files[0];
		$("#image1").attr("src", URL.createObjectURL(file));
	});

	//주소 검색 api
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요. nn0 m
        }
    }).open();
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
</html>