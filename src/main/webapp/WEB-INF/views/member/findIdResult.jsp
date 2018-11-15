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
		<h2 align="center">아이디 찾기</h2>
		<div class="span12" align="center">
			아이디는 ${m_id }입니다!<br>
			<a href="login">로그인페이지</a>
			<a href="/playchoice">홈으로</a>
		</div>
	</div>
<jsp:include page="../page/footer.jsp" />
</body>
</html>