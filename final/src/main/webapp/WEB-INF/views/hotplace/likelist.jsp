<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>여행의 설렘 TOURSUM !</title>
   <link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=593e08eb668b13510d3ab2e0c94c93a7&libraries=services"></script> -->
   <style>
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
                     <h3 style="margin:5px 0px 0px 5px; display:inline-block; font-family:'DX영화자막';">${vo.h_title }</h3>
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
   
</script>
</html>