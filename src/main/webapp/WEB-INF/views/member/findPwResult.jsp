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
					<h2>비밀번호 찾기</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>로그인<i class="icon-angle-right"></i></li>
					<li>비밀번호 찾기</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<!-- <h2 align="center">비밀번호찾기 완료</h2> -->
		<div class="row">
			<div class="span6 offset3">
				<div class="control-group">
					<%-- <label for="m_pw" class="control-label">비밀번호</label>
					<div class="controls">
						<p class="form-control-static" style="margin-bottom: 20px;">${m_pw }</p>
					</div> --%>
					<h3>비밀번호 찾기 결과</h3>
					<h5>새로운 비밀번호가 ${m_pw } 로 설정되었습니다.</h5>
					<h5>로그인 후 비밀번호 변경을 해주세요.</h5>
				</div>
				<div class="control-group pull-right">
					<a href="login">로그인</a>&nbsp;/
					<a href="/playchoice">홈</a>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../page/footer.jsp" />
