<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>마이페이지</h2>
<%-- 	<form name="viewForm" method="post">
		<input type="hidden" name="m_id" value="${login.m_id}" />
	</form> --%>
	<div class="form-group">
	 	<label for="m_id">아이디</label>
	 	<input type="text" class="form-control" name="m_id" id="m_id" value="${dto.m_id}" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="m_name">이름</label>
		<input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름" value="${dto.m_name}" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="m_mail">이메일</label>
		<input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일" value="${dto.m_mail}" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="m_phone">연락처</label>
		<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="연락처" value="${dto.m_phone}" readonly="readonly">
	</div>
	<div style="color: red;">${msg }</div><!-- 비밀번호 불일치 문구 -->
	<div class="button-group">
	  	<c:if test="${ (!empty login)}">
			<button type="button" class="btn btn-primary" id="updateBtn">수정</button>
			<button type="button" class="btn btn-primary" id="deleteBtn">탈퇴</button>
			<button type="button" class="btn btn-primary" id="updatePwBtn">비밀번호 변경</button>
		</c:if>
	</div>
</div>
<!-- /.container -->

<!-- JavaScript -->
<script>
	$(document).ready(function(){
		$("#updateBtn").click(function(){
			self.location = "update?m_id=${login.m_id}";
		});
		$("#deleteBtn").click(function(){
			self.location = "delete?m_id=${login.m_id}";
		});
		$("#updatePwBtn").click(function(){
			self.location = "updatePw?m_id=${login.m_id}";
		});
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
