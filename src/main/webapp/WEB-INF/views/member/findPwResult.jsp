<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../page/header.jsp" />
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<h2 align="center">비밀번호찾기 완료</h2>
		<div class="span12" align="center">
			임시비밀번호는 ${m_pw }입니다!<br>
			<a href="login">로그인페이지</a>
			<a href="/web">홈으로</a>
		</div>
	</div>
<jsp:include page="../page/footer.jsp" />
</body>
</html>