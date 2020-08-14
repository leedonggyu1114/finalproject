<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<style>
#admin_menu_area {
	width: 1300px;
	background: #0f4c81;
	height: 100px;
	text-align: center;
	z-index: 10;
	position:relative;
	left:50%;
	transform:translate(-50%,0);
	border-radius:0px 0px 10px 10px;
}
#main_menu, #sub_menu {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
#main_menu>li {
	display: block;
	float: left;
	width: 180px;
	height:100px;
	margin-right:10px;
}
#main_menu>li:nth-child(1) {
	margin-left: 23%;
}

#main_menu>li>a {
	display: block;
	text-align: center;
	text-decoration: none;
	color: black;
	vertical-align:middle;
	padding-top:39.5px;
	padding-bottom:39px;
	color:white;
}

#sub_menu {
	display:none;
	position: absolute;
	background: white;
	opacity: 0;
	transition: all 0.5s;
}

#sub_menu>li {
	width: 180px;
	height: 50px;
	cursor:pointer;
	background:#0f4c81;
}

#sub_menu>li>a {
	display:inline-block;
	padding: 14px 15px 14px 15px;
	width:150px;
	height:22px;
	text-decoration: none;
	color: white;
}

#main_menu>li:hover #sub_menu {
	display:block;
	opacity: 1;
	z-index: 10;
}

#sub_menu>li>a:hover {
	background:white;
	opacity:0.3;
	color:black;
}
</style>
<div id="admin_menu_area">
	<ul id="main_menu">
		<li><a href="">유저관리</a>
			<ul id="sub_menu">
				<li><a href="/admin/userlist">USER LIST</a></li>
				<li><a href="/admin/blacklist">BLACK LIST</a></li>
				<li><a href="/admin/userreport">REPORT</a></li>
			</ul>
		</li>
		<li><a href="">숙소관리</a>
			<ul id="sub_menu">
				<li><a href="/admin/staylist">LIST</a></li>
				<li><a href="/admin/stayrequest">요청승인</a></li>
			</ul>
		</li>
		<li><a href="/admin/chat">채팅</a></li>
		<li><a href="">명소관리</a>
			<ul id="sub_menu">
				<li><a href="/admin/hotplace_list">LIST</a></li>
				<li><a href="/admin/hotplace_insert">INSERT</a></li>
			</ul>
		</li>
	</ul>
</div>
<script>
</script>