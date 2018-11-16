<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>아이디 찾기</h2>
	<form action="findId" method="post">
		<div class="form-group">
			<label for="m_name" class="sr-only">이름</label>
			<input type="text" id="m_name" name="m_name" class="form-control" placeholder="이름 입력" required autofocus>
		</div>
		<div class="form-group">
			<label for="m_mail">이메일</label>
			<input type="text" id="m_mail" name="m_mail" class="form-control" placeholder="이메일 입력" required>
		</div>
		<div class="form-group">
			<button class="btn btn-lg btn-submit btn-block" id="findIdBtn" type="submit">아이디 찾기</button>
			<button class="btn btn-lg btn-primary btn-block" onclick="history.go(-1)">뒤로가기</button>
		</div>
	</form>
</div>

<jsp:include page="../page/footer.jsp" />