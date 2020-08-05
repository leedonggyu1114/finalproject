<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
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
   top: 39%;
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
   width: 70px;
   height: 70px;
   border-radius: 50%;
   text-align: center;
}
#likeuserlist span {
	padding:10px;
	float:left;
	margin-top:5px;
}
</style>
</head>
<body>
	<div id="darken-background">
      <div id="lightbox">
         <img id="readimage" src="http://placehold.it/150x150">
         <button id="btnClose"><img src="/resources/img/hotplace/close_icon.png" width=45></button>
         <div id="readtitle"></div>
         <div id="readdetail" style="display:inline-block; text-align:left; position:absolute; left:3%; top:42%; color:white;"></div>
         <button id="btnprev"><img src="/resources/img/hotplace/prev_icon.png" width=65/></button>
         <button id="btnnext"><img src="/resources/img/hotplace/next_icon.png" width=65/></button>
         <div id="readcontent" style="display:inline-block; position:relative; width:100%; height:790px;">
         	<div style="display:inline-block; position:absolute; left:70px; bottom:5px; border-radius:5px 5px 5px 5px;">
				<span id="top_x_div" style="float:left;"></span>
				<span id="donutchart" style="float:left;"></span>
         	</div>
            <div id="map" style="width:800px; height:320px; position:absolute; top:55px; left:10px; border-radius:5px 5px 5px 5px;"></div>
            <div>
	            <button style="background:none; outline:none; z-index:10002; border:none; position:absolute; right:395px; top:195px; cursor:pointer;"><img src="/resources/img/hotplace/prev_icon2.png" width=30 /></button>
	            <div id="likeuserlist" style="position:absolute; top:55px; right:27px; height:320px; width:380px; padding-left:10px; padding-top:54px; border-radius:5px 5px 5px 5px; border:0.5px solid #e9e9e9;"></div>
	            <button style="background:none; outline:none; border:none; position:absolute; right:8px; top:195px; cursor:pointer;"><img src="/resources/img/hotplace/next_icon2.png" width=30 /></button>
            </div>
            <img src="/resources/img/hotplace/1.png" width=220 style="position:absolute; left:10px; top:8px;"/>
            <img src="/resources/img/hotplace/2.png" width=222 style="position:absolute; right:188px; top:8px;"/>
            <img src="/resources/img/hotplace/3.png" width=220 style="position:absolute; left:10px; top:51%;"/>
         </div>
      </div>
   </div>
</body>
<script>

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
            	if(data[i].u_image==null || data[i].u_image==""){
            		if(data[i].u_gender=='male'){
            			html += "<span><img class='userimages' src='/resources/img/user/profileM.png'/></span>";
            		}else{
            			html += "<span><img class='userimages' src='/resources/img/user/profileF.png'/></span>";
            		}
            		
            	}else{
            		html += "<span><img class='userimages' src='/hotplace/userdisplay?fileName="+data[i].u_image+"'/></span>";	
            	}
                
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
                  width : 270,
                  height : 270,
                  pieHole : 0.4,
                  legend : {
                     position : 'none'
                  },
                  chart : {
                     title : '',
                     subtitle : ''
                  },
                  bar : {
                     groupWidth : "80%"
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
                  width : 600,
                  height : 300,
                  pieHole : 0.4
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