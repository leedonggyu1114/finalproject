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
#likelist-area {
	position: relative;
	overflow:hidden;
	padding-bottom:60px;
}

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
	height: 1300px;
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
	top: 48%;
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

.div_hotplace_list {
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

.hotplace_like {
	position: absolute;
	right: 40px;
	top: 40px;
	bottom: 50%;
	cursor: pointer;
}

#btnprev, #btnnext {
	border: none;
	outline: none;
	background: none;
	cursor: pointer;
}

#btnprev {
	position: absolute;
	left: 5px;
	top: 22%;
}

#btnnext {
	position: absolute;
	right: 5px;
	top: 22%;
}

.userimages {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	float: left;
	margin-left: 5px;
}
</style>
</head>
<body>
   <jsp:include page="../sidebar.jsp"/>
   <div id="page">
      <div id="header"><jsp:include page="../header.jsp" /></div>
      <div id="menu"><jsp:include page="../menu.jsp" /></div>
      <div id="container">
         <!-- 여행추천list시작 -->
         <div id="likelist-area">
           	<div style="margin-top:38px; margin-bottom:18px;"><img src="/resources/img/hotplace/likelist_title.png" width=320 style="position:relative; left:50%; transform:translate(-50%,0);"/></div>
            <c:forEach items="${likelist }" var="vo">
               <figure style="float: left" class="div_hotplace_list">
                  <div style="width:250px;height:330px; border:0.5px solid gray; float:left; margin:25px; border-radius:0px 8px 8px 8px; cursor:pointer;">
                     <img class="mainimage" src="/hotplace/display?fileName=${vo.h_i_images[0]}" 
                     width=100% height=200 x="${vo.h_x }" y="${vo.h_y }" title="${vo.h_title }"
                     address="${vo.h_address}" detail="${vo.h_detail}" style="border-radius:0px 8px 0px 0px;"/>
                     <h3 style="margin:5px 0px 0px 5px; display:inline-block;">${vo.h_title }</h3>
                     <img src="/resources/img/hotplace/like_hover.png" class="hotplace_like" />
                     <div style="margin:20px 5px 0px 5px;">${vo.h_detail }</div>
                  </div>
               </figure>
            </c:forEach>
         </div>
         <!-- 여행추천list끝 -->
      </div>
      <div id="footer"><jsp:include page="../footer.jsp" /></div>
   </div>
   <jsp:include page="read(lightbox).jsp" />
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
</script>
</html>