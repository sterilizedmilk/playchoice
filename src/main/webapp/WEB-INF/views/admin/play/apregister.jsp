<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

<jsp:include page="../../page/header.jsp" />
<jsp:include page="adminheader.jsp" />
<title>Insert title here</title>

<input type="hidden" name="m_code" value="${login.m_code }" />
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>연극 글 쓰기</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span6 offset3">
				<form role="form" name="form" method="post" class="form-horizontal" enctype="multipart/form-data">		
					<fildset><legend>필수 선택 사항</legend>
					<div class="control-group">
						<label class="control-label" for="p_name">글 제목</label>
						<div class="controls">
							<input type="text" name = "p_name" id="p_name" placeholder="Enter Title">
							<span class="help-block"></span>
						</div>
					</div>
							
					<div class="contorl-group">
						<label class="control-label" for="p_info">글 내용</label>
						<div class="controls">
							<textarea name="p_info" id="p_info" style="width: 100%; height: 300px">
								<jsp:include page="addinfo.jsp" />
							</textarea>
							<span class="help-block"></span>
						</div>
					</div>
						
					<div class="control-group">
						<label class="control-label" for="p_refund_policy">환불 규정</label>
						<div class="controls">
							<textarea class="from-contorl" name="p_refund_policy" style="width: 100%; height: 300px" readonly="readonly">
								<jsp:include page="addrefund.jsp" />
							</textarea>
						</div>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="g_id">장르</label>
						<div class="controls">
							<select name="g_id">
							<c:forEach items="${glist }" var="gl">
								<option value="${gl.g_id }">${gl.g_name }</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group">
					<label class="control-label" for="a_id">지역</label>
						<div class="controls">
							<select name="a_id">
							<c:forEach items="${alist }" var="al">
								<option value="${al.a_id }">${al.a_name }</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="p_location">찾아오시는 길(상세 주소)</label>
						<div class="controls">
							<input type="text" name = "p_location" id="p_location" placeholder="Enter location">
						</div>
					</div>
						
					<div class="control-group" id="fileDiv">
						<label class="control-label" for="p_image0">대표 포스터 추가 및<br/>썸네일 생성</label>
						<div class="controls">
							<input type="file" name="p_image">
							<span class="help-block"></span>
						</div>
					</div>
					<div class="control-group" id="fileDiv">
						<label class="control-label" for="p_image1">메인 썸네일 포스터 추가</label>
						<div class="controls">
							<input type="file" name="p_image">
							<span class="help-block"></span>
						</div>
					</div>
					<legend>선택 사항</legend>
					<div class="control-group" id="fileDiv">
						<label class="control-label" for="p_image2">내용 포스터 추가 1</label>
						<div class="controls">
							<input type="file" name="p_image">
							<span class="help-block"></span>
						</div>
					</div>
					<div class="control-group" id="fileDiv">
						<label class="control-label" for="p_image3">내용 포스터 추가 2</label>
						<div class="controls">
							<input type="file" name="p_image">
						</div>
					</div>
						
					<div class="control-group" id="fileDiv">
						<label class="control-label" for="p_image4">내용 포스터 추가 3</label>
						<div class="controls">
							<input type="file" name="p_image">
						</div>
					</div>
						
					
					
					<div class="control-group" align="center">
						<button type="submit" class="btn btn-success">완료</button>
						<input type="button" onclick="history.go(-1)" value="취소">
					</div>
					</fildset>
				</form>
			</div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		var result = "${msg}";
		
		if(result != ""){
			alert("${msg}")
		}
		
		/* $(".btn-primary").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/admin/play/aplist");
			formObj.attr("method", "get");
			formObj.submit();
		}); */
		
		if(p_name == ""){
			alert("글 제목을 입력하세요");
			return;
		}
		
		// 유효검사(에러출력)
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
		
		// 유효검사(성공출력)
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

<jsp:include page="../../page/footer.jsp" />