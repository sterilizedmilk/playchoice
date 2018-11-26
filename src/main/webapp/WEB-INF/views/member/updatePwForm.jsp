<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>비밀번호 변경</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>비밀번호 변경</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<jsp:include page="viewLeftside.jsp" />
			<div class="row">
				<div class="span8">
					<form name="updatePwForm" method="post">
						<div class="form-group">
							<label for="m_pw">현재 비밀번호</label> <input type="password"
								class="form-control" name="m_pw" id="m_pw" placeholder="현재 비밀번호"
								required="required">
						</div>
						<div class="form-group">
							<label for="new_pw">새 비밀번호</label> <input type="password"
								class="form-control" name="new_pw" id="new_pw"
								placeholder="새 비밀번호" required="required">
						</div>
						<div class="form-group">
							<label for="new_pwCheck">새 비밀번호 확인</label> <input type="password"
								class="form-control" name="new_pwCheck" id="new_pwCheck"
								placeholder="새 비밀번호 확인" required="required">
						</div>
						<!-- 비밀번호 불일치 경고창 -->
						<div class="alert alert-danger" id="alert-dangerPw"
							style="margin-bottom: 5px;">비밀번호가 일치하지 않습니다.</div>
						<!-- //.비밀번호 불일치 경고창 -->
						<div class="button-group">
							<button type="button" class="btn btn-success" id="updatePwBtn">확인</button>
							<button type="reset" class="btn btn-danger">취소</button>
						</div>
					</form>
				</div><!-- /.span8 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(function() {
		// 경고창 숨김
		$("#alert-dangerPw").hide();

		$(document)
				.ready(
						function() {
							$("#updatePwBtn")
									.click(
											function() {
												var m_pw = $("#m_pw").val();
												if (m_pw == "") {
													alert("비밀번호를 입력하세요");
													$("#m_pw").focus();
													return;
												} else {
													confirm("비밀번호를 변경하시겠습니까?");
													document.updatePwForm.action = "${pageContext.request.contextPath}/member/updatePw";
													document.updatePwForm
															.submit();
												}
											});
						});

		// 비밀번호 일치 검사
		$("input").keyup(function() {
			var pw1 = $("#new_pw").val();
			var pw2 = $("#new_pwCheck").val();
			if (pw1 != "" && pw2 != "") {
				if (pw1 != pw2) { // 비밀번호 불일치하는 경우
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
