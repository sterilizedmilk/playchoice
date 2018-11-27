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
					<h2>로그인</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>로그인</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<!-- <h2>로그인</h2> -->
		<div class="row">
			<div class="span6 offset3">
				<form method="post" class="form-horizontal">
					<div class="control-group">
						<label class="control-label" for="m_id" class="sr-only">아이디</label>
						<div class="controls">
							<input type="text" id="m_id" name="m_id" placeholder="아이디" required autofocus>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="m_pw">비밀번호</label>
						<div class="controls">
							<input type="password" id="m_pw" name="m_pw" placeholder="비밀번호" required>
						</div>
					</div>
					<div class="control-group text-center" style="color: red;">${msg }</div><!-- 비밀번호 불일치 문구 -->
					<div class="control-group button-group">
						<button class="btn btn-lg btn-success btn-block" id="submitBtn" type="submit">로그인</button>
						<button class="btn btn-lg btn-inverse btn-block" onclick="history.go(-1)">취소</button>
					</div>
					<span class="pull-right">
						<a href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a>&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/member/findPw">비밀번호 찾기</a>
					</span>
				</form>
			</div><!-- /.span6 offset3 -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(document).ready(function(){
		$("#submitBtn").click(function(){
			var m_id = $("#m_id").val();
			var m_pw = $("#m_pw").val();
			if(m_id == "") {
				alert("아이디를 입력해주세요");
			}
			if(m_pw == "") {
				alert("비밀번호를 입력해주세요");
			}
		});
	});
</script>
<!-- /.JavaScript -->

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<jsp:include page="../page/footer.jsp" />
