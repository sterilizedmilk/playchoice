<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>비밀번호 변경</h2>
	<form name="updatePwForm" method="post">
		<input type="hidden" value="${login.m_id}" />
		<div class="form-group">
	  		<label for="m_oldpw">현재 비밀번호</label>
	  		<input type="password" class="form-control" name="m_pw" id="m_pw" placeholder="현재 비밀번호" required="required">
		</div>
	  	<div class="form-group">
			<label for="m_newpw">새 비밀번호</label>
			<input type="password" class="form-control" name="m_newpw" id="m_newpw" placeholder="새 비밀번호" required="required">
	  	</div>
	  	<div class="form-group">
			<label for="m_newpwCheck">새 비밀번호 확인</label>
			<input type="password" class="form-control" name="m_newpwCheck" id="m_newpwCheck" placeholder="새 비밀번호 확인" required="required">
	  	</div>
	  	<!-- 비밀번호 불일치 경고창 -->
		<div class="alert alert-danger" id="alert-dangerPw" style="margin-bottom:5px;">비밀번호가 일치하지 않습니다.</div>
		<!-- //.비밀번호 불일치 경고창 -->
	  	<div class="button-group">
		  	<button type="submit" class="btn btn-success" id="updatePwBtn">확인</button>
		  	<button type="reset" class="btn btn-danger">취소</button>
		</div>
	</form>
</div>
<!-- /.container -->

<!-- JavaScript -->
<script>
	$(function(){
		// 경고창 숨김
		$("#alert-dangerPw").hide();
		
		// 비밀번호 일치 검사
		$("input").keyup(function(){
			var pw1 = $("#m_newpw").val();
			var pw2 = $("#m_newpwCheck").val();
			if(pw1 != "" && pw2 != "") {
				if(pw1 != pw2) { // 비밀번호 불일치하는 경우
					$("#alert-dangerPw").show();
					$("#submit").attr("disabled", "disabled");
				} else { // 비밀번호 일치하는 경우
					$("#alert-dangerPw").hide();
					$("#submit").removeAttr("disabled");
				}
			}
		});
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
