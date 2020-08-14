<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminstyle.css"/>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script>
<style>
#apiSearch {
	width:300px;
	height:40px;
	outline:none;
	border:0.5px solid black;
	padding-left:20px;
	border-radius:30px;
}
#btnSearch {
	background:none;
	outline:none;
	border:none;
	cursor:pointer;
	position:absolute;
	top:50%;
	transform:translate(0,-50%);
}
table input[type="text"] {
	width:370px;
	height:30px;
	outline:none;
	border:none;
	border-bottom:0.5px solid gray;
	padding-left:10px;
	cursor:pointer;
	background:none;
}
table select {
	width:370px;
	height:30px;
	outline:none;
	border:none;
	border-bottom:0.5px solid gray;
	padding-left:5px;
	cursor:pointer;
	background:none;
}
table td {
	height:50px;
}
textarea {
	width:362px; 
	height:100%; 
	background:none; 
	padding:10px;
	outline:none;
	border:0.5px solid gray;
}
.hot_title {
	text-align:center;
}
.image_choice {
	text-align:center;
}
</style>
</head>
<body>
	<div id="admin_page">
		<div id="admin_menu"><a href="/admin/index"><img src="/resources/img/admin/home.png" width=50/></a><jsp:include page="menu.jsp"/></div>
		<div id="admin_container">
			<div id="admin_true">
			<img src="/resources/img/admin/read_title.png"/>
			<div style="text-align:center; position:relative; margin-bottom:20px;">
				<input type="text" id="apiSearch">
				<button id="btnSearch"><img src="/resources/img/admin/search_icon.png" width=25/></button>			
			</div>
			<div id="map" style="width:100%;height:350px; margin-bottom:20px;"></div>
			<div>
				<form name="frm" action="hotplace_update" method="post" enctype="multipart/form-data">
					<table style="position:relative; left:50%; transform:translate(-50%,0);">
						<tr>
							<td width=65 class="hot_title">x</td>
							<td width=300><input type="text" name="h_x" value="${vo.h_x }"></td>
						</tr>
						<tr>
							<td class="hot_title">y</td>
							<td><input type="text" name="h_y" value="${vo.h_y }"></td>
						</tr>
						<tr >
							<td class="hot_title">명소명</td>
							<td><input type="text" name="h_title" value="${vo.h_title }"></td>
						</tr>
						<tr>
							<td class="hot_title">주소</td>
							<td><input type="text" name="h_address" value="${vo.h_address }"></td>
						</tr>
						<tr>
							<td class="hot_title">지역</td>
							<td><input type="text" name="h_area" value="${vo.h_area }"></td>
						</tr>
						<tr style="height:100px;">
							<td class="hot_title">상세정보</td>
							<td><textarea name="h_detail">${vo.h_detail }</textarea></td>
						</tr>
						<tr style="height:100px;">
							<td colspan=2 class="image_choice" style="padding-top:30px;">
								메인이미지 변경하기<br><input type="file" name="file" style="margin-left:68px;">
							</td>
						</tr>
						<tr style="height:320px;">	
							<td colspan=2 class="image_choice">
								<img id="image" src="/admin/display?fileName=${vo.h_image}" style="width:300px;height:300px;">
								<input type="hidden" name="h_image" value="${vo.h_image }">
							</td>
						</tr>
						<tr>
							<td>태그1</td>
							<td>
								<select name="h_tag1">
									<option value="01" <c:out value="${vo.h_tag1=='01'?'selected':''}"/>>힐링</option>
									<option value="02" <c:out value="${vo.h_tag1=='02'?'selected':''}"/>>헬스케어</option>
									<option value="03" <c:out value="${vo.h_tag1=='03'?'selected':''}"/>>익사이팅</option>
									<option value="04" <c:out value="${vo.h_tag1=='04'?'selected':''}"/>>나홀로여행</option>
									<option value="05" <c:out value="${vo.h_tag1=='05'?'selected':''}"/>>가족과함께</option>
									<option value="06" <c:out value="${vo.h_tag1=='06'?'selected':''}"/>>연인과함께</option>
									<option value="07" <c:out value="${vo.h_tag1=='07'?'selected':''}"/>>친구와함께</option>
									<option value="08" <c:out value="${vo.h_tag1=='08'?'selected':''}"/>>먹방</option>
									<option value="10" <c:out value="${vo.h_tag1=='10'?'selected':''}"/>>도심속여행</option>
									<option value="11" <c:out value="${vo.h_tag1=='11'?'selected':''}"/>>나만아는</option>
									<option value="12" <c:out value="${vo.h_tag1=='12'?'selected':''}"/>>야경</option>
									<option value="13" <c:out value="${vo.h_tag1=='13'?'selected':''}"/>>교육</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>태그2</td>
							<td>
								<select name="h_tag2">
									<option value="01" <c:out value="${vo.h_tag2=='01'?'selected':''}"/>>힐링</option>
									<option value="02" <c:out value="${vo.h_tag2=='02'?'selected':''}"/>>헬스케어</option>
									<option value="03" <c:out value="${vo.h_tag2=='03'?'selected':''}"/>>익사이팅</option>
									<option value="04" <c:out value="${vo.h_tag2=='04'?'selected':''}"/>>나홀로여행</option>
									<option value="05" <c:out value="${vo.h_tag2=='05'?'selected':''}"/>>가족과함께</option>
									<option value="06" <c:out value="${vo.h_tag2=='06'?'selected':''}"/>>연인과함께</option>
									<option value="07" <c:out value="${vo.h_tag2=='07'?'selected':''}"/>>친구와함께</option>
									<option value="08" <c:out value="${vo.h_tag2=='08'?'selected':''}"/>>먹방</option>
									<option value="10" <c:out value="${vo.h_tag2=='10'?'selected':''}"/>>도심속여행</option>
									<option value="11"  <c:out value="${vo.h_tag2=='11'?'selected':''}"/>>나만아는</option>
									<option value="12" <c:out value="${vo.h_tag2=='12'?'selected':''}"/>>야경</option>
									<option value="13" <c:out value="${vo.h_tag2=='13'?'selected':''}"/>>교육</option>
								</select>
							</td>
						</tr>
						<tr style="height:100px;">
							<td colspan=2 class="image_choice" style="padding-top:30px;">
								서브이미지 변경하기<br><input type="file" accept="image/*" name="files" multiple style="margin-left:68px;">
							</td>
						</tr>
						<tr>	
							<td colspan=2 class="image_choice">
								<div id="images" style="width:489.33px; padding:10px;">
									<c:forEach items="${imagelist }" var="image">
										<img src="/admin/display?fileName=${image }" width=150>
									</c:forEach>
								</div>
							</td>
						</tr>
					</table>
					<div style="text-align:center; padding-top:40px; padding-bottom:40px;">
						<input type="submit" value="수정" style="width:100px; height:30px; cursor:pointer;">
						<input type="button" value="삭제" id="btndelete" style="width:100px; height:30px; cursor:pointer;">
						<input type="reset" value="reset" style="width:100px; height:30px; cursor:pointer;">
					</div>
				</form>
			</div>
							
			</div>
		</div>
	</div>
</body>
<script>
	var address;
	var x;
	var y;
	$("#map").hide();
	
	//수정
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?"))return;
		frm.submit();
	});
	
	//삭제
	$("#btndelete").on("click",function(){
		if(!confirm("정말 삭제할래요?"))return;
		if(!confirm("really???정말 삭제할래요?"))return;
		x=$(frm.h_x).val();
		y=$(frm.h_y).val();
		frm.action="/admin/hotplace_delete";
		frm.submit();
	});
	
	//enter기능
	$("#apiSearch").keydown(function(key){
		if(key.keyCode==13){
			$("#btnSearch").click();
		}
	});
	
	//지도카카오api
	$("#btnSearch").on("click",function(){
		$("#map").show();
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
	});
	
	
	//여러가지이미지업로드
	$(frm.files).on("change", function(){
		var files=$(frm.files)[0].files;
		var html="";
		$.each(files, function(index, files){
			html += "<img src='"+URL.createObjectURL(files)+"' width=150 height=85 style='margin:5px;'>";	
		});
		$("#images").html(html);
	});
	
	
	$(frm.file).on("change", function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>