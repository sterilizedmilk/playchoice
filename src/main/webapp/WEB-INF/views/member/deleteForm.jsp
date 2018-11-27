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
					<h2>회원 탈퇴</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>회원 탈퇴</li>
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
					<form name="deleteForm" method="post">
						<div class="control-group">
							<label class="control-label" for="m_id">아이디</label>
							<div class="controls">
								<%-- <input type="text" name="m_id" id="m_id" value="${dto.m_id}" readonly="readonly"> --%>
								<p class="form-control-static" style="margin-bottom: 20px;">${dto.m_id }</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="m_pw">비밀번호</label>
							<div class="controls">
								<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호 입력" required="required">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="m_name">이름</label>
							<div class="controls">
								<%-- <input type="text" name="m_name" id="m_name" placeholder="이름 입력" value="${dto.m_name}" readonly="readonly"> --%>
								<p class="form-control-static" style="margin-bottom: 20px;">${dto.m_name }</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="m_mail">이메일</label>
							<div class="controls">
								<%-- <input type="email" name="m_mail" id="m_mail" placeholder="이메일 입력" value="${dto.m_mail}" readonly="readonly"> --%>
								<p class="form-control-static" style="margin-bottom: 20px;">${dto.m_mail }</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="m_phone">연락처</label>
							<div class="controls">
								<%-- <input type="text" name="m_phone" id="m_phone" placeholder="연락처 입력" value="${dto.m_phone}" readonly="readonly"> --%>
								<p class="form-control-static" style="margin-bottom: 20px"; id="m_phone" title="전화번호">${dto.m_phone }</p>
							</div>
						</div>
						<div style="color: red;">${msg }</div>
						<!-- 비밀번호 불일치 문구 -->
						<div class="control-group button-group pull-right">
							<button type="button" class="btn btn-success" id="deleteBtn">확인</button>
							<button type="reset" class="btn btn-danger">취소</button>
							<!-- <button onclick="history.go(-1)" class="btn btn-primary">뒤로</button> -->
						</div>
					</form>
				</div><!-- /.span8 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(document).ready(function() {
		$("#deleteBtn").click(function() {
			var m_pw = $("#m_pw").val();
			if (m_pw == "") {
				alert("비밀번호를 입력하세요");
				$("#m_pw").focus();
				return;
			} else if (confirm("정말 탈퇴하시겠습니까?")) {
				document.deleteForm.action = "${pageContext.request.contextPath}/member/delete";
				document.deleteForm.submit();
			}
		});
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
