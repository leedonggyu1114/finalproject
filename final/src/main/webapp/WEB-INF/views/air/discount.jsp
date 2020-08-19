<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
   <h1>땡처리</h1>
   <table>
      <tr>
         <td>항공편</td>
         <td>항공사</td>
         <td>출발지</td>
         <td>도착지</td>
         <td>출발시간</td>
         <td>도착시간</td>
         <td>운행시간</td>
         <td>가격</td>
         <td>남은자리</td>
         <td>예약인원</td>
         <td>바로가기</td>
      </tr>
      <c:forEach items="${list }" var="vo">
         <tr class="row">
            <td class="a_number">${vo.a_number }</td>
            <td>${vo.a_company }</td>
            <td>${vo.a_startplace }</td>
            <td>${vo.a_endplace }</td>
            <td>${vo.a_starttime }</td>
            <td>${vo.a_endtime }</td>
            <td>${vo.a_runtime }</td>
            <td>${vo.a_price/2 }</td>
            <td>${vo.a_emptyseat }</td>
            <td><input type="text" class="a_emptyseat" placeholder="인원선택" size="4" ></td>
            <td><input type="button" value="바로결제하기" id="paybtn"></td>
         </tr>
      </c:forEach>   
      </table>
      <div id="reserver">
         <div class="aircount1">
            <h5>인원</h5>
            <div class="aircount_row">
               <div class="row" style="">
                     <span class="age">성인</span> 
                     <input type="button" value="-" class="peopleSubtract"> 
                     <input type="text" value="1" size="1" class="people"> 
                     <input type="button" value="+" class="peoplePlus">
               </div>
               <div class="row">
                  <span class="age">청소년/어린이</span> 
                  <input type="button" value="-" class="childSubtract"> 
                  <input type="text" value="0" readonly size="1" class="child"> 
                  <input type="button" value="+" class="childPlus">
               </div>
               <div>
                  <input type="button" id="btn" value="선택완료">
               </div>
            </div>
         </div>
      </div>
</body>
<script>

   var people = 1;
   var child = 0;
   var discountsum;
   
   $(".aircount1").hide();
   //인원선택
   $(".a_emptyseat").on("click", function() {
      discountsum=$(this);
      $(".aircount1").show();
   });
   //성인-
   $("#reserver").on("click", ".peopleSubtract", function() {
      if (people == 0) {

      } else if (people > 1) {
         people = people - 1;
         $(".people").val(people);
      }
   });
   //성인+
   $("#reserver").on("click", ".row .peoplePlus", function() {
      people = people + 1;
      $(".people").val(people);
   });
   //청소년-
   $("#reserver").on("click", ".childSubtract", function() {
      if (child == 0) {

      } else if (child > 0) {
         child = child - 1;
         $(".child").val(child);
      }
   });
   //청소년+
   $("#reserver").on("click", ".row .childPlus", function() {
      child++;
      $(".child").val(child);
   });
   //선택완료시 성인 청소년 넣기 
   $("#btn").on("click", function() {
      discountsum.val(people + "," + child);
      $(".aircount1").hide();
   });
   $("#paybtn").on("click",function(){
      var row=$(this).parent().parent();
      var a_number=row.find(".a_number").html();
      var sum=parseInt(people)+parseInt(child);
      if(sum == ""){
         alert("탑승객 인원을 선택해주세요");
      }else{
         location.href="/air/bookingPeople?a_number="+a_number+"&sum="+sum;
      }
   });
</script>
</html>