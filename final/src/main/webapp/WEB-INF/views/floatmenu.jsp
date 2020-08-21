<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#floatMenu {
	position: absolute;
	width: 110px;
	height: 150px;
	left: 140px;
	top: 300px;
	border-radius:6px 6px 6px 6px;
}
#floatMenu #background {
	border-radius:5px;
}
#kakao-talk-channel-chat-button {
	position:absolute;
	bottom:10px;
	left:50%;
	transform:translate(-50%,0);
}
</style>
</head>
<body>
<div id="floatMenu">
	<img src="/resources/img/kakaofloat.png" id="background"/>
	<div id="kakao-talk-channel-chat-button"></div>
</div>
</body>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('44c4398b724d06191dbaf99c087795b1');
	// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
	Kakao.Channel.createChatButton({
	   container : '#kakao-talk-channel-chat-button',
	   channelPublicId : '_dqyqK' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
	});
	//]]>
</script>
<script>
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});

$("#floatMenu").stop().animate({
	"top" : newPosition
}, {
	'duration' : 500,
	'easing' : 'easeInOutCubic',
	'complete' : function() {
		console.log('이동 완료하였습니다.');
	}
});
</script>

</html>