<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여행의 설렘 TOURSUM !</title>
</head>

<style>

#darken-background {
   position: fixed;
   top: 50%;
   left: 50%;
   transform:translate(-50%,-50%);
   width:100%;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}


#lightbox {
   width: 600px;
   height: 750px;
   margin: auto;
   margin-top: 25px;
   margin-bottom: 25px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   position: absolute;
   z-index: 15000;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
   position: relative;
}
#page{
	margin:auto;
	
}
#tag img{
	width:80px;
	height:80px;
	cursor:pointer;
	margin-bottom:20px;
	border-radius:8px 8px 8px 8px;
	margin-left:10px;
	margin-right:10px;
}
</style>
<body>
<div id="darken-background">
      <div id="lightbox">
	      <form name="frm" action="updateKakao" method="post">
	      <div style="text-align:center; background:#efefef; padding:10px 0px 10px 0px; border-radius:3px 3px 3px 3px; margin:25px 5px 30px 5px; font-size:14.5px;">'${u_k_id}'님의 정보를 입력하세요.</div>
	      		<input type="hidden" name="u_k_id" value="${u_k_id}">
	      		<table id="kakaoUpdate">
	      			<tr class="line-name">
						<td><span>이름</span></td>
						<td colspan=2>
							<input type="text" id="txtName" size=30 name="u_name" placeholder="NAME">
						</td>
						<td style="text-align:center; padding-left:8px;">
							<input id="gender_radio1" type="radio" name="u_gender" value="male">
							<label for="gender_radio1">남</label>
							<input id="gender_radio2" type="radio" name="u_gender" value="female">
							<label for="gender_radio2">여</label>
						<td>
							<input type="hidden" value="0" id="passread">
							<input type="hidden" name="u_status" value=0>
						</td>
					</tr>
	      			<tr>
	      				<td><span>휴대폰번호</span></td>
							<td colspan=2>
								<input type="hidden" id="txtTel" size=50 style="height: 20px;" name="u_tel" placeholder="TEL">
								<select id="selectTel">
									<option style="padding-top:10px; padding-bottom:10px;">010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select> -
								<input type="text" id="telFirst" size="5"maxlength=4> -
								<input type="text" id="telSecond" size="5" maxlength=4>
							</td>
						<td></td>
	      			</tr>
	      			<tr class="line-address">
						<td><span>주소</span></td>
						<td colspan=2>
							<input type="text" id="sample6_postcode" placeholder="POSTAL CODE" style="text-ailgn:center; width:32.5%;">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:32.5%; height:40px; border:none; outline:none; border-radius:3px 3px 3px 3px; cursor:pointer"><br> 
							<input type="text" id="sample6_address" placeholder="ADDRESS" size=25><br>
							<input type="text" id="sample6_detailAddress" placeholder="DETAILED ADDRESS" size=15>
							<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
							<input type="hidden" id=allAddress name="u_address">
						</td>
						<td></td>
					</tr>
	      			<tr class="line-email">
						<td><span>이메일</span></td>
						<td colspan=2>
							<input type="text" id="txtEmail" size="10" placeholder="E-MAIL" value=""> @ 
							<input type="text" id="txtEmailType" size="10"> 
						</td>
						<td style="text-align:center;">
							<select id="email">
								<option id="direct" value="direct">직접입력</option>
								<option id="gmail" value="gmail.com">@gmail.com</option>
								<option id="naver" value="naver.com">@naver.com</option>
								<option id="daum" value="daum.net">@daum.net</option>
								<option id="nate" value="nate.com">@nate.com</option>
							</select> 
							<input type="hidden" id="emailAll" name="u_email">
						</td>
					</tr>
	      		</table>
	      		<!-- 선호 태그 선택 -->
		<div style="text-align:center; background:#efefef; padding:10px 0px 10px 0px; border-radius:3px 3px 3px 3px; margin:25px 5px 30px 5px; font-size:14.5px;">선호하는 여행 스타일을 선택해주세요. (2개)</div>
		<div id="tag" style="text-align:center;">
			<span id="tag1">
				<input type="checkbox" id="t_tag1" name="t_tag" value="01">
					<label for="t_tag1" id="tag1"><img src="/resources/img/usertag/가족과함께.png"></label>
					<label for="t_tag1" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/가족과함께.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag2">
				<input type="checkbox" id="t_tag2" name="t_tag" value="02">
					<label for="t_tag2" id="tag1"><img src="/resources/img/usertag/교육.png"></label>
					<label for="t_tag2" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/교육.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag3">
				<input type="checkbox" id="t_tag3" name="t_tag" value="03">
					<label for="t_tag3" id="tag1"><img src="/resources/img/usertag/나만아는.png"></label>
					<label for="t_tag3" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/나만아는.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag4">
				<input type="checkbox" id="t_tag4" name="t_tag" value="04">
					<label for="t_tag4" id="tag1"><img src="/resources/img/usertag/나혼자여행.png"></label>
					<label for="t_tag4" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/나혼자여행.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag5">
				<input type="checkbox" id="t_tag5" name="t_tag" value="05">
					<label for="t_tag5" id="tag1"><img src="/resources/img/usertag/도심속여행.png"></label>
					<label for="t_tag5" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/도심속여행.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag6">
				<input type="checkbox" id="t_tag6" name="t_tag" value="06">
					<label for="t_tag6" id="tag1"><img src="/resources/img/usertag/먹방.png"></label>
					<label for="t_tag6" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/먹방.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag7">
				<input type="checkbox" id="t_tag7" name="t_tag" value="07">
					<label for="t_tag7" id="tag1"><img src="/resources/img/usertag/야경.png"></label>
					<label for="t_tag7" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/야경.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag8">
				<input type="checkbox" id="t_tag8" name="t_tag" value="08">
					<label for="t_tag8" id="tag1"><img src="/resources/img/usertag/연인과함께.png"></label>
					<label for="t_tag8" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/연인과함께.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag9">
				<input type="checkbox" id="t_tag9" name="t_tag" value="10">
					<label for="t_tag9" id="tag1"><img src="/resources/img/usertag/익사이팅.png"></label>
					<label for="t_tag9" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/익사이팅.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag10">
				<input type="checkbox" id="t_tag10" name="t_tag" value="11">
					<label for="t_tag10" id="tag1"><img src="/resources/img/usertag/친구와함께.png"></label>
					<label for="t_tag10" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/친구와함께.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag11">
				<input type="checkbox" id="t_tag11" name="t_tag" value="12">
					<label for="t_tag11" id="tag1"><img src="/resources/img/usertag/헬스케어.png"></label>
					<label for="t_tag11" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/헬스케어.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
			<span id="tag12">
				<input type="checkbox" id="t_tag12" name="t_tag" value="13">
					<label for="t_tag12" id="tag1"><img src="/resources/img/usertag/힐링.png"></label>
					<label for="t_tag12" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/힐링.png" style="border:0.5px solid #0f4c81;"></label>
			</span>
		</div>
		 <br>
		 <input type="submit" value="Submit" id="btnUpdatekakao">
	      </form>
	      <input type="button" id="btnClose" value="close">
      </div>
 	</div>
</body>
<script>
	$(":checkbox").css("display","none");	
	
	$("input[name=t_tag]").on("click",function(){
		
		$(this).length	
		var count=$("input:checked[type='checkbox']").length;	
		if(count<3){
			var tag1=$(this).parent().find("#tag1");
			var tag2=$(this).parent().find("#tag1-1");
			
			if($(this).is(":checked")==true){
				tag1.css("display","none");
				tag2.css("display","inline-block");
			}else{
				tag1.css("display","inline-block");
				tag2.css("display","none");
			}
		}else{
			$(this).prop("checked",false);
			alert("2개까지만 선택할 수 있습니다.");
		}
	});
	
	$("#email").change(function() {
		var email = $("#email option:selected").val();
		if (email != "direct") {
			$("#txtEmailType").attr("readonly", true);
		}
	})
	
	//email 타입
	$("#email").change(function() {
		var email = $("#email option:selected").val();
		if (email == $("#direct").val()) {
			$("#txtEmailType").attr("readonly", false);
			$("#txtEmailType").val("");
			$("#txtEmailType").focus();
		} else {
			$("#txtEmailType").val(email);
		}
	});
	
	// 주소 검색 API
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
						var addr = '';//주소 변수
						var extraAddr = '';//참고 항목 변수
	
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;
						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}
	
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
	
					}
				}).open();
	}


	//회원 가입 등록
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("회원 정보를 제출하시겠습니까?")) return;
		var gender = $(":input:radio[name=u_gender]:checked").val();
		var year = $("#year").val();
		var MM = $("#MM").val();
		var dd = $("#dd").val();
		
		//주소 합치기
		var address = $("#sample6_address").val();
		var addressDetail = $("#sample6_detailAddress").val();
		var allAddress = address + "," + addressDetail;
		//이메일 합치기
		var txtEmail = $("#txtEmail").val();
		var txtEmailType = $("#txtEmailType").val();
		var emailAll = txtEmail + "@" + txtEmailType;
		$("#emailAll").val(emailAll);
		$("#allAddress").val(allAddress);
	
		//전화번호 합치기
		var tel1 = $("#selectTel option:selected").val();
		var tel2 = $("#telFirst").val();
		var tel3 = $("#telSecond").val();
		$("#txtTel").val(tel1 + "-" + tel2 + "-" + tel3);
		frm.submit();
	});
	

		$("#darken-background").css("display", "block"); //팝업 뒷배경 display block
		$("#lightbox").css("display", "inline-block;"); //팝업창 display block
	
		$("body").css("overflow", "hidden");//body 스크롤바 없애기
		
		
	$("#btnClose").on("click", function(event) {
		$("#darken-background").css("display", "none"); //팝업창 뒷배경 display none
		$("#lightbox").css("display", "none"); //팝업창 display none
		$("body").css("overflow", "auto");//body 스크롤바 생성
	});
	//주소 검색 api
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		}
	}).open();
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
</html>