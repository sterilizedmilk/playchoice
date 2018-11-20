<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>로그인</h2>
	<form class="form-signin" method="post">
		<div class="form-group">
			<label for="m_id" class="sr-only">아이디</label>
			<input type="text" id="m_id" name="m_id" class="form-control" placeholder="아이디 입력" required autofocus>
		</div>
		<div class="form-group">
			<label for="m_pw" class="sr-only">비밀번호</label>
			<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="비밀번호 입력" required>
		</div>
		<div style="color: red;">${msg }</div><!-- 비밀번호 불일치 문구 -->
		<div class="button-group">
			<button class="btn btn-lg btn-primary btn-block" id="submitBtn" type="submit">로그인</button>
			<button class="btn btn-lg btn-default btn-block" onclick="history.go(-1)">취소</button>
		</div>
		<span class="pull-right">
			<a href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a>&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/member/findPw">비밀번호 찾기</a>
		</span>
	</form>
</div>
<!-- /.container -->

<!-- JavaScript -->
<script>
	$(document).ready(function(){
		$("#submitBtn").click(function(){
			var m_id = $("#m_id").val();
			var m_pw = $("#m_pw").val();
			if(m_id == "") {
				alert("아이디를 입력해주세요");
			}
			if(m_pw == "") {
				alert("비밀번호를 입력해주세요");
			}
		});
	});
</script>
<!-- /.JavaScript -->

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<jsp:include page="../page/footer.jsp" />
