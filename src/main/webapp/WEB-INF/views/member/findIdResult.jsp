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
					<h2>아이디 찾기</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>로그인<i class="icon-angle-right"></i></li>
					<li>아이디 찾기</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<!-- <h2 align="center">아이디 찾기</h2> -->
		<div class="row">
			<div class="span6 offset3">
				<div class="control-group">
					<label for="m_id" class="control-label">아이디</label>
					<div class="controls">
						<p class="form-control-static" style="margin-bottom: 20px;">${m_id }</p>
					</div>	
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

