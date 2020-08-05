<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css" />
<style>
#user-information-area {
	padding:40px;
	position:relative;
	margin-bottom:30px;
}
#user-information-area #info,
#user-information-area #companyInfo {
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	margin-top:20px;
}
#user-information-area .line-info {
	height:60px;
}
#user-information-area .line-info td:nth-child(1),
#user-information-area .line-address td:nth-child(1) {
	text-align:left;
	padding-left:7px;
}
#user-information-area .line-info td:nth-child(2),
#user-information-area .line-address td:nth-child(2) {
	padding-left:10px;
	padding-right:10px;
}
#user-information-area span {
	background: #0f4c81;
	color:white;
	height:40px;
	width:155.78px;
	display:inline-block;
	padding-top:11px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	font-size:13px;
}
#user-information-area [type="text"],
#user-information-area [type="password"],
#user-information-area [type="submit"] {
	height:40px;
	padding-left:10px;
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
}
#user-information-area .line-info.a input {
	width:100%;
}
#user-information-area select {
	border-radius:3px 3px 3px 3px;
	border:0.5px solid #e9e9e9;
	cursor:pointer;
	padding-left:10px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../../header.jsp" /></div>
		<div id="menu"><jsp:include page="../../menu.jsp" /></div>
		<div id="container">
			<div id="user-information-area">
				<div style="text-align:center;"><img src="/resources/img/user/user_information_title.png" width=400/></div>
				<c:if test="${u_id!=null}">
					<form action="updateUser" name="frm" method="post" enctype="multipart/form-data">
						<table id="info" style="border-collapse:collapse;">
							<tr>
								<td colspan=3 style="text-align:center;">
									<input type="file" name="file" style="visibility: hidden;"><br>
									<img src="http://placehold.it/250x250" id="image" width=200 height=200 style="cursor:pointer; border-radius:50%; margin-bottom:40px;"> 
								</td>
							</tr>
							<tr class="line-info a">
								<td width=170><span>이름</span></td>
								<td width=500><input type="text" id="u_name" value=""></td>
								<td width=170><input type="hidden" id=allAddress name="u_address"></td>
							</tr>
							<tr class="line-info a">
								<td><span>ID</span></td>
								<td><input type="text" id="u_id" value="${u_id}" readonly></td>
								<td><input type="hidden" name="u_id" value="${u_id}"></td>
							</tr>
							<tr class="line-info">
								<td><span>생년월일</span></td>
								<td id="u_birthday"></td>
								<td><input type="hidden" id="emailAll" name="u_email"></td>
							</tr>
							<tr class="line-address">
								<td width=150><span style="height:130px; padding-top:56px;">주소</span></td>
								<td style="height:150px;">
									<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:32.5%">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:32.5%; height:40px; border:none; outline:none; border-radius:3px 3px 3px 3px; cursor:pointer"><br>
									<input type="text" id="sample6_address" placeholder="주소" style="margin-top:5px; width:100%;"><br> 
									<input type="text" id="sample6_detailAddress" style="margin-top:5px; width:100%;"><br>
									<input type="hidden" id="sample6_extraAddress">
								</td>
								<td></td>
							</tr>
							<tr class="line-info">
								<td width=150><span>TEL</span></td>
								<td>
									<select id="selectTel" style="height:40px; width:30.8%;">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select> -
									<input type="text" style="height:40px; width:30.8%;"> -
									<input type="text" style="height:40px; width:30.8%;">
								</td>
								<td></td>
							</tr>
							<tr class="line-info">
								<td><span>이메일</span></td>
								<td>
									<input type="text" id="email1" style="width:47%;"> @ 
									<input type="text" id="txtEmailType" style="width:47%;">
								</td>
								<td style="text-align:center;">
									<select id="email" style="width:155.78px; height:40px;">
										<option id="direct" value="direct">직접입력</option>
										<option id="gmail" value="gmail.com">@gmail.com</option>
										<option id="naver" value="naver.com">@naver.com</option>
										<option id="daum" value="daum.net">@daum.net</option>
										<option id="nate" value="nate.com">@nate.com</option>
									</select> 
								</td>
							</tr>
							<tr class="line-info a">
								<td><span>현재 비밀번호</span></td>
								<td><input type="text" id="nowPass"></td>
								<td></td>
							</tr>
							<tr class="line-info a">
								<td><span>새 비밀번호</span></td>
								<td><input type="text" id="newPass"></td>
								<td></td>
							</tr>
							<tr class="line-info a">
								<td><span>새 비밀번호 확인</span></td>
								<td><input type="text" id="newPassCheck" name="u_pass"></td>
								<td></td>
							</tr>
						</table>
						<input type="submit" value="수정하기" style="width:200px; height:40px; margin-top:30px; position:relative; left:50%; transform:translate(-50%,0); background:#0f4c81; color:white;">
					</form>
				</c:if>
				<c:if test="${c_id!=null}">
					<form action="updateCompany" name="frm" method="post"
						enctype="multipart/form-data">
						<table id="companyInfo" style="border-collapse:collapse;">
							<tr>
								<td colspan=3 style="text-align:center;">
									<input type="file" name="file1" style="visibility: hidden;"><br>
									<img src="http://placehold.it/250x250" id="image1" width=200 height=200 style="cursor:pointer; border-radius:50%; margin-bottom:40px;">
								</td>
							</tr>
							<tr class="line-info a">
								<td width=170><span>이름</span></td>
								<td width=500><input type="text" id="c_name"></td>
								<td width=170></td>
							</tr>
							<tr class="line-info a">
								<td><span>ID</span></td>
								<td><input type="text" id="c_id" value="${c_id}"></td>
								<td><input type="hidden" name="c_id" value="${c_id}"></td>
							</tr>
							<tr class="line-address">
								<td width=150><span style="height:130px; padding-top:56px;">주소</span></td>
								<td style="height:150px;">
									<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:32.5%">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:32.5%; height:40px; border:none; outline:none; border-radius:3px 3px 3px 3px; cursor:pointer"><br>
									<span id="address" style="width:100%; background:none; color:black; border:0.5px solid #e9e9e9; margin-top:5px;"></span><br> 
									<span id="addressDetail" style="width:100%; background:none; color:black; border:0.5px solid #e9e9e9; margin-top:5px;">상세 주소</span>
								</td>
								<td><input type="hidden" id="txtTel" size=50 name="c_tel" placeholder="telephone"> </td>
							</tr>
							<tr class="line-info">
								<td width=150><span>TEL</span></td>
								<td>
									<select id="selectTel" style="height:40px; width:30.8%;">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select> -
									<input type="text" id="telFirst" style="height:40px; width:30.8%;"> -
									<input type="text" id="telSecond" style="height:40px; width:30.8%;">
								</td>
								<td></td>
							</tr>
							<tr class="line-info">
								<td><span>이메일</span></td>
								<td>
									<input type="text" id="email1" style="width:47%;"> @ 
									<input type="text" id="txtEmailType" style="width:47%;"> 
								</td>
								<td style="text-align:center;">
									<select id="email" style="width:155.78px; height:40px;">
										<option id="direct" value="direct">직접입력</option>
										<option id="gmail" value="gmail.com">@gmail.com</option>
										<option id="naver" value="naver.com">@naver.com</option>
										<option id="daum" value="daum.net">@daum.net</option>
										<option id="nate" value="nate.com">@nate.com</option>
									</select> 
								</td>
							</tr>
							<tr class="line-info a">
								<td><span>현재 비밀번호</span></td>
								<td><input type="text" size=30 id="nowpass"></td>
								<td></td>
							</tr>
							<tr class="line-info a">
								<td><span>새 비밀번호</span></td>
								<td><input type="text" id="newpass"></td>
								<td></td>
							</tr>
							<tr class="line-info a">
								<td><span>새 비밀번호 확인</span></td>
								<td><input type="text" id="newpassCheck"></td>
								<td><input type="hidden" id="emailAll" name="c_email"></td>
							</tr>
						</table>
						<input type="submit" value="수정" style="width:200px; height:40px; margin-top:30px; position:relative; left:50%; transform:translate(-50%,0); background:#0f4c81; color:white;">
					</form>
				</c:if>
				<a href="/user/mypage/usercancel?">회원 탈퇴</a>
			</div>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
</body>
<script>
	var u_id = "${u_id}";
	var c_id = "${c_id}";
	var u_name = "${u_name}";

	$("#email").change(function() {
		var email = $("#email option:selected").val();
		if (email != "direct") {
			$("#txtEmailType").attr("readonly", true);

		}
	});
	//업체 회원 정보 수정
	$(frm).submit(function(e) {
		e.preventDefault();
		//전화번호 합치기
		var tel1=$("#selectTel option:selected").val();
		var tel2=$("#telFirst").val();
		var tel3=$("#telSecond").val();
		$("#txtTel").val(tel1+tel2+tel3);
		
		var now_pass=$("#nowpass").val();
		var new_pass=$("#newpass").val();
		var new_passCheck=$("#newpassCheck").val();
		
		 $.ajax({
			type:"get",
			url:"/user/mypage/readCompany",
			data:{"c_id":c_id},
			success:function(data){
					if($("#telFirst").val()=="" || $("#telSecond").val()==""){
						alert("대표 전화번호를 입력하세요");
					}else{
					if(data.read.c_pass!=now_pass){
						alert("현재비밀번호를 확인하세요.");
					}else{
						var new_pass=$("#newpass").val();
						var new_passCheck=$("#newpassCheck").val();
						if(new_pass!=new_passCheck){
							alert("비밀번호와 비밀번호 확인 값이 다릅니다.")
						}else{
							if(!confirm("수정하시겠습니까?")) return;
							//이메일 합치기
							var txtEmail=$("#email1").val();
							var txtEmailType=$("#txtEmailType").val();
							var emailAll=txtEmail+"@"+txtEmailType;
							$("#emailAll").val(emailAll);
							frm.submit();
						}
					}
				}
			}

		});
	});

	//업체 정보 읽어오기
	$.ajax({
		type:"get",
		url:"/user/mypage/readCompany",
		data:{"c_id":c_id},
		success:function(data){
			$("#c_name").html(data.read.c_name);
			//주소 split
			var beforeAdd = data.read.c_address;
			var afterAdd = beforeAdd.split(',');
			$("#address").html(afterAdd[0]);
			$("#addressDetail").html(afterAdd[1]);
			//이메일 split
			var beforeEmail = data.read.c_email;
			var afterEmail = beforeEmail.split('@');
			$("#email1").val(afterEmail[0]);
			$("#txtEmailType").val(afterEmail[1]);
			//이미지 read
			if(data.read.c_image!=""){
				$("#image1").attr("src","/displayCompany?fileName="+data.read.c_image);
			}else{
				$("#image1").attr("src","http://placehold.it/250x250");
			}

		}
	});

	//회원 정보 수정
	$(frm).submit(function(e) {
		e.preventDefault();
		var now_pass = $("#nowPass").val();

		//현재 비밀번호 확인
		$.ajax({
			type : "get",
			url : "/user/mypage/read",
			data : {
				"u_id" : u_id
			},
			success : function(data) {
				if (data.read.u_pass != now_pass) {
					alert("현재비밀번호를 확인하세요.");
				} else {
					var new_pass = $("#newPass").val();
					var new_passCheck = $("#newPassCheck").val();
					if (new_pass != new_passCheck) {
						alert("비밀번호와 비밀번호 확인 값이 다릅니다.")
					} else {
						if (!confirm("수정하시겠습니까?"))
							return;
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
						frm.submit();
					}
				}
			}
		});
	});

	//회원 정보 읽어오기
	$.ajax({
		type : "get",
		url : "/user/mypage/read",
		data : {
			"u_id" : u_id
		},
		success : function(data) {
			$("#u_name").html(data.read.u_name);
			$("#u_birthday").html(data.read.u_birthday);
			//주소 split
			var beforeAdd = data.read.u_address;
			var afterAdd = beforeAdd.split(',');
			$("#sample6_address").val(afterAdd[0]);
			$("#sample6_detailAddress").val(afterAdd[1]);
			//이메일 split
			var beforeEmail = data.read.u_email;
			var afterEmail = beforeEmail.split('@');
			$("#email1").val(afterEmail[0]);
			$("#txtEmailType").val(afterEmail[1]);

			//이미지 read
			if (data.read.u_image != null) {
				$("#image").attr("src",
						"/display?fileName=" + data.read.u_image);
				$("#imagename").val(data.read.u_image);
			}
		}
	});

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

	//주소 검색 API
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

	//업체이미지 클릭시
	$("#image1").click(function() {
		$(frm.file1).click();

	});

	//업체대표 이미지 화면 출력
	$(frm.file1).on("change", function() {
		var file = $(frm.file1)[0].files[0];
		$("#image1").attr("src", URL.createObjectURL(file));
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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
</html>