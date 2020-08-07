<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행의 설렘 TOURSUM !</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
<style>
#user-area {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	width:840px;
	border-radius:5px 5px 5px 5px;
}
#userCheck {
	border-collapse:collapse;
	margin-top:40px;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
}
#userCheck .line-id, 
#userCheck .line-pass,
#userCheck .line-pass2,
#userCheck .line-tel,
#userCheck .line-gender,
#userCheck .line-name,
#userCheck .line-birthday,
#userCheck .line-email {
	height:60px;
}
.line-address td {
	height:150px;
}
.line-img {
	text-align:center;
	margin:auto;
	border-bottom:0.5px solid gray;
}
.line-img td {
	padding-bottom:30px;
}
.line-img img {
	border-radius:50%;
}
#userCheck input[type="text"],
#userCheck input[type="password"] {
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#userCheck #sample6_address,
#userCheck #sample6_detailAddress {
	margin-top:5px;
	width:100%;
}
#userCheck .line-id>td:nth-child(1),
#userCheck .line-pass>td:nth-child(1),
#userCheck .line-pass2>td:nth-child(1),
#userCheck .line-gender>td:nth-child(1),
#userCheck .line-email>td:nth-child(1),
#userCheck .line-tel>td:nth-child(1),
#userCheck .line-name>td:nth-child(1),
#userCheck .line-birthday>td:nth-child(1),
#userCheck .line-address>td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#userCheck .line-id>td:nth-child(2),
#userCheck .line-pass>td:nth-child(2),
#userCheck .line-pass2>td:nth-child(2),
#userCheck .line-gender>td:nth-child(2),
#userCheck .line-email>td:nth-child(2),
#userCheck .line-tel>td:nth-child(2),
#userCheck .line-name>td:nth-child(2),
#userCheck .line-birthday>td:nth-child(2),
#userCheck .line-address>td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#userCheck .line-id input[type="text"],
#userCheck .line-name input[type="text"] {
	width:100%;
}
#userCheck .line-pass input[type="password"],
#userCheck .line-pass2 input[type="password"] {
	width:100%;
}
#userCheck .line-birthday input[type="text"] {
	width:32.5%;
	text-align:center;
}
#userCheck .line-email input[type="text"] {
	width:47%;
}
#userCheck .line-tel input[type="text"] {
	width:30.8%;
	text-align:center;
}
#userCheck .line-birthday input[type="text"] {
	padding:0;
	text-align:center;
}
#userCheck .line-email #email {
	width:155.78px;
	height:40px;
}
#userCheck .line-name input[type="radio"] {
	display:none;
}
#userCheck .line-name label {
	display:inline-block;
	width:77.89px;
	height:40px;
	border:0.5px solid #e9e9e9;
	margin-left:-6.5px;
	padding-top:8px;
	cursor:pointer;
}
#userCheck .line-name input[type="radio"]:checked + label {
	background:#e9e9e9;
	width:77.89px;
	border:0.5px solid #e9e9e9;
	height:40px;
	cursor:pointer;
}
#userCheck span,
#companyCheck span {
	background: #0f4c81;
	height:40px;
	width:155.78px;
	display:inline-block;
	padding-top:11px;
	padding-left:10px;
	color:white;
	border-radius:3px 3px 3px 3px;
	font-size:13px;
}
#userCheck .line-address span,
#companyCheck .line-address span {
	height:130px;
	padding-top:56px;
}
#userCheck .line-none,
#companyCheck .line-none {
	height:30px;
}
#btn_user_insert,
#btn_company_insert {
	width:200px;
	height:40px;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	border:none;
	outline:none;
	border-radius:3px 3px 3px 3px;
	cursor:pointer;
}
#userCheck select,
#companyCheck select {
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
	padding-left:10px;
}

#tag img{width:200px;width:200px;}

label{padding:20px;}
</style>
</head>
<body>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		<div id="user-area">
		<table id="userCheck">
			<tr class="line-img">
				<td colspan=4>
					<input type="file" name="file" style="visibility: hidden;"><br>
					<img src="http://placehold.it/150x150" id="image" width=200 height=200><br>
					프로필사진<br>
				</td>
			</tr>
			<tr class="line-none">
				<td colspan=4></td>
			</tr>
			<tr class="line-id">
				<td width=170><span>아이디</span></td>
				<td colspan=2 width=500>
					<input type="text" id="id" name="u_id" placeholder="ID">
					<input type="hidden" id="idread" value="0">
				</td>
				<td width=170 style="text-align:center;">
					<input type="button" id="btnCheck" value="중복확인" style="width:155.78px; height:40px; border:none; cursor:pointer; outline:none; border-radius:3px 3px 3px 3px;"> 
				</td>
			</tr>
			<tr class="line-pass">
				<td><span>패스워드</span></td>
				<td colspan=2>
					<input type="password" id="pass" size=30 name="u_pass" placeholder="PASSWORD">
				</td>
				<td></td>
			</tr>
			<tr class="line-pass2">
				<td><span>패스워드 확인</span></td>
				<td colspan=2>
					<input type="password" id="passCheck" size=30 placeholder="PASSWORD">
				</td>
				<td></td>
			</tr>
			<tr id="pass-check">
				<td></td>
				<td class="alert alert-success" id="alert-success" style="padding-left:19px;">비밀번호가 일치합니다.</td>
				<td class="alert alert-danger" id="alert-danger" style="padding-left:19px;">비밀번호가 일치하지 않습니다.</td>
			</tr>
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
			<tr class="line-birthday">
				<td><span>생년월일</span></td>
				<td colspan=2>
					<input type="text" value="" id="year" size=10 placeholder=YYYY> 
					<input type="text" value="" id="MM" size=10 placeholder=MM> 
					<input type="text" value="" id="dd" size=10 placeholder=DD> 
					<input type="hidden" id="birthday" value="" name="u_birthday">
				</td>
				<td></td>
			</tr>
			<tr class="line-address">
				<td><span>주소</span></td>
				<td colspan=2>
					<input type="text" id="sample6_postcode" placeholder="POSTAL CODE" style="text-ailgn:center; width:32.5%;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:32.5%; height:40px; border:none; outline:none; border-radius:3px 3px 3px 3px; cursor:pointer"><br> 
					<input type="text" id="sample6_address" placeholder="ADDRESS" size=50><br>
					<input type="text" id="sample6_detailAddress" placeholder="DETAILED ADDRESS" size=30>
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					<input type="hidden" id=allAddress name="u_address">
				</td>
				<td></td>
			</tr>
			<tr class="line-tel">
				<td><span>휴대폰번호</span></td>
				<td colspan=2>
					<input type="hidden" id="txtTel" size=50 style="height: 20px;" name="u_tel" placeholder="TEL">
					<select id="selectTel" style="height:40px; width:30.8%;">
						<option style="padding-top:10px; padding-bottom:10px;">010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select> -
					<input type="text" size="15" id="telFirst" maxlength=4> -
					<input type="text" size="25" id="telSecond" maxlength=4>
				</td>
				<td></td>
			</tr>
			<tr class="line-email">
				<td><span>이메일</span></td>
				<td colspan=2>
					<input type="text" id="txtEmail" size="20" placeholder="E-MAIL" value=""> @ 
					<input type="text" id="txtEmailType" size="20"> 
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
		</div>
		<br>
		<!-- 선호 태그 선택 -->
		<div> 2가지 선택</div>
		<div id="tag">
			<span id="tag1">
				<input type="checkbox" id="t_tag1" name="t_tag" value="01">
					<label for="t_tag1" id="tag1"><img src="/resources/img/usertag/가족과함께.png"></label>
					<label for="t_tag1" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/가족과함께1.png"></label>
			</span>
			<span id="tag2">
				<input type="checkbox" id="t_tag2" name="t_tag" value="02">
					<label for="t_tag2" id="tag1"><img src="/resources/img/usertag/교육.png"></label>
					<label for="t_tag2" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/교육1.png"></label>
			</span>
			<span id="tag3">
				<input type="checkbox" id="t_tag3" name="t_tag" value="03">
					<label for="t_tag3" id="tag1"><img src="/resources/img/usertag/나만아는.png"></label>
					<label for="t_tag3" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/나만아는1.png"></label>
			</span>
			<span id="tag4">
				<input type="checkbox" id="t_tag4" name="t_tag" value="04">
					<label for="t_tag4" id="tag1"><img src="/resources/img/usertag/나혼자여행.png"></label>
					<label for="t_tag4" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/나혼자여행1.png"></label>
			</span>
			<span id="tag5">
				<input type="checkbox" id="t_tag5" name="t_tag" value="05">
					<label for="t_tag5" id="tag1"><img src="/resources/img/usertag/도심속여행.png"></label>
					<label for="t_tag5" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/도심속여행1.png"></label>
			</span>
			<span id="tag6">
				<input type="checkbox" id="t_tag6" name="t_tag" value="06">
					<label for="t_tag6" id="tag1"><img src="/resources/img/usertag/먹방.png"></label>
					<label for="t_tag6" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/먹방1.png"></label>
			</span>
			<span id="tag7">
				<input type="checkbox" id="t_tag7" name="t_tag" value="07">
					<label for="t_tag7" id="tag1"><img src="/resources/img/usertag/야경.png"></label>
					<label for="t_tag7" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/야경1.png"></label>
			</span>
			<span id="tag8">
				<input type="checkbox" id="t_tag8" name="t_tag" value="08">
					<label for="t_tag8" id="tag1"><img src="/resources/img/usertag/연인과함께.png"></label>
					<label for="t_tag8" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/연인과함께1.png"></label>
			</span>
			<span id="tag9">
				<input type="checkbox" id="t_tag9" name="t_tag" value="09">
					<label for="t_tag9" id="tag1"><img src="/resources/img/usertag/익사이팅.png"></label>
					<label for="t_tag9" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/익사이팅1.png"></label>
			</span>
			<span id="tag10">
				<input type="checkbox" id="t_tag10" name="t_tag" value="10">
					<label for="t_tag10" id="tag1"><img src="/resources/img/usertag/친구와함께.png"></label>
					<label for="t_tag10" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/친구와함께1.png"></label>
			</span>
			<span id="tag11">
				<input type="checkbox" id="t_tag11" name="t_tag" value="11">
					<label for="t_tag11" id="tag1"><img src="/resources/img/usertag/헬스케어.png"></label>
					<label for="t_tag11" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/헬스케어1.png"></label>
			</span>
			<span id="tag12">
				<input type="checkbox" id="t_tag12" name="t_tag" value="12">
					<label for="t_tag12" id="tag1"><img src="/resources/img/usertag/힐링.png"></label>
					<label for="t_tag12" id="tag1-1" style="display:none;"><img src="/resources/img/usertag/힐링1.png"></label>
			</span>
		</div>
		 <br>
		<input type="submit" value="회원 가입" id="btn_user_insert">
	</form>
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

	//비밀번호 확인
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pass").val();
			var pwd2 = $("#passCheck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					$("#passread").val("1");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");

				}
			}
		});
	});

	//아이디 중복 체크
	$("#btnCheck").on("click", function() {
		if ($("#id").val() != "") {
			var u_id = $("#id").val();

			$.ajax({
				type : "get",
				url : "/user/idCheck",
				data : {
					"u_id" : u_id
				},
				success : function(data) {
					if (data == 1) {
						alert("사용 불가능한 아이디입니다.");
					} else {
						alert("사용 가능한 아이디입니다.");
						$("#idread").val("1");
					}
				}
			});
		} else {
			alert("아이디를 입력하세요.");
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
		if (!confirm("회원 가입 하시겠습니까?"))
			return;
		var gender = $(":input:radio[name=u_gender]:checked").val();
		var year = $("#year").val();
		var MM = $("#MM").val();
		var dd = $("#dd").val();

		//주소 합치기
		var address = $("#sample6_address").val();
		var addressDetail = $("#sample6_detailAddress").val();
		var allAddress = address + "," + addressDetail;
		//생일 합치기
		var birthday = year + "-" + MM + "-" + dd;
		//이메일 합치기
		var txtEmail = $("#txtEmail").val();
		var txtEmailType = $("#txtEmailType").val();
		var emailAll = txtEmail + "@" + txtEmailType;
		$("#emailAll").val(emailAll);
		$("#birthday").val(birthday);
		$("#allAddress").val(allAddress);

		//전화번호 합치기
		var tel1 = $("#selectTel option:selected").val();
		var tel2 = $("#telFirst").val();
		var tel3 = $("#telSecond").val();
		$("#txtTel").val(tel1 + "-" + tel2 + "-" + tel3);

		var passread = $("#passread").val();
		var idread = $("#idread").val();
		if (idread == 1 && passread == 1) {
			frm.submit();
		} else if (idread == 0 && passread == 1) {
			alert("아이디를 중복확인하세요");
		} else if (idread == 1 && passread == 0) {
			alert("패스워드가 일치하는지 확인하세요");
		} else if (idread == 0 && passread == 0) {
			alert("아이디를 중복확인하세요");
		}

	});

	//이미지 클릭시
	$("#image").click(function() {
		$(frm.file).click();
	});
	//대표 이미지 화면 출력
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	//주소 검색 api
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		}
	}).open();
</script>

</html>