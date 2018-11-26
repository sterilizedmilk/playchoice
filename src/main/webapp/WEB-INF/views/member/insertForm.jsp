<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />
<style>
	.form-horizontal {padding:20px 10px; border-top:3px solid #e74c3c;  border-bottom:1px solid #e74c3c;}
	.form-horizontal .control-label { width: 100px;}
	.form-horizontal .controls { margin-left: 120px;}
	.form-horizontal .controls input {width: 250px; margin-right: 10px;}
	.form-horizontal .button-group { margin-top: 20px;}
</style>
<div class="container">
	<div class="row">
		<div class="span6 offset3">
			<h2 class="text-center">회원 가입</h2>
			<form id="insertForm" name="insertForm" method="post" class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="m_id">아이디</label> 
					<div class="controls">
						<input type="text" name="m_id" id="m_id" placeholder="아이디">
						<button type="button" class="btn btn-primary" id="confirmBtn">중복체크</button>
						<span class="help-block"></span>
					</div>
				</div>
				<!-- 아이디 중복 경고창 -->
				<div class="alert alert-danger" id="alert-dangerId"
					style="margin-bottom: 5px;">이미 사용중인 아이디입니다.</div>
				<div class="alert alert-submit" id="alert-submitId"
					style="margin-bottom: 5px;">사용가능한 아이디입니다.</div>
				<!-- //.아이디 중복 경고창 -->
				<div class="control-group">
					<label class="control-label" for="m_pw">비밀번호</label>
					<div class="controls">
						<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="m_pwCheck">비밀번호 확인</label>
					<div class="controls">
						<input type="password" name="m_pwCheck" id="m_pwCheck" placeholder="비밀번호 확인">
						<span class="help-block"></span>
					</div>
				</div>
				<!-- 비밀번호 불일치 경고창 -->
				<div class="alert alert-danger" id="alert-dangerPw"
					style="margin-bottom: 5px;">비밀번호가 일치하지 않습니다.</div>
				<!-- //.비밀번호 불일치 경고창 -->
				<div class="control-group">
					<label class="control-label" for="m_name">이름</label>
					<div class="controls">
						<input type="text" name="m_name" id="m_name" placeholder="이름">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="m_mail">이메일</label>
					<div class="controls">
						<input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일">
						<button type="button" class="btn btn-primary" id="confirmMailBtn">중복체크</button>
						<span class="help-block"></span>
					</div>
				</div>
				<!-- 이메일 중복 경고창 -->
				<div class="alert alert-danger" id="alert-dangerEmail"
					style="margin-bottom: 5px;">이미 등록된 이메일입니다.</div>
				<div class="alert alert-submit" id="alert-submitEmail"
					style="margin-bottom: 5px;">사용가능한 이메일입니다.</div>
				<!-- //.이메일 중복 경고창 -->
				<div class="control-group">
					<label class="control-label" for="m_phone">연락처</label>
					<div class="controls">
						<input type="text" name="m_phone" id="m_phone" placeholder="연락처">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="button-group text-center">
					<button type="submit" class="btn btn-success btn-large" id="submit">확인</button>
					<button type="reset" class="btn btn-danger btn-large">취소</button>
					<button onclick="history.go(-1)" class="btn btn-primary btn-large">뒤로</button>
				</div>
			</form><!-- / 콘텐츠 부분 -->
		</div><!-- /.span12 -->
	</div><!-- /.row -->
</div><!-- /.container -->

<!-- JavaScript -->
<script>
	$(function(){
		// 모든 경고창 숨김
		$("#alert-dangerId").hide();
		$("#alert-submitId").hide();
		$("#alert-dangerPw").hide();
		$("#alert-dangerEmail").hide();
		$("#alert-submitEmail").hide();
		
		// 아이디 검사
		$(document).ready(function(){
			$("#confirmBtn").click(function(){
				var m_id = $("#m_id").val();
				if(m_id == "") {
					alert("아이디를 입력하세요");
					$("#m_id").focus();
					return;
				} else if((m_id < "0" || m_id > "9") && (m_id < "A" || m_id > "Z") && (m_id < "a" || m_id > "z")) {
					alert("한글 및 특수문자는 사용할 수 없습니다");
					$("#m_id").focus();
					return;
				} else {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/duplicate/" + m_id,
						type : "POST",
						success : function(data){
							// 아이디 중복 검사
							if(data == "DUPLICATED") { // 아이디 중복인 경우
								/* $("#alert-submitId").hide();
								$("#alert-dangerId").show(); */
								displayError("m_id", "이미 사용중인 아이디입니다.");
								$("#m_id").focus();
								$("#submit").attr("disabled", "disabled");
							} else { // 사용가능한 경우
								/* $("#alert-dangerId").hide();
								$("#alert-submitId").show(); */
								displaySuccess("m_id", "사용가능한 아이디입니다.");
								$("#submit").removeAttr("disabled");
							}
						}
					});
				}
			});
			
			// 이메일 중복 검사
			$("#confirmMailBtn").click(function(){
				var m_mail = $("#m_mail").val();
				if(m_mail == "") {
					alert("이메일을 입력하세요");
					$("#m_mail").focus();
					return;
				} else {
					console.log(m_mail);
					$.ajax({
						url : "${pageContext.request.contextPath}/member/duplicateMail/" + m_mail,
						type : "POST",
						success : function(data){
							if(data == "DUPLICATED") { // 이메일 중복인 경우
								$("#alert-submitEmail").hide();
								$("#alert-dangerEmail").show();
								$("#m_mail").focus();
								$("#submit").attr("disabled", "disabled");
							} else { // 사용가능한 경우
								$("#alert-dangerEmail").hide();
								$("#alert-submitEmail").show();
								$("#submit").removeAttr("disabled");
							}
						}
					});
				}
			});
		});
		
		// 비밀번호 일치 검사
		$("input").keyup(function(){
			var pw1 = $("#m_pw").val();
			var pw2 = $("#m_pwCheck").val();
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
		
		function displayError(inputId, msg) {
			var inputObj = $("#"+inputId);
			var formGroup = inputObj.parents(".control-group");
			var helpBlock = inputObj.parent().find(".help-block");
			
			$(".success").find(".helpBlock").hide();
			$(".success").removeClass("success");
			$(".error").find(".helpBlock").hide();
			$(".error").removeClass("error");
			
			formGroup.addClass("error");
			helpBlock.text(msg);
			inputObj.focus();
		}
		
		function displaySuccess(inputId, msg) {
			var inputObj = $("#"+inputId);
			var formGroup = inputObj.parents(".control-group");
			var helpBlock = inputObj.parent().find(".help-block");
			
			$(".success").find(".helpBlock").hide();
			$(".success").removeClass("success");
			
			formGroup.addClass("success");
			helpBlock.text(msg);
			inputObj.focus();
		}
		
	});
</script>
<!-- /.JavaScript -->

<jsp:include page="../page/footer.jsp" />
