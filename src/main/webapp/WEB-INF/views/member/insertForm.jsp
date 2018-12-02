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
	.form-horizontal .controls input { width: 250px; margin-right: 10px;}
	.form-horizontal .button-group { margin-top: 20px;}
</style>

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
				<!-- <h2 class="text-center">회원 가입</h2> -->
				<form id="insertForm" name="insertForm" method="post" class="form-horizontal">
					<fieldset>
						<legend>필수 입력사항</legend>
						<div class="control-group" style="height: 40px;">
							<label class="control-label" for="m_id">아이디</label> 
							<div class="controls">
								<input type="text" name="m_id" id="m_id" placeholder="아이디" required="required">
								<button type="button" class="btn btn-primary" id="confirmBtn">중복체크</button>
								<span class="help-block"></span>
							</div>
						</div>
						<!-- 아이디 중복 경고창 -->
						<!-- <div class="alert alert-danger" id="alert-dangerId"
							style="margin-bottom: 5px;">이미 사용중인 아이디입니다.</div>
						<div class="alert alert-submit" id="alert-submitId"
							style="margin-bottom: 5px;">사용가능한 아이디입니다.</div> -->
						<!-- //.아이디 중복 경고창 -->
						<div class="control-group">
							<label class="control-label" for="m_pw">비밀번호</label>
							<div class="controls">
								<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호" required="required">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="m_pwCheck">비밀번호 확인</label>
							<div class="controls">
								<input type="password" name="m_pwCheck" id="m_pwCheck" placeholder="비밀번호 확인" required="required">
								<span class="help-block"></span>
							</div>
						</div>
						<!-- 비밀번호 불일치 경고창 -->
						<!-- <div class="alert alert-danger" id="alert-dangerPw"
							style="margin-bottom: 5px;">비밀번호가 일치하지 않습니다.</div> -->
						<!-- //.비밀번호 불일치 경고창 -->
						<div class="control-group">
							<label class="control-label" for="m_name">이름</label>
							<div class="controls">
								<input type="text" name="m_name" id="m_name" placeholder="이름" required="required">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="control-group" style="height: 40px;">
							<label class="control-label" for="m_mail">이메일</label>
							<div class="controls">
								<input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일" required="required">
								<button type="button" class="btn btn-primary" id="confirmMailBtn">중복체크</button>
								<span class="help-block"></span>
							</div>
						</div>
						<!-- 이메일 중복 경고창 -->
						<!-- <div class="alert alert-danger" id="alert-dangerEmail"
							style="margin-bottom: 5px;">이미 등록된 이메일입니다.</div>
						<div class="alert alert-submit" id="alert-submitEmail"
							style="margin-bottom: 5px;">사용가능한 이메일입니다.</div> -->
						<!-- //.이메일 중복 경고창 -->
						<legend>선택 입력사항</legend>
						<div class="control-group">
							<label class="control-label" for="m_phone">휴대전화</label>
							<div class="controls">
								<input type="text" name="m_phone" id="m_phone" placeholder="휴대전화">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="control-group">
							<div class="controls pull-right">
								<button type="submit" class="btn btn-success" id="submit">확인</button>
								<button type="reset" class="btn btn-danger">취소</button>
							</div>
						</div>
					</fieldset>
				</form><!-- / 콘텐츠 부분 -->
			</div><!-- /.span12 -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<!-- JavaScript -->
<script>
	$(function(){
			
		$(document).ready(function(){
			/* $("#submit").attr("disabled", "disabled"); */
			
			// 아이디 중복체크 실행 여부(0:중복체크 안 했음 / 1:중복체크 했음)
			var countId = 0;
			var countMail = 0;
			
			// 아이디 검사
			$("#confirmBtn").click(function(){
				var m_id = $("#m_id").val();
				var idCheck = /^[a-z]+[a-z0-9]{4,11}$/;
				
				if(m_id == "") {
					/* $("#submit").attr("disabled", "disabled"); */
					/* alert("아이디를 입력하세요"); */
					displayError("m_id", "아이디를 입력하세요.");
					$("#m_id").focus();
					return;
				} else if(!idCheck.test(m_id)) {
					/* $("#submit").attr("disabled", "disabled"); */
					/* alert("한글 및 특수문자는 사용할 수 없습니다"); */
					displayError("m_id", "5~10자의 영문 소문자, 숫자만 사용 가능합니다.");
					$("#m_id").focus();
					return;
				} else { // 아이디 중복 검사
					$.ajax({
						url : "${pageContext.request.contextPath}/member/duplicate/" + m_id,
						type : "POST",
						success : function(data){
							if(data == "DUPLICATED") { // 아이디 중복인 경우
								displayError("m_id", "이미 사용중인 아이디입니다.");
								$("#m_id").focus();
								/* $("#submit").attr("disabled", "disabled"); */
							} else { // 사용가능한 경우
								countId = 1;
								displaySuccess("m_id", "사용가능한 아이디입니다.");
								//$("#submit").removeAttr("disabled");
							}
						}
					});
				}
			});
			
			// 중복체크 후 아이디 변경 방지
			$("#m_id").keyup(function(){
				countId = 0;
				displayError("m_id", "중복체크를 하세요.");
				$("#m_id").focus();
			});
			
			// 비밀번호 검사
			$("#m_pw").keyup(function(){
				var pw1 = $("#m_pw").val();
				var regexPw = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9]){8,20}$/;
				
				if(pw1 == "") {
					displayError("m_pw", "비밀번호를 입력하세요.");
					$("#m_pw").focus();
					return;
				} else if(!regexPw.test(pw1)) {
					displayError("m_pw", "8~20자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
					$("#m_pw").focus();
					return;
				} else {
					displaySuccess("m_pw", "사용가능한 비밀번호입니다.");
				}
			});
			
			// 비밀번호 일치 검사
			$("#m_pwCheck").keyup(function(){
				var pw1 = $("#m_pw").val();
				var pw2 = $("#m_pwCheck").val();
				
				if(pw1 != "" && pw2 != "") {
					if(pw1 != pw2) { // 비밀번호 불일치하는 경우
						displayError("m_pwCheck", "비밀번호가 일치하지 않습니다.");
						/* $("#submit").attr("disabled", "disabled"); */
					} else { // 비밀번호 일치하는 경우
						displaySuccess("m_pwCheck", "비밀번호가 일치합니다.");
						//$("#submit").removeAttr("disabled");
					}
				}
			});
			
			$("#m_name").keyup(function(){
				var m_name = $("#m_name").val();
				var regexName = /^[가-힣]{2,4}$/;

				if(m_name == "") {
					displayError("m_name", "이름을 입력하세요.");
					$("#m_name").focus();
					return;
				} else if(!regexName.test(m_name)) {
					displayError("m_name", "2~4자의 한글 이름만 사용 가능합니다.");
					$("#m_name").focus();
					return;
				} else {
					displaySuccess("m_name", "");
				}
			})
			
			// 이메일 검사
			$("#confirmMailBtn").click(function(){
				var m_mail = $("#m_mail").val();
				var regexMail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

				if(m_mail == "") {
					alert("이메일을 입력하세요");
					displayError("m_mail", "이메일을 입력하세요.");
					$("#m_mail").focus();
					return;
				} else if(!regexMail.test(m_mail)) {
					displayError("m_mail", "이메일 주소를 다시 확인하세요.");
					$("#m_mail").focus();
					return;
				} else { // 이메일 중복 검사
					console.log(m_mail);
					$.ajax({
						url : "${pageContext.request.contextPath}/member/duplicateMail/" + m_mail,
						type : "POST",
						success : function(data){
							if(data == "DUPLICATED") { // 이메일 중복인 경우
								displayError("m_mail", "이미 사용중인 이메일입니다.");
								$("#m_mail").focus();
								/* $("#submit").attr("disabled", "disabled"); */
							} else { // 사용가능한 경우
								countMail = 1;
								displaySuccess("m_mail", "사용가능한 이메일입니다.");
								//$("#submit").removeAttr("disabled");
							}
						}
					});
				}
			});
			
			// 중복체크 후 이메일 변경 방지
			$("#m_mail").keyup(function(){
				countMail = 0;
				displayError("m_mail", "중복체크를 하세요.");
				$("#m_mail").focus();
			});
			
			$("#insertForm").submit(function(){
				if(countId == 0) {
					displayError("m_id", "아이디 중복체크를 하세요.");
					return false;
				} else if(countMail == 0) {
					displayError("m_mail", "이메일 중복체크를 하세요.");
					return false;
				}
			});
			
			// 전화번호 검사
			$("#m_phone").keyup(function(){
				var m_phone = $("#m_phone").val();
				var regexPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
				
				if(!regexPhone.test(m_phone)) {
					displayError("m_phone", "숫자, -를 포함한 숫자만 입력하세요.");
					$("#m_phone").focus();
				} else {
					displaySuccess("m_phone", "");
				}
			});
		});
		
		// 에러 출력
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
		
		// 성공 출력
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
