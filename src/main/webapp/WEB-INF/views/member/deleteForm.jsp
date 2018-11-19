<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>회원 탈퇴</h2>
		<form name="deleteForm" method="post">
			<div class="form-group">
		  		<label for="m_id">아이디</label>
		  		<input type="text" class="form-control" name="m_id" id="m_id" value="${dto.m_id}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="m_pw">비밀번호</label>
				<input type="password" class="form-control" name="m_pw" id="m_pw" placeholder="비밀번호 입력" required="required">
		  	</div>
		  	<div class="form-group">
				<label for="m_name">이름</label>
				<input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름 입력" value="${dto.m_name}" readonly="readonly">
		  	</div>
		  	<div class="form-group">
				<label for="m_mail">이메일</label>
				<input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일 입력" value="${dto.m_mail}" readonly="readonly">
		  	</div>
		  	<div class="form-group">
				<label for="m_phone">연락처</label>
				<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="연락처 입력" value="${dto.m_phone}" readonly="readonly">
		  	</div>
		  	<div style="color: red;">${msg }</div><!-- 비밀번호 불일치 문구 -->
		  	<div class="button-group">
			  	<button type="button" class="btn btn-success" id="deleteBtn">확인</button>
			  	<button type="reset" class="btn btn-danger">취소</button>
			  	<button onclick="history.go(-1)" class="btn btn-primary">뒤로</button>
			</div>
		</form>
</div>
<!-- /.container -->

<!-- JavaScript -->
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
			var m_pw = $("#m_pw").val();
			if(m_pw == "") {
				alert("비밀번호를 입력하세요");
				$("#m_pw").focus();
				return;
			} else if(confirm("정말 탈퇴하시겠습니까?")) {
				document.deleteForm.action = "${pageContext.request.contextPath}/member/delete";
				document.deleteForm.submit();
			}
		});
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
