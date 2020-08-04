<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>여행의 설렘 TOURSUM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</title>
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

.div_hotplace_list>.mainimage {
   width: 100%;
   transition: transform 0.5s;
}

.div_hotplace_list:hover .mainimage {
   transform: translate(0%, 0%) scale(1.1);
}

.div_hotplace_maintitle h3{
   color:white;
   font-size:17px;
   font-weight:normal;
   text-align:center;
}

.hotplace_like {
   position:absolute;
   left:50%;
   transform: translate(-50%,0);
   bottom:50%;
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
   <jsp:include page="../sidebar.jsp"/>
   <div id="page">
      <div id="header"><jsp:include page="../header.jsp"/></div>
      <div id="menu"><jsp:include page="../menu.jsp"/></div>
      <div id="container">
         <div style="height:100px"></div>
         <!-- 여행추천list시작 -->
			<div>
				<c:forEach items="${list }" var="vo">
					<figure style="float: left" class="div_hotplace_list">
						<img class="mainimage"
							src="/hotplace/display?fileName=${vo.h_i_images[0]}" width=300
							height=300 x="${vo.h_x }" y="${vo.h_y }" title="${vo.h_title }"
							address="${vo.h_address }" detail="${vo.h_detail }" />
						<figcaption class="div_hotplace_maintitle">
							<h3>${vo.h_title }</h3>
							<img src="/resources/img/hotplace/like.png" class="hotplace_like" />
						</figcaption>
					</figure>
				</c:forEach>
			</div>
			<!-- 여행추천list끝 -->
      </div>

      <div id="footer"><jsp:include page="../footer.jsp"/></div>
   </div>
   <jsp:include page="read(lightbox).jsp"></jsp:include>
</body>
<script>
 
	var x;
	var y;
	var u_id="${u_id}";
	var address;
	var detail;
	var imagepage=0;
	var images=[];
	
	
		
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
	
	//좋아요 출력하기
	setlikelist();
	function setlikelist(){
		
		$.ajax({
			type:"get",
			url:"likeset",
			dataType:"json",
			data:{"u_id":u_id},
			success:function(data){
				var likeset=[];
				for(var i=0; i<data.length; i++){
					likeset.push(data[i]);
				}
				
				$(".mainimage").each(function(){
					var like=$(this);
					var check=true;
					var c_x=$(this).attr("x");
					var c_y=$(this).attr("y");
					for(var i=0; i<likeset.length; i++){
						if(likeset[i].h_x==c_x && likeset[i].h_y==c_y){
							check=false;
						}
					}
					if(check==false){
						$(like).parent().find(".div_hotplace_maintitle .hotplace_like").attr("src", "/resources/img/hotplace/like_hover.png");
					}
				});
				
			}
		});
	}
	
		

	
	
	//좋아요누르기
	$(".hotplace_like").on("click", function(e) {
		e.stopPropagation();
		var like=$(this);
		
		if(u_id==""){
			alert("로그인이 필요한 서비스 입니다");
		}else{
			
			x=$(this).parent().parent().find(".mainimage").attr("x");
			y=$(this).parent().parent().find(".mainimage").attr("y");
			
			$.ajax({
				type:"get",
				url:"likeset",
				dataType:"json",
				data:{"u_id":u_id},
				success:function(data){
					var check=true;
					if(check){
						for(var i=0; i<data.length; i++){
							if(data[i].h_x==x && data[i].h_y==y){
								check=false;
							}
						}
					}
					
					if(check==true){
						$.ajax({
							type:"post",
							url:"likeinsert",
							data:{"h_x":x,"h_y":y,"u_id":u_id},
							success:function(){
								alert("insert");
								$(like).attr('src', '/resources/img/hotplace/like_hover.png');
							}
						});
					}else{
						$.ajax({
							type:"post",
							url:"likedelete",
							data:{"h_x":x,"h_y":y,"u_id":u_id},
							success:function(){
								alert("delete");
								$(like).attr('src', '/resources/img/hotplace/like.png');
							}
						});
					}
						
				}
				
			});
	
		}
		
	});
	
</script>
</html>