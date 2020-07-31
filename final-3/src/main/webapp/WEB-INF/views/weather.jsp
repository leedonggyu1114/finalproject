<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="daum">
		<span id="today"></span> <span id="weather"></span>
	</div>
</body>
<script>
	getWeather();

	//배열선언
	var weather = [];

	function getWeather() {
		$.ajax({
			type : "get",
			url : "/weather.json",
			dataType : "json",
			success : function(data) {
				$("#today").html(data.date);
				var i = 0;
				$(data.array).each(function() {
					var area = this.area;
					var icon = this.icon;
					var temper = this.temper;
					//console.log(area + icon + temper);
					var wa = this.wa;
					weather[i] = area + " " + icon + " " + temper + wa
					i++;
				});
				i = 0;
				// 1초간격으로 function을 실행하겠다
				var interval = setInterval(function() {
					$("#weather").html(weather[i]);
					if (i < weather.length - 1) {
						i++;
					} else {
						i = 0;
					}
				}, 1500)
			}
		});
	}
</script>
</html>