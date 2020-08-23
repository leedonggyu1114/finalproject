<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" />
</head>
<style>
#darken-background {
   position: fixed;
   top: 50%;
   left: 50%;
   transform:translate(-50%,-50%);
   width:100%;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}

#lightbox {
   width: 1000px;
   height: 1000px;
   margin: auto;
   border: 1px solid #333333;
   margin-top:30px;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
   position: relative;
   padding:20px 10px 10px 10px;
}

#btnClose {
	position:absolute;
	top:10px;
	right:-50px;	
	cursor:pointer;
	background:none;
	outline:none;
	border:none;
}

#tbl2 {
	border-top:1px solid #e9e9e9;
	border-bottom:1px solid #e9e9e9;
	margin-top:20px;
	margin-bottom:15px;
}

#div_star img {
	width:148px;
}

#div_star {
	position:absolute;
	top:478px;
	left:310px;
}

#div_option {
	display:inline-block;
	width:237.04px;
	float:left;
}

#roptionB {
	display:inline-block;
	width:740.74px;
	float:left;
	text-align:left;
	padding-left:22px;
}

#roptionB img {
	width:148px;
}

</style>
<body>
	<jsp:include page="../floatmenu.jsp"/>
	<jsp:include page="../sidebar.jsp"/>
	<div id="page">
		<div id="header"><jsp:include page="../header.jsp" /></div>
		<div id="menu"><jsp:include page="../menu.jsp" /></div>
		<div id="container">
			<div id="hotelread_area">
				<h1>Hotel read</h1>
				<table id="tbl"></table>
				<script id="temp" type="text/x-handlebars-template">
				{{#each .}}
				<tr>
					<td><img src="/company/hoteldisplay?fileName={{c_image}}" id="image" width=150></td>
					<td>{{r}}</td>
					<td>{{c_address}}</td>
					<td>{{c_name}}</td>
					<td>{{c_grade}}</td>
					<td>{{c_tel}}</td>
				</tr>		
				{{/each}}
				</script>
				
				<h1>호텔의 룸 리스트</h1>
				<table id="tbl1" width=700></table>
				<script id="temp1" type="text/x-handlebars-template">
				{{#each .}}
				<tr class="row">
					<td class="roomnum">{{r_roomnum}}</td>S
					<td>{{r_title}}</td>
					<td>{{r_persons}}</td>
					<td>{{r_price}}</td>
					<td>{{r_grade}}</td>
				</tr>
				{{/each}} 
				</script>
			</div>
			<div id="darken-background">
				<div id="lightbox">
					<div>
						<img src="http://placehold.it/500x350" id="repimage" Style="width: 500px; height: 350px;">
					</div>
					<div id="images"></div>
					
					<script id="temp3" type="text/x-handlebars-template">
					{{#each image}}
						<span><img src="/displayRoom?fileName={{r_i_images}}" Style="width:100px;height:70px;"></span>
					{{/each}}	
					</script>
					<table id="tbl2">
						<tr height=40>
							<td width=238 rowspan=3 style="padding-bottom:145px;">객실 정보</td>
							<td style="padding-left:22px; text-align:left; padding-top:10px;">평점</td>
						</tr>
						<tr>	
							<td width=742 style="text-align:left; padding-left:22px;">
								<span id="title1" style="font-size:30px; font-weight:bold;"></span> <span style="color:gray;">(<span id="roomnum1"></span>호)</span><br>
								<span style="color:gray; display:inline-block; margin-top:10px;">최대 인원 수 / <span id="persons1"></span></span><br>
								<span style="display:inline-block; color:gray; margin-top:10px;"><span id="price1"> </span>원</span>
							</td>
						</tr>
						<tr>
							<td height=50 style="text-align:left; padding-left:22px;">상세 설명 : <span id="detail1"></span></td>
						</tr>
					</table>
					<div id="div_star">
						<span id="star1"><img src="/resources/img/star/star0.png"></span> 
						<span id="star2"><img src="/resources/img/star/star05.png"></span> 
						<span id="star3"><img src="/resources/img/star/star10.png"></span> 
						<span id="star4"><img src="/resources/img/star/star15.png"></span> 
						<span id="star5"><img src="/resources/img/star/star20.png"></span> 
						<span id="star6"><img src="/resources/img/star/star25.png"></span> 
						<span id="star7"><img src="/resources/img/star/star30.png"></span> 
						<span id="star8"><img src="/resources/img/star/star35.png"></span> 
						<span id="star9"><img src="/resources/img/star/star40.png"></span> 
						<span id="star10"><img src="/resources/img/star/star45.png"></span> 
						<span id="star11"><img src="/resources/img/star/star50.png"></span>
					</div>
					<div id="div_option">옵션</div>
					<div id="roptionB">
						<span id="roption1">
							<input type="checkbox" id="Rr_option1" name="r_o_option1" value="01"> 
							<label for="Rr_option1" id="tag1">
								<img src="/resources/img/roomoption/Roption_coffemaker_icon2.png">
							</label>
							<label for="Rr_option1" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_coffemaker_icon_hover.png">
							</label>
						</span> 
						<span id="roption2"> 
							<input type="checkbox" id="Rr_option2" name="r_o_option1" value="02"> 
							<label for="Rr_option2" id="tag1">
								<img src="/resources/img/roomoption/Roption_ketchen_icon2.png">
							</label>
							<label for="Rr_option2" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_ketchen_icon_hover.png">
							</label>
						</span> <br>
						<span id="roption3"> 
							<input type="checkbox" id="Rr_option3" name="r_o_option1" value="03"> 
							<label for="Rr_option3" id="tag1">
								<img src="/resources/img/roomoption/Roption_shampoo_icon2.png">
							</label>
							<label for="Rr_option3" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_shampoo_icon_hover.png">
							</label>
						</span> 
						<span id="roption4"> 
							<input type="checkbox" id="Rr_option4" name="r_o_option1" value="04"> 
							<label for="Rr_option4" id="tag1">
								<img src="/resources/img/roomoption/Roption_Bathtub_icon2.png">
							</label>
							<label for="Rr_option4" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_Bathtub_icon_hover.png">
							</label>
						</span> <br>
						<span id="roption5"> 
							<input type="checkbox" id="Rr_option5" name="r_o_option1" value="05"> 
							<label for="Rr_option5" id="tag1">
								<img src="/resources/img/roomoption/Roption_airconditioner_icon2.png">
							</label>
							<label for="Rr_option5" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_airconditioner_icon_hover.png">
							</label>
						</span> 
						<span id="roption6"> 
							<input type="checkbox" id="Rr_option6" name="r_o_option1" value="06"> 
							<label for="Rr_option6" id="tag1">
								<img src="/resources/img/roomoption/Roption_safebox_icon2.png"></label>
							<label for="Rr_option6" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_safebox_icon_hover.png">
							</label>
						</span> <br>
						<span id="roption7"> 
							<input type="checkbox" id="Rr_option7" name="r_o_option1" value="07"> 
							<label for="Rr_option7" id="tag1">
								<img src="/resources/img/roomoption/Roption_minibar_icon2.png">
							</label>
							<label for="Rr_option7" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_minibar_icon_hover.png">
							</label>
						</span> 
						<span id="roption8"> 
							<input type="checkbox" id="Rr_option8" name="r_o_option1" value="08"> 
							<label for="Rr_option8" id="tag1">
								<img src="/resources/img/roomoption/Roption_wifi_icon2.png"></label> 
							<label for="Rr_option8" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_wifi_icon_hover.png">
							</label>
						</span> <br>
						<span id="roption9"> 
							<input type="checkbox" id="Rr_option9" name="r_o_option1" value="09"> 
							<label for="Rr_option9" id="tag1">
								<img src="/resources/img/roomoption/Roption_tv_icon2.png"></label> 
							<label for="Rr_option9" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_tv_icon_hover.png">
							</label>
						</span> 
						<span id="roption10"> 
							<input type="checkbox" id="Rr_option10" name="r_o_option1" value="10"> 
							<label for="Rr_option10" id="tag1">
								<img src="/resources/img/roomoption/Roption_computer_icon2.png">
							</label>
							<label for="Rr_option10" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_computer_icon_hover.png">
							</label>
						</span> <br>
						<span id="roption11"> 
							<input type="checkbox" id="Rr_option11" name="r_o_option1" value="11"> 
							<label for="Rr_option11" id="tag1">
								<img src="/resources/img/roomoption/Roption_refrigerator_icon2.png">
							</label>
							<label for="Rr_option11" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_refrigerator_icon_hover.png">
							</label>
						</span> 
						<span id="roption12"> 
							<input type="checkbox" id="Rr_option12" name="r_o_option1" value="12"> 
							<label for="Rr_option12" id="tag1">
								<img src="/resources/img/roomoption/Roption_hairdryer_icon2.png">
							</label>
							<label for="Rr_option12" id="tag1-1" style="display: none;">
								<img src="/resources/img/roomoption/Roption_hairdryer_icon_hover.png">
							</label>
						</span>
					</div>
					<button id="btnClose">
						<img src="/resources/img/hotplace/close_icon2.png" width=30 />
					</button>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>		
</body>
<script>
var c_id="${c_id}";
roomlist();
$("#star1").hide();$("#star3").hide();$("#star5").hide();$("#star7").hide();$("#star9").hide();
$("#star2").hide();$("#star4").hide();$("#star6").hide();$("#star8").hide();$("#star10").hide();$("#star11").hide();
$(":checkbox").css("display","none");
$("#darken-background").hide();
$("input:checkbox[name='r_o_option1']").prop("checked", false);

$("input[name=r_o_option1]").on("click",function(){
	var tag1=$(this).parent().find("#tag1");
	var tag2=$(this).parent().find("#tag1-1");
	
	if($(this).is(":checked")==true){
		tag1.css("display","none");
		tag2.css("display","inline-block");
	}else{
		tag1.css("display","inline-block");
		tag2.css("display","none");
	}
});


$("#tbl1").on("click", ".row", function() {
	$("#darken-background").css("display", "block"); //팝업 뒷배경 display block
	$("#lightbox").css("display", "block"); //팝업창 display block
	$("body").css("overflow", "hidden");//body 스크롤바 없애기

});
$("#btnClose").on("click", function(event) {
	$("#darken-background").css("display", "none"); //팝업창 뒷배경 display none
	$("#lightbox").css("display", "none"); //팝업창 display none
	$("body").css("overflow", "auto");//body 스크롤바 생성
});


$.ajax({
	type:"post",
	url:"/stay/read",
	data:{"c_id":c_id},
	success:function(data){
		var temp=Handlebars.compile($("#temp").html());
		 $("#tbl").html(temp(data));
	}
});

$("#tbl1").on("click", ".row", function() {
	$("input[name=r_o_option1]").prop("checked",false);
	$("input[name=r_o_option1]").parent().find("#tag1").css("display","inline-block");
	$("input[name=r_o_option1]").parent().find("#tag1-1").css("display","none");

	$("#star1").hide();$("#star3").hide();$("#star5").hide();$("#star7").hide();$("#star9").hide();
	$("#star2").hide();$("#star4").hide();$("#star6").hide();$("#star8").hide();$("#star10").hide();$("#star11").hide();
	var r_i_roomnum=$(this).find(".roomnum").html();
	var r_i_id="${c_id}";
	$.ajax({
		type:"get",
		url:"/company/getroomread",
		data:{"r_i_id":r_i_id,"r_i_roomnum":r_i_roomnum},
		success:function(data){
			var temp=Handlebars.compile($("#temp3").html());
			 $("#images").html(temp(data));
			 $("#roomnum1").html(data.read.r_roomnum);
			 $("#title1").html(data.read.r_title);
			 $("#persons1").html(data.read.r_persons);
			 $("#price1").html(data.read.r_price);
			 $("#roomnum1").html(data.read.r_roomnum);
			 $("#detail1").html(data.read.r_detail);
			 $("#repimage").attr("src", "/displayRoom?fileName="+data.read.r_image);
			 if(data.read.r_grade==0){
				 $("#star1").show();
			 }else if(0<data.read.r_grade && data.read.r_grade<=0.5){
				 $("#star2").show();
			 }else if(0.5<data.read.r_grade && data.read.r_grade<=1){
				 $("#star3").show();
			 }else if(1<data.read.r_grade && data.read.r_grade<=1.5){
				 $("#star4").show();
			 }else if(1.5<data.read.r_grade && data.read.r_grade<=2){
				 $("#star5").show();
			 }else if(2<data.read.r_grade && data.read.r_grade<=2.5){
				 $("#star6").show();
			 }else if(2.5<data.read.r_grade && data.read.r_grade<=3){
				 $("#star7").show();
			 }else if(3<data.read.r_grade && data.read.r_grade<=3.5){
				 $("#star8").show();
			 }else if(3.5<data.read.r_grade && data.read.r_grade<=4){
				 $("#star9").show();
			 }else if(4<data.read.r_grade && data.read.r_grade<=4.5){
				 $("#star10").show();
			 }else if(4.5<data.read.r_grade && data.read.r_grade<=5){
				 $("#star11").show();
			 }
			//룸 옵션 읽기	
				var option1=[];
				    $.each(data.option, function(index, option){
					  	option1.push(option.r_o_option);
				   });
				    $("input[name=r_o_option1]").each(function(index, item){
				    	for(var i=0; i<option1.length; i++){
					    	if($(this).val()==option1[i]){
					    		var tag1=$(this).parent().find("#tag1");
								var tag2=$(this).parent().find("#tag1-1");
								
								tag1.css("display","none");
								tag2.css("display","inline-block");
					    		$(this).prop("checked",true);
					    	}
				    	}
				    });
		}
	});
});

function roomlist(){
    $.ajax({
       type:"get",
       url:"/company/roomlist",
       data:{"c_id":c_id},
       dataType:"json",
       success:function(data){
          var template = Handlebars.compile($("#temp1").html());
             $("#tbl1").html(template(data));
       }
    });
 }

</script>
</html>