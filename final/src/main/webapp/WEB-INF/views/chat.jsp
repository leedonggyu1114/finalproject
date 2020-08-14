<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<style>
#kakao-talk-channel-chat-button {
	position:fixed;
	bottom:15px;
	right:75px;
}
</style>
</head>
<body>
	<div id="kakao-talk-channel-chat-button"></div>
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
</html>