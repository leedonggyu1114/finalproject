<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script>
</head>
<style>
</style>

<body>
	
	<div id="page">
		<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		
		<table id="nameCheck">
			<tr>
				<td width=150>아이디</td>
				<td><input type="text" id="id" size=30 style="height:20px;" name="u_id" placeholder="id">
					<input type="button" id="btnCheck" value="중복확인">
					<input type="hidden" id="idread" value="0"></td>
			</tr>
			<tr>
				<td width=150>패스워드</td>
				<td><input type="password" id="pass" size=30 style="height:20px;" name="u_pass" placeholder="pass"></td>
			</tr>
		
			<tr>
				<td width=150>패스워드 확인</td>
				<td><input type="password" id="passCheck" size=30 style="height:20px;" placeholder="pass"></td>
			</tr>
			<tr>
				<td></td>
				<td class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</td>
				<td class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</td>
				<td><input type="hidden" value="0" id="passread"></td>
			</tr>
			<tr>
				<td width=150>이름</td>
				<td><input type="text" id="txtName" size=30 style="height:20px;" name="u_name" placeholder="name"></td>	
			</tr>
				
			<tr>
				<td width=150>생년월일</td>
				<td>
					<input type="text" value="" id="year" size=10>
					<input type="text" value="" id="MM" size=10>
					<input type="text" value="" id="dd" size=10>
					<input type="hidden" id="birthday" value="" name="u_birthday">
				</td>
			</tr>

			<tr>
				<td width=150>주소</td>
				<td><input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" size=50><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" size=30>
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					<input type="hidden" id=allAddress name="u_address">
				</td>	
			</tr>
			 
			<tr>
				<td width=150>휴대폰번호</td>
				<td><input type="hidden" id="txtTel" size=50 style="height:20px;" name="u_tel" placeholder="telephone">
					<select id="selectTel" style="height:26px; width:50px;">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input type="text" size="15" id="telFirst" style="height:20px;">
					<input type="text" size="25" id="telSecond" style="height:20px;">
				</td>
			</tr>
			
			<tr>
				<td width=150>이메일</td>
				<td><input type="text" id="txtEmail" size="20" style="height:20px;"  placeholder="e-mail" value="">
					@
					<input type="text" id="txtEmailType" size="20">
					
					<select style="height:20px; width:150px;" id="email">
						<option id="direct" value="direct">직접입력</option>
						<option id="gmail" value="gmail.com">@gmail.com</option>
						<option id="naver" value="naver.com">@naver.com</option>
						<option id="daum" value="daum.net">@daum.net</option>
						<option id="nate" value="nate.com">@nate.com</option>
					</select>
					
					<input type="hidden" id="emailAll" name="u_email">
					</td>
			</tr>	
			<tr>
				<td><input type="hidden" name="u_status" value=0></td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td>
					<img src="http://placehold.it/150x120" id="image" width=200>
					<input type="file" name="file" style="visibility:hidden;">
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="회원 가입">
		</form>
	</div>
</body>
<script>
$("#email").change(function(){
	var email=$("#email option:selected").val();
	if(email!="direct"){
		$("#txtEmailType").attr("readonly", true);
	}
})


//email 타입
$("#email").change(function(){
	var email=$("#email option:selected").val();
	if(email==$("#direct").val()){
		$("#txtEmailType").attr("readonly",false);
		$("#txtEmailType").val("");
		$("#txtEmailType").focus();
	}else{
		$("#txtEmailType").val(email);
	}
});

//비밀번호 확인
$(function(){
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pass").val(); 
		var pwd2=$("#passCheck").val(); 
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled");
				$("#passread").val("1");
				}else{ $("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
				
				} 
			} 
		}); 
	});



//아이디 중복 체크
$("#btnCheck").on("click",function(){
	if($("#id").val()!=""){
		var u_id=$("#id").val();
		
		$.ajax({
			type:"get",
			url:"/user/idCheck",
			data:{"u_id":u_id},
			success:function(data){
				if(data==1){
					alert("사용 불가능한 아이디입니다.");
				}else{
					alert("사용 가능한 아이디입니다.");
					$("#idread").val("1");
				}
			}
		});
	}else{
		alert("아이디를 입력하세요.");
	}
	
});


// 주소 검색 API
function sample6_execDaumPostcode() {
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
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
	        
	    }
	}).open();
}



	//회원 가입 등록
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("회원 가입 하시겠습니까?")) return;
		var year=$("#year").val();
		var MM=$("#MM").val();
		var dd=$("#dd").val();
		//주소 합치기
		var address=$("#sample6_address").val();
		var addressDetail=$("#sample6_detailAddress").val();
		var allAddress=address+","+addressDetail;
		//생일 합치기
		var birthday=year+"-"+MM+"-"+dd;
		//이메일 합치기
		var txtEmail=$("#txtEmail").val();
		var txtEmailType=$("#txtEmailType").val();
		var emailAll=txtEmail+"@"+txtEmailType;
		$("#emailAll").val(emailAll);
		$("#birthday").val(birthday);
		$("#allAddress").val(allAddress);
		
		//전화번호 합치기
		var tel1=$("#selectTel option:selected").val();
		var tel2=$("#telFirst").val();
		var tel3=$("#telSecond").val();
		$("#txtTel").val(tel1+tel2+tel3);
		
		var passread=$("#passread").val();
		var idread=$("#idread").val();
		if(idread==1 && passread==1){
			frm.submit();
		}else if(idread==0 && passread==1){
			alert("아이디를 중복확인하세요");
		}else if(idread==1 && passread==0){
			alert("패스워드가 일치하는지 확인하세요");
		}else if(idread==0 && passread==0){
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
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>

</html>