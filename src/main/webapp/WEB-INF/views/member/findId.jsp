<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />
<style>
	.form-horizontal { padding:20px 10px;}
	.form-horizontal .control-label { width: 100px;}
	.form-horizontal .controls { margin-left: 120px;}
	.form-horizontal .controls input { width: 300px; margin-right: 10px;}
	.form-horizontal .button-group { margin-top: 40px; margin-bottom: 0;}
</style>

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
		<!-- <h2>아이디 찾기</h2> -->
		<div class="row">
			<div class="span6 offset3">
				<form action="findId" method="post" class="form-horizontal">
					<div class="control-group">
						<label for="m_name" class="control-label">이름</label>
						<div class="controls">
							<input type="text" id="m_name" name="m_name" placeholder="이름" required autofocus>
						</div>	
					</div>
					<div class="control-group">
						<label class="control-label" for="m_mail">이메일</label>
						<div class="controls">
							<input type="text" id="m_mail" name="m_mail" placeholder="이메일" required>
						</div>
					</div>
					<div class="control-group text-center" style="color: red;">${msg }</div><!-- 불일치 문구 -->
					<div class="control-group button-group">
						<button class="btn btn-lg btn-success btn-block" id="findIdBtn" type="submit">아이디 찾기</button>
						<button class="btn btn-lg btn-inverse btn-block" onclick="history.go(-1)">뒤로 가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../page/footer.jsp" />