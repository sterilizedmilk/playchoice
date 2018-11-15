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
		<h2 align="center">비밀번호 찾기</h2>
		<div class="span12" align="center">
			<form action="findPw" method="post">
			<input type="text" id="id" name="m_id" placeholder="아이디" /><br>
			<input type="text" id="mail" name="m_mail" placeholder="이메일"/><br>
			<input type="submit" id="login" value="찾기" />
			<button><a href="/playchoice">돌아가기</a></button>
			</form>
			<button id="test">테스트버튼</button> <!-- AJAX -->
			<hr>
		</div>
	</div>
<jsp:include page="../page/footer.jsp" />
</html>