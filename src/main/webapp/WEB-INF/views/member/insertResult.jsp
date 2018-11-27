<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../page/header.jsp" />

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>회원가입</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>회원가입</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span6 offset3">
				<div class="control-group">
					<h3>가입이 완료되었습니다.</h3>
					<h5>${member.m_id} 님 가입을 환영합니다.</h5>
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
