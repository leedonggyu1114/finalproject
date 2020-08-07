<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<style>
.sidebar button {
	outline: none;
	cursor:pointer;
}

.sidebar button .sidebar-btn {
	color: #fff;
	font-weight: bold;
}

.sidebar {
	background-color: #222;
	width: 400px;
	height: 100%;
	position: fixed;
	top: 0;
	right: -400px;
	z-index: 9999;
}

.sidebar>.sidebar-content {
	color: #fff;
	width: 100%;
	height: 100%;
}

.sidebar button {
	background-color: #222;
	display: block;
	position: absolute;
	top: 200px;
	right: 400px;
	width: 45px;
	height: 45px;
	line-height: 38px;
	text-align: center;
	margin: 0;
	padding: 0;
	border: none;
	border-radius: 5px 0px 0px 5px;
}

.sidebar img {
	margin-top: 6px;
}

.sidebar h1 {
	text-align: left;
	margin-left: 15px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-content">
			<h1>CART</h1>
		</div>
		<button>
			<span class="sidebar-btn"><img src="/resources/img/sidebar_icon.png" width=30></span>
		</button>
	</aside>
</body>
<script>
	// 사이드바
	$(function() {
		var duration = 300;

		var $sidebar = $('.sidebar');
		var $sidebarButton = $sidebar.find('button').on('click', function() {
			$sidebar.toggleClass('open');
			if ($sidebar.hasClass('open')) {
				$sidebar.stop(true).animate({
					right : '-70px'
				}, duration, 'easeOutBack');
			} else {
				$sidebar.stop(true).animate({
					right : '-400px'
				}, duration, 'easeInBack');
			}
			;
		});
	});
</script>
</html>