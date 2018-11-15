<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<form class="form-signin" method="post">
		<h2 class="form-signin-heading">로그인</h2>
		<label for="m_id" class="sr-only">아이디</label>
		<input type="text" id="m_id" name="m_id" class="form-control" placeholder="아이디 입력" required autofocus>
		<label for="m_pw" class="sr-only">비밀번호</label>
		<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="비밀번호 입력" required>
		<!-- <div class="checkbox">
			<label> <input type="checkbox" name="rememberMe" value="true">
				Remember me
			</label>
		</div> -->
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	</form>
</div>
<!-- /.container -->

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<jsp:include page="../page/footer.jsp" />
