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
#hotplace_tag {
	height:49px;
	padding:10px 0px 10px 0px;
}
#hotplace_tag button {
	border:none;
	outline:none;
	cursor:pointer;
	border-radius:8px 8px 8px 8px;
	padding:5px;
	margin-right:5px;
}
</style>
</head>
<body>
   <jsp:include page="../sidebar.jsp"/>
   <button type="button" name="button" class="ac-sub-go-top" style="cursor:pointer;">위로</button>
   <div id="page">
      <div id="header"><jsp:include page="../header.jsp"/></div>
      <div id="menu"><jsp:include page="../menu.jsp"/></div>
      <div id="container">

         <div id="hotplace_tag">
         	<button tag="">#ALL</button>
         	<button tag="01">#힐링</button>
         	<button tag="02">#헬스케어</button>
         	<button tag="03">#익사이팅</button>
         	<button tag="04">#나홀로여행</button>
         	<button tag="05">#가족과함께</button>
         	<button tag="06">#연인과함께</button>
         	<button tag="07">#친구와함께</button>
         	<button tag="08">#먹방</button>
         	<button tag="10">#도심속여행</button>
         	<button tag="11">#나만아는</button>
         	<button tag="12">#야경</button>
         	<button tag="13">#교육</button>
         </div>
         <!-- 여행추천list시작 -->
         <div id="divlist">
            <c:forEach items="${list }" var="vo">
               <figure style="float: left" class="div_hotplace_list">
                  <img class="mainimage"
                     src="/hotplace/display?fileName=${vo.h_i_images[0]}" width=300
                     height=300 x="${vo.h_x }" y="${vo.h_y }" title="${vo.h_title }"
                     address="${vo.h_address }" detail="${vo.h_detail }" tag1="${vo.h_tag1 }" tag2="${vo.h_tag2 }"/>
                  <figcaption class="div_hotplace_maintitle">
                     <h3>${vo.h_title }</h3>
                     <img src="/resources/img/hotplace/like.png" class="hotplace_like" />
                  </figcaption>
               </figure>
            </c:forEach>
         </div>
         <script id="temp" type="text/x-handlebars-template">
        {{#each .}}
			<figure style="float: left" class="div_hotplace_list">
				<img class="mainimage"
					src="/hotplace/display?fileName={{h_image}}" width=300
					height=300 x="{{h_x}}" y="{{h_y}}" title="{{h_title}}"
					address="{{h_address}}" detail="{{h_detail}}"
					tag1="{{h_tag1}}" tag2="{{h_tag2}}" />
				<figcaption class="div_hotplace_maintitle">
					<h3>{{h_title}}</h3>
					<img src="/resources/img/hotplace/like.png" class="hotplace_like" />
				</figcaption>
			</figure>
		{{/each}}
		</script>
         <!-- 여행추천list끝 -->
      </div>
      <div id="footer"><jsp:include page="../footer.jsp"/></div>
   </div>

   <jsp:include page="read(lightbox).jsp"/>
</body>
<script>
   var x;
   var y;
   var u_id="${u_id}";
   var u_k_id="${u_k_id}";
   
  


 	//tag리스트 출력
 	$("#hotplace_tag").on("click", "button", function() {
 		var tag = $(this).attr("tag");
 		$.ajax({
 			type : "get",
 			url : "taglist",
 			dataType : "json",
 			data : {
 				"h_tag" : tag
 			},
 			success : function(data) {
 				var template = Handlebars.compile($("#temp").html());
 				$("#divlist").html(template(data));
				setlikelist();
 			}
 		});
 	});
   
   
	// top 스크롤
	$(window).scroll(function() {
		var quickHeight = $(document).scrollTop(); //스크롤 높이가 500 이상이면 나타나기
		if (500 <= quickHeight) {
			$('.ac-sub-go-top').css('display', 'block');
		} else {
			$('.ac-sub-go-top').css('display', 'none');
		}
	});

	$('.ac-sub-go-top').click(function() {//위로가기 버튼을 클릭했을때
		$('html, body').animate({
			scrollTop : '0'
		}, 800);
	});

   
   //좋아요 출력하기
   setlikelist();
   function setlikelist(){
      
      $.ajax({
         type:"get",
         url:"likeset",
         dataType:"json",
         data:{"u_id":u_id,"u_k_id":u_k_id},
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
	$("#divlist").on("click",".hotplace_like", function(e) {
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
            data:{"u_id":u_id,"u_k_id":u_k_id},
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
                     data:{"h_x":x,"h_y":y,"u_id":u_id,"u_k_id":u_k_id},
                     success:function(){
                        $(like).attr('src', '/resources/img/hotplace/like_hover.png');
                     }
                  });
               }else{
                  $.ajax({
                     type:"post",
                     url:"likedelete",
                     data:{"h_x":x,"h_y":y,"u_id":u_id,"u_k_id":u_k_id},
                     success:function(){
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