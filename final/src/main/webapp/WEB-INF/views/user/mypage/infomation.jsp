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
	background:yellow;
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
				<c:if test="${u_id!=null}">
					<form action="updateUser" name="frm" method="post"
						enctype="multipart/form-data">
						<table id="info" border=1>
							<tr>
								<td>프로필 사진</td>
								<td><img src="http://placehold.it/250x250" id="image"
									width=200> <input type="file" name="file"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td colspan="2" id="u_name"></td>
							</tr>
							<tr>
								<td>사용자ID</td>
								<td colspan="2" id="u_id">${u_id}</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td colspan="2" id="u_birthday"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="u_id" value="${u_id}">
								</td>
							</tr>
							<tr>
								<td width=150>주소</td>
								<td colspan="2"><input type="text" id="sample6_postcode"
									placeholder="우편번호"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2"><input type="text" id="sample6_address"
									placeholder="주소" size=50><br> <input type="text"
									id="sample6_detailAddress" placeholder="상세주소" size=50>
									<input type="hidden" id="sample6_extraAddress"
									placeholder="참고항목"> <input type="hidden" id=allAddress
									name="u_address"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" size="15" id="email1"> @ <input
									type="text" id="txtEmailType" size="20"> <select
									style="height: 22px; width: 120px;" id="email">
										<option id="direct" value="direct">직접입력</option>
										<option id="gmail" value="gmail.com">@gmail.com</option>
										<option id="naver" value="naver.com">@naver.com</option>
										<option id="daum" value="daum.net">@daum.net</option>
										<option id="nate" value="nate.com">@nate.com</option>
								</select> <input type="hidden" id="emailAll" name="u_email"></td>
							</tr>

							<tr>
								<td rowspan="3">비밀번호 설정</td>
								<td>현재 비밀번호 : <input type="text" size="30" id="nowPass"></td>
							</tr>
							<tr>
								<td>새 비밀번호 : <input type="text" size="30" id="newPass"></td>
							</tr>
							<tr>
								<td>새 비밀번호 확인 : <input type="text" size="30"
									id="newPassCheck" name="u_pass"></td>
							</tr>
						</table>
						<br> <br> <input type="submit" value="수정"
							style="width: 200px;"> <br> <br>
					</form>
				</c:if>
				<c:if test="${c_id!=null}">
					<span>${c_id}</span> 님의 정보
			<hr>
					<form action="updateCompany" name="frm" method="post"
						enctype="multipart/form-data">
						<table id="companyInfo">
							<tr>
								<td>프로필 사진</td>
								<td><img src="http://placehold.it/250x250" id="image1"
									width=200> <input type="file" name="file1"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td colspan="2" id="c_name"></td>
							</tr>
							<tr>
								<td>업체ID</td>
								<td colspan="2" id="c_id">${c_id}</td>
							</tr>
							<tr>
								<td><input type="hidden" name="c_id" value="${c_id}">
								</td>
							</tr>
							<tr>
								<td width=150 rowspan="2">주소</td>
							</tr>
							<tr>
								<td><span id="address">일반 주소</span><br> <span
									id="addressDetail">상세 주소</span></td>
							</tr>
							<tr>
								<td width=150>대표 번호</td>
								<td><input type="hidden" id="txtTel" size=50 name="c_tel"
									placeholder="telephone"> <select id="selectTel">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
								</select> <input type="text" size="15" id="telFirst"> <input
									type="text" size="25" id="telSecond"></td>
							</tr>
							<tr>
								<td>현재 비밀번호</td>
								<td><input type="text" size=30 id="nowpass"></td>
							</tr>
							<tr>
								<td>변경 비밀번호</td>
								<td><input type="text" size=30 id="newpass"></td>
							</tr>
							<tr>
								<td>변경 비밀번호 확인</td>
								<td><input type="text" size=30 id="newpassCheck"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" size="10" id="email1"> @ <input
									type="text" id="txtEmailType" size="15"> <select
									style="height: 22px; width: 120px;" id="email">
										<option id="direct" value="direct">직접입력</option>
										<option id="gmail" value="gmail.com">@gmail.com</option>
										<option id="naver" value="naver.com">@naver.com</option>
										<option id="daum" value="daum.net">@daum.net</option>
										<option id="nate" value="nate.com">@nate.com</option>
								</select> <input type="hidden" id="emailAll" name="c_email"></td>
							</tr>
						</table>
						<br> <br> <input type="submit" value="수정"
							style="width: 200px;"> <br> <br>
					</form>
				</c:if>
			</div>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
</body>
<script>
	var u_id = "${u_id}";
	var c_id = "${c_id}";

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
		var tel1 = $("#selectTel option:selected").val();
		var tel2 = $("#telFirst").val();
		var tel3 = $("#telSecond").val();
		$("#txtTel").val(tel1 + tel2 + tel3);

		var now_pass = $("#nowpass").val();
		var new_pass = $("#newpass").val();
		var new_passCheck = $("#newpassCheck").val();

		$.ajx({
			type : "get",
			url : "/user/mypage/readCompany",
			data : {
				"c_id" : c_id
			},
			success : function(data) {
				if (data.read.c_pass != now_pass) {
					alert("현재비밀번호를 확인하세요.");
				} else {
					var new_pass = $("#newpass").val();
					var new_passCheck = $("#newpassCheck").val();
					if (new_pass != new_passCheck) {
						alert("비밀번호와 비밀번호 확인 값이 다릅니다.")
					} else {
						if (!confirm("수정하시겠습니까?"))
							return;
						//이메일 합치기
						var txtEmail = $("#email1").val();
						var txtEmailType = $("#txtEmailType").val();
						var emailAll = txtEmail + "@" + txtEmailType;
						$("#emailAll").val(emailAll);
						frm.submit();
					}
				}
			}
		});

	});

	//업체 정보 읽어오기
	$.ajax({
		type : "get",
		url : "/user/mypage/readCompany",
		data : {
			"c_id" : c_id
		},
		success : function(data) {
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
			if (data.read.c_image != "") {
				$("#image1").attr("src",
						"/display?fileName=" + data.read.c_image);
				$("#imagename").val(data.read.c_image);
			} else {
				$("#image1").attr("src", "http://placehold.it/250x250");
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
			if (data.read.u_image != "") {
				$("#image").attr("src",
						"/display?fileName=" + data.read.u_image);
				$("#imagename").val(data.read.u_image);
			} else {
				$("#image").attr("src", "http://placehold.it/250x250");
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