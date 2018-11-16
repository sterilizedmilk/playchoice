<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../page/header.jsp"></jsp:include>
<script>
$(document).ready(function(){
	$("#test").click(function(){
		if($("#id").val('')){
			$("#errorText").text("아이디가 빈칸입니다");
		}
		if($("#pw").val('')){
			$("#errorText").text("암호가 빈칸입니다");
		}
	})
})
</script>

</head>
<body>

	
	<div class="container">
		<div class="span12" align="center">
		<h2>로그인 페이지</h2>
		<form action="loginGo" method="post">
			<input type="text" id="id" name="m_id" placeholder="아이디" /><br>
			<input type="text" id="pw" name="m_pw" placeholder="비밀번호"/><br>
			<input type="submit" id="login" value="로그인" />
			<button><a href="/playchoice">돌아가기</a></button>
			</form>
			<button id="test">테스트버튼</button><!-- AJAX -->
			<hr>
		
		<a href="findId">아이디 찾기</a>
		<a href="findPw">비밀번호 찾기</a>
		<a href="#">회원가입</a>
		</div>
	</div>
	<div>
		<p id="errorText"><span></span></p>
	</div>
<jsp:include page="../page/footer.jsp"></jsp:include>
</body>
</html>