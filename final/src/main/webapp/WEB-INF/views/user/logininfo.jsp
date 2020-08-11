<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인인포</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <!-- 세션에서 token을 가져와서 출력한다. -->
    ${sessionScope.token}
     <a href="https://kauth.kakao.com/oauth/logout?client_id=44c4398b724d06191dbaf99c087795b1&logout_redirect_uri=http://localhost:8088/user/login">로그아웃</a>
</body>
<script>

</script>
</html>

