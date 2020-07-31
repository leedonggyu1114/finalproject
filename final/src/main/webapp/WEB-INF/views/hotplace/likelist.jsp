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
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script> -->
   <style>
#darken-background {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}

#lightbox {
   width: 1250px;
   height: 1500px;
   margin: auto;
   margin-top: 25px;
   margin-bottom: 25px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
   position: relative;
}

#readtitle {
   position: absolute;
   color: white;
   font-size: 30px;
   top: 55%;
   left: 3%;
}

#readimage {
   border-radius: 5px 5px 0px 0px;
   width: 100%;
   height: 700px;
}

#btnClose {
   background: none;
   outline: none;
   cursor: pointer;
   border: none;
   position: absolute;
   top: 10px;
   right: 10px;
}

@import url(https://fonts.googleapis.com/css?family=Oswald);
@import url(https://fonts.googleapis.com/css?family=Quattrocento);
.div_hotplace_list {
  font-family: 'Quattrocento', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  min-width: 300px;
  max-width: 300px;
  width: 100%;
  color: #141414;
  text-align: left;
  line-height: 1.4em;
  font-size: 16px;
}
.div_hotplace_list * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.div_hotplace_list .mainimage {
  max-width: 100%;
  vertical-align: top;
  cursor:pointer;
}
.div_hotplace_list figcaption {
  position: absolute;
  top: calc(85%);
  width: 100%;
  height:150px;
  background:black;
  opacity:0.5;
  cursor:pointer;
}
.div_hotplace_list figcaption:before {
  position: absolute;
  content: '';
  z-index: 2;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 100px;
  background-image: -webkit-linear-gradient(top, transparent 0%, black 100%);
  background-image: linear-gradient(to bottom, transparent 0%, black 100%);
}

.div_hotplace_list:hover figcaption,
.div_hotplace_list.hover figcaption {
  top: 200px;
}
.div_hotplace_maintitle h3{
   color:white;
   font-size:17px;
   font-weight:normal;
   text-align:center;
}

.hotplace_like {
   position:absolute;
   right:35px;
   top:35px;
   cursor:pointer;
}

#btnprev,
#btnnext {
   border:none;
   outline:none;
   background:none;
   cursor:pointer;
}

#btnprev {
   position:absolute;
   left:5px;
   top:22%;
}

#btnnext {
   position:absolute;
   right:5px;
   top:22%;
}

.userimages {
   width: 80px;
   height: 80px;
   background-image: url("배경이미지경로");
   border-radius: 150px; /* 레이어 반크기만큼 반경을 잡기*/
   display: table-cell;
   vertical-align: middle;
   color: #ffffff;
   font-weight: bold;
   text-align: center;
   float:left;
}
</style>
</head>
<body>
	<jsp:include page="../sidebar.jsp" />
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div style="height: 100px"></div>
			<!-- 여행추천list시작 -->
			<div>
				<h1>내가 찜한 가볼만한 여행지</h1>
				<c:forEach items="${likelist }" var="vo">
					<figure style="float: left" class="div_hotplace_list">
						<div style="width:250px;height:330px;border:1px solid gray;float:left;margin:25px">
							<div>
								<img class="mainimage"
								src="/hotplace/display?fileName=${vo.h_i_images[0]}" width=250
								height=200 x="${vo.h_x }" y="${vo.h_y }" title="${vo.h_title }"
								address="${vo.h_address }" detail="${vo.h_detail }" />
							</div>
							<h3>${vo.h_title }</h3>
							<img src="/resources/img/hotplace/like_hover.png" class="hotplace_like" />
							<div style="margin-top:20px">${vo.h_detail }</div>
						</div>
							
					</figure>
				</c:forEach>
			</div>
			<!-- 여행추천list끝 -->
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
	<div id="darken-background">
      <div id="lightbox">
         <img id="readimage" src="http://placehold.it/150x150"> <br>
         <button id="btnClose"><img src="/resources/img/hotplace/close_icon.png" width=45></button>
         <div id="readtitle"></div>
         <button id="btnprev"><img src="/resources/img/hotplace/prev_icon.png" width=65/></button>
         <button id="btnnext"><img src="/resources/img/hotplace/next_icon.png" width=65/></button>
         <div id="readcontent">
            <div id="readdetail" style="float:left;margin-left:30px"></div>
            <div id="map" style="width:400px;height:400px;float:right;margin:10px"></div>
            <div id="likeuserlist"></div>
            <div id="top_x_div" style="width:400px; height:400px;"></div>
            <div id="donutchart" style="width: 400px; height: 400px;"></div>
         </div>
      </div>
   </div>
</body>
<script>

	var x;
	var y;
	var u_id="${u_id}";
	var address;
	var detail;
	var imagepage=0;
	var images=[];

	//찜목록 삭제하기
	$(".hotplace_like").on("click",function(e){
		e.stopPropagation();
		var div=$(this).parent().parent();
		if(!confirm("정말 찜목록 삭제하실껀가요?"))return;
		x=$(this).parent().parent().find(".mainimage").attr("x");
		y=$(this).parent().parent().find(".mainimage").attr("y");
		$.ajax({
			type:"post",
			url:"likedelete",
			data:{"h_x":x,"h_y":y,"u_id":u_id},
			success:function(){
				$(div).hide();
			}
		});
	});
	
	
	//read사진넘기기
	$("#btnnext").on("click",function(){
		var imagelength=images.length;
		imagepage++;
		if(imagepage>=imagelength){
			imagepage=0;
			$("#readimage").attr("src", "/hotplace/display?fileName="+images[imagepage]);
		}else{
			$("#readimage").attr("src", "/hotplace/display?fileName="+images[imagepage]);
		}
	});
	$("#btnprev").on("click",function(){
		var imagelength=images.length;
		imagepage = imagepage - 1;
		if(imagepage<0){
			imagepage=imagelength-1;
			$("#readimage").attr("src", "/hotplace/display?fileName="+images[imagepage]);
		}else{
			$("#readimage").attr("src", "/hotplace/display?fileName="+images[imagepage]);
		}
	});
	
	
//////read(라이트박스)//////
	$(".div_hotplace_list")
			.on(
					"click",
					function(event) {
						var src = $(this).find(".mainimage").attr("src");
						var title = $(this).find(".mainimage").attr("title");
						x = $(this).find(".mainimage").attr("x");
						y = $(this).find(".mainimage").attr("y");
						address = $(this).find(".mainimage").attr("address");
						detail = $(this).find(".mainimage").attr("detail");
						$("#readimage").attr("src", src);
						$("#readtitle").html(title);
						$("#readdetail").html(detail);
						//getimages();

						//서브사진들 가져오기
						$.ajax({
							type : "get",
							url : "readimages",
							dataType : "json",
							data : {
								"h_x" : x,
								"h_y" : y
							},
							success : function(data) {
								for (var i = 0; i < data.length; i++) {
									images.push(data[i]);
								}
							}
						});

						$("#darken-background")
								.css(
										{
											"top" : (($(window).height() - $(
													"#darken-background")
													.outerHeight()) / 2 + $(
													window).scrollTop())
													+ "px",
											"left" : (($(window).width() - $(
													"#darken-background")
													.outerWidth()) / 2 + $(
													window).scrollLeft())
													+ "px"
										//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
										});
						$("#darken-background").css("display", "block"); //팝업 뒷배경 display block
						$("#lightbox").css("display", "block"); //팝업창 display block

						$("body").css("overflow", "hidden");//body 스크롤바 없애기

						getlikeuserlist();
						getmap();
						getagechart();
						getsexchart();
					});
	$("#btnClose").on("click", function(event) {
		images = [];
		imagepage =0;
		$("#darken-background").css("display", "none"); //팝업창 뒷배경 display none
		$("#lightbox").css("display", "none"); //팝업창 display none
		$("body").css("overflow", "auto");//body 스크롤바 생성
	});

	
	//특정추천명소 좋아요누른 유저 출력
	function getlikeuserlist(){
		$.ajax({
			type:"get",
			url:"likeuserlist",
			dataType:"json",
			data:{"h_x":x,"h_y":y},
			success:function(data){
				var html="";
				for(var i=0; i<data.length;i++){
					html += "<span><img class='userimages' src='/hotplace/userdisplay?fileName="+data[i].u_image+"'/></span>";
				}
				$("#likeuserlist").html(html);
			}
		});
	}
	
	
	//지도촐력
	function getmap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(y,
					x), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
				{
					content : '<div>카카오</div>',
					latlng : new kakao.maps.LatLng(33.450705,
							126.570677)
				},
				{
					content : '<div>생태연못</div>',
					latlng : new kakao.maps.LatLng(33.450936,
							126.569477)
				},
				{
					content : '<div>텃밭</div>',
					latlng : new kakao.maps.LatLng(33.450879,
							126.569940)
				},
				{
					content : '<div>근린공원</div>',
					latlng : new kakao.maps.LatLng(33.451393,
							126.570738)
				} ];

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover',
					makeOverListener(map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	}
	
	function getagechart(){
		//연령벌 차트
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(drawStuff);

		function drawStuff() {
			$.ajax({
				type:"get",
				url:"areachart",
				dataType:"json",
				data:{"h_x":x,"h_y":y},
				success:function(result){
					var data = new google.visualization.arrayToDataTable(result);
					var options = {
						width : 400,
						title : '연령별',
						pieHole : 0.4,
						legend : {
							position : 'none'
						},
						chart : {
							title : '선호도 조사',
							subtitle : ''
						},
						bar : {
							groupWidth : "90%"
						}
					};
		
					var chart = new google.charts.Bar(document.getElementById('top_x_div'));
					// Convert the Classic options to Material options.
					chart.draw(data, google.charts.Bar.convertOptions(options));
				}
			});

		}
	}
	
	//성별차트
	function getsexchart(){
		
		google.charts.load("current", {
				packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			$.ajax({
				type:"get",
				url:"sexchart",
				dataType:"json",
				data:{"h_x":x,"h_y":y},
				success:function(result){
					var data = google.visualization.arrayToDataTable(result);
					
					var options = {
						title : '성별',
						pieHole : 0.4,
					};
		
					var chart = new google.visualization.PieChart(document
							.getElementById('donutchart'));
					chart.draw(data, options);
				}
			});
			

		}
	}


	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</html>