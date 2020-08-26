<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>여행의 설렘 TOURSUM !</title>
   <link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/title_logo.png">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
   <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css"/>
</head>
<body>

   <div id="page">
      <div id="container">
         <div id="div_container_area1"> <!-- 퀵검색, 테마 -->
            <div id="div_container_quick">
               <div><p>고객님,<br><strong>어떤 여행을 꿈꾸시나요?</strong></p></div>
               <div class="tapmenu">
                  <ul class="tabs">
                     <li class="tab-link current" data-tab="tab-1">항공</li>
                     <li class="tab-link" data-tab="tab-2">숙박</li>
                  </ul>
                  <div id="tab-1" class="tab-content current">
                     <ul class="tabs2">
                        <li class="tab-link2 current2" data-tab="tab-3">편도</li>
                        <li class="tab-link2" data-tab="tab-4">왕복</li>
                     </ul>
                     <div id="tab-3" class="tab-content2 current2">
                        <input type="text" placeholder="지역입력"><br>
                        <input type="text" class="date" placeholder="가는날">
                     </div>
                     <div id="tab-4" class="tab-content2">
                        <input type="text" placeholder="지역입력"><br>
                        <input type="text" class="date" placeholder="가는날">
                        <img src="/resources/img/container/container_icon.png">
                        <input type="text" class="date" placeholder="오는날">
                     </div>
                  </div>
                  <div id="tab-2" class="tab-content">
                     
                  </div>
               </div>
            </div>
            <div id="div_container_tema">
               <div></div>
            </div>
         </div>
         <div id="div_container_area2"> <!-- 회원별 추천여행 -->
            
         </div>
         <div id="div_container_area3"> <!-- 땡처리 -->
         
         </div>
         <div id="div_container_area4"> <!-- 숙소 예약,결제많은순 -->
         
         </div>
      </div>
   </div>
</body>
<script>
   $('ul.tabs li').click(function() {
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');

      $(this).addClass('current');
      $("#" + tab_id).addClass('current');
   })
   
   $('ul.tabs2 li').click(function() {
      var tab_id = $(this).attr('data-tab');
      
      $('ul.tabs2 li').removeClass('current2');
      $('.tab-content2').removeClass('current2');
      
      $(this).addClass('current2');
      $("#" + tab_id).addClass('current2');
   })
   
   $(".date").datepicker({
   });
</script>
</html>