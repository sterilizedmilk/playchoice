<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />
<%-- <jsp:include page="viewheader.jsp" /> --%>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>내 정보</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>내 정보</li>
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
					<div class="form-group">
						<label for="m_id">아이디</label>
						<%-- <input type="text" class="form-control" name="m_id" id="m_id" value="${dto.m_id}" readonly="readonly"> --%>
						<p class="form-control-static">${dto.m_id }</p>
					</div>
					<div class="form-group">
						<label for="m_name">이름</label>
						<%-- <input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름" value="${dto.m_name}" readonly="readonly"> --%>
						<p class="form-control-static">${dto.m_name }</p>
					</div>
					<div class="form-group">
						<label for="m_mail">이메일</label>
						<%-- <input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일" value="${dto.m_mail}" readonly="readonly"> --%>
						<p class="form-control-static">${dto.m_mail }</p>
					</div>
					<div class="form-group">
						<label for="m_phone">연락처</label>
						<%-- <input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="연락처" value="${dto.m_phone}" readonly="readonly"> --%>
						<p class="form-control-static">${dto.m_phone }</p>
					</div>
					<div style="color: red;">${msg }</div><!-- 비밀번호 불일치 문구 -->
				</div><!-- span8 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(document).ready(function() {
		$("#updateBtn").click(function() {
			self.location = "update?m_id=${login.m_id}";
		});
		$("#deleteBtn").click(function() {
			self.location = "delete?m_id=${login.m_id}";
		});
		$("#updatePwBtn").click(function() {
			self.location = "updatePw?m_id=${login.m_id}";
		});
		$("#payment").click(function() {
			self.location = "paymentList?m_code=${login.m_code}";
		});
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
