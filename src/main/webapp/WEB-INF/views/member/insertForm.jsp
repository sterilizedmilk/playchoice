<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>회원 가입</h2>
		<form id="joinForm" name="joinForm" method="post">
			<div class="form-group">
		  		<label for="m_id">아이디</label>
		  		<input type="text" class="form-control" name="m_id" id="m_id" placeholder="아이디 입력">
		  		<button type="button" id="confirmBtn">중복체크</button>
			</div>
			<!-- 아이디 중복 경고창 -->
			<div class="alert alert-danger" id="alert-dangerId" style="margin-bottom:5px;">이미 사용중인 아이디입니다.</div>
			<div class="alert alert-submit" id="alert-submitId" style="margin-bottom:5px;">사용가능한 아이디입니다.</div>
			<!-- //.아이디 중복 경고창 -->
			<div class="form-group">
		  		<label for="m_pw">비밀번호</label>
		  		<input type="password" class="form-control" name="m_pw" id="m_pw" placeholder="비밀번호 입력">
			</div>
			<div class="form-group">
		  		<label for="m_pwCheck">비밀번호 확인</label>
		  		<input type="password" class="form-control" name="m_pwCheck" id="m_pwCheck" placeholder="비밀번호 확인">
			</div>
			<!-- 비밀번호 불일치 경고창 -->
			<div class="alert alert-danger" id="alert-dangerPw" style="margin-bottom:5px;">비밀번호가 일치하지 않습니다.</div>
			<!-- //.비밀번호 불일치 경고창 -->
		  	<div class="form-group">
				<label for="m_name">이름</label>
				<input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름 입력">
		  	</div>
		  	<div class="form-group">
				<label for="m_mail">이메일</label>
				<input type="email" class="form-control" name="m_mail" id="m_mail" placeholder="이메일 입력">
		  	</div>
		  	<div class="form-group">
				<label for="m_phone">연락처</label>
				<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="연락처 입력">
		  	</div>
		  	<div class="button-group pull-right">
			  	<button type="submit" class="btn btn-submit" id="submit">등록</button>
			  	<button type="reset" class="btn btn-danger">리셋</button>
			  	<button onclick="history.go(-1)" class="btn btn-primary">뒤로</button>
			</div>
		</form><!-- / 콘텐츠 부분 -->
</div><!-- /.container -->

<!-- JavaScript ============================================= -->
<script>
	$(function(){
		// 모든 경고창 숨김
		$("#alert-dangerId").hide();
		$("#alert-submitId").hide();
		$("#alert-dangerPw").hide();
		
		// 아이디 검사
		$(document).ready(function(){
			$("#confirmBtn").click(function(){
				var m_id = $("#m_id").val();
				if(m_id == "") {
					alert("아이디를 입력하세요")
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
								$("#alert-submitId").hide();
								$("#alert-dangerId").show();
								$("#m_id").focus();
								$("#submit").attr("disabled", "disabled");
							} else { // 사용가능한 경우
								$("#alert-dangerId").hide();
								$("#alert-submitId").show();
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
	});
</script>
<!-- //.JavaScript ============================================== -->

<jsp:include page="../page/footer.jsp" />
