<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행의 설렘 TOURSUM !</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script>

</head>
<body>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp"/></div>
		<div id="menu"><jsp:include page="../menu.jsp"/></div>
		<div id="container">
			<div style="height:100px"></div>
			<!-- 여행추천list시작 -->
			<h1>관광지 등록</h1>
			<div>
				<form name="frm" action="insertPost" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>x<input type="text" name="h_x"></td>
						</tr>
						<tr>
							<td>y<input type="text" name="h_y"></td>
						</tr>
						<tr>
							<td>명소명<input type="text" name="h_title"></td>
						</tr>
						<tr>
							<td>주소<input type="text" name="h_address"></td>
						</tr>
						<tr>
							<td>상세정보<textarea name="h_detail"></textarea></td>
						</tr>
						<tr>
							<td>지역<input type="text" name="h_area" value=""></td>
						</tr>
						<tr>
							<td>
								메인이미지<input type="file" name="file">
							</td>
							<td>
								<img id="image" src="http://placehold.it/150x150" style="width:500px;height:500px;">
							</td>
						</tr>
						<tr>
							<td>태그1<input type="text" name="h_tag1"></td>
						</tr>
						<tr>
							<td>태그2<input type="text" name="h_tag2"></td>
						</tr>
						<tr>
							<td>
								서브이미지<input type="file" accept="image/*" name="files" multiple>
							</td>
							<td>
								<div id="images"></div>
							</td>
						</tr>
					</table>
					<input type="submit" value="insert">
					<input type="reset" value="reset">
				</form>
			</div>
			<h1>지도검색</h1>
			<div style="text-align:center">
				<input type="text" id="apiSearch">
				<input type="button" value="search" id="btnSearch">		
			</div>
			<div id="map" style="width:100%;height:350px;"></div>
			<!-- 여행추천list끝 -->
		</div>
	</div>
</body>
<script>
	var address;
	var x;
	var y;
	
	//enter기능
	$("#apiSearch").keydown(function(key){
		if(key.keyCode==13){
			$("#btnSearch").click();
		}
	});
	
	//지도카카오api
	$("#btnSearch").on("click",function(){
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
			html += "<img src='"+URL.createObjectURL(files)+"' width=150>";	
		});
		$("#images").html(html);
	});
	
	
	$(frm.file).on("change", function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>