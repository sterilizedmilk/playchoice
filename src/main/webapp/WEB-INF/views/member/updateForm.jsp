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
					<h2>정보 수정</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>정보 수정</li>
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
					<form name="updateForm" method="post">
						<div class="form-group">
							<label for="m_id">아이디</label> <input type="text"
								class="form-control" name="m_id" id="m_id" value="${dto.m_id}"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="m_pw">비밀번호</label> <input type="password"
								class="form-control" name="m_pw" id="m_pw" placeholder="비밀번호"
								required="required">
						</div>
						<div class="form-group">
							<label for="m_name">이름</label> <input type="text"
								class="form-control" name="m_name" id="m_name" placeholder="이름"
								value="${dto.m_name}" required="required">
						</div>
						<div class="form-group">
							<label for="m_mail">이메일</label> <input type="email"
								class="form-control" name="m_mail" id="m_mail" placeholder="이메일"
								value="${dto.m_mail}" required="required">
						</div>
						<div class="form-group">
							<label for="m_phone">연락처</label> <input type="text"
								class="form-control" name="m_phone" id="m_phone"
								placeholder="연락처" value="${dto.m_phone}">
						</div>
						<div class="button-group">
							<button type="button" class="btn btn-success" id="updateBtn">확인</button>
							<button type="reset" class="btn btn-danger">취소</button>
							<button onclick="history.go(-1)" class="btn btn-primary">뒤로</button>
						</div>
					</form>
				</div><!-- /.span8 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(document)
			.ready(
					function() {
						$("#updateBtn")
								.click(
										function() {
											var m_pw = $("#m_pw").val();
											if (m_pw == "") {
												alert("비밀번호를 입력하세요");
												$("#m_pw").focus();
												return;
											} else {
												confirm("정보를 수정하시겠습니까?");
												document.updateForm.action = "${pageContext.request.contextPath}/member/update";
												document.updateForm.submit();
											}
										});
					});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
