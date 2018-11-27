<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../../page/header.jsp" />
<jsp:include page="adminheader.jsp" />

<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>연극 세부정보</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="content">
<div class="contanier">
	<div class="row">
		<div class="span6 offset3">
			<form role="form" name="form" class="form-horizontal" method="post">
			<input type="hidden" name="p_id" value="${playDTO.p_id }">
			<div class="control-group" align="center">
				<button type="submit" class="btn btn-warning">글 수정</button>
				<button type="submit" class="btn btn-danger">글 내리기</button>
				<button type="submit" class="btn btn-pslist">일정 보기</button>
			</div>

			<div class="control-group">
				<label class="control-label" for="p_id">글 번호</label>
				<div class="controls">
					<input type="text" name="p_id" id="p_id" value="${playDTO.p_id }" readonly="readonly">
					<span class="help-block"></span>
				</div>
			</div>
			<div class="control_group">
				<label class="control-label" for="p_name">글 제목</label>
				<div class="controls">
					<input type="text" name="p_name" id="p_name" value="${playDTO.p_name }" readonly="readonly">
					<span class="help-block"></span>
				</div>
			</div>
			<div class="control_group">
				<label class="control-label" for="p_info">글 내용</label>
				<div class="controls">
					<textarea style="width: 100%; height: 300px" readonly="readonly">${playDTO.p_info }</textarea>
					<span class="help-block"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="p_refund_policy">환불 규정</label>
				<div class="controls">
					<textarea style="width: 100%; height: 300px" readonly="readonly">${playDTO.p_refund_policy }</textarea>
					<span class="help-block"></span>
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="p_image0">대표 포스터의 썸네일</label>
				<div class="controls">		
					<img src="${pageContext.request.contextPath}/resources/img/play/thumb_${playDTO.p_image0 }">
					<span class="help-block"></span>	
				</div>
			</div>
			<div class="control-group">
			<label class="control-label" for="p_image1">메인 썸네일 포스터</label>
				<div class="controls">
					<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image1 }">
					<span class="help-block"></span>
				</div>
			</div>
			<div class="control-group">
			<label class="control-label" for="image">대표포스터 및 내용 포스터</label>
				<div class="controls">
					<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image0 }"><span class="help-block"></span>
					<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image2 }"><span class="help-block"></span>
					<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image3 }"><span class="help-block"></span>
					<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image4 }"><span class="help-block"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="p_location">찾아오시는길(상세보기)</label>
				<input type="text" name="p_location" id="p_location" value="${playDTO.p_location }" readonly="readonly">
				<span class="help-block"></span>
			</div>
			</form>
		</div>
	</div>
</div>
</section>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/admin/play/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/admin/play/remove");
			formObj.submit();
		});	
		$(".btn-pslist").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/admin/play/pslist?p_id=${playDTO.p_id}");
			//self.location="${pageContext.request.contextPath}/admin/play/pslist?p_id=${playDTO.p_id}";
		});
	});
</script>

<jsp:include page="../../page/footer.jsp" />