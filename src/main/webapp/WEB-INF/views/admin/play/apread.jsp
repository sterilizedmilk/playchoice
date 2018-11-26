<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../../page/header.jsp" />

<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<h2 align="center">연극 세부정보</h2>
<form role="form" method="post">
	<input type="hidden" name="p_id" value="${playDTO.p_id }">
</form>

<div class="box-footer" align="center">
	<button type="submit" class="btn btn-warning">글 수정</button>
	<button type="submit" class="btn btn-danger">글 삭제</button>	
	<button type="submit" class="btn btn-primary">목록으로</button>
	<button type="submit" class="btn btn-pslist">일정 보기</button>
</div>

<div class="box-body" align="center">
	<div class="form-group">
		<label for="exampleInputEmail1">글 번호</label>
		<input type="text" name="number" class="form-control" value="${playDTO.p_id }" readonly="readonly">
	
		<label for="exampleInputEmail1">글 제목</label>
		<input type="text" name="title" class="form-control" value="${playDTO.p_name }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">글 내용</label>
		<textarea style="width: 50%; height: 300px" readonly="readonly">${playDTO.p_info }</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">환불 규정</label>
		<textarea style="width: 50%; height: 300px" readonly="readonly">${playDTO.p_refund_policy }</textarea>
	</div>
	
	<div><label for="exampleInputEmail1">대표 포스터</label>
	</div>
	<div class="form-group">		
		<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image0 }">
		
	</div>
	<div><label>메인 썸네일 포스터</label></div>
	<div>
		<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image1 }">
	</div>
	<div><label for="exampleInputEmail1">내용 포스터</label>
	</div>
	<div>
		<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image2 }"><br/>
		<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image3 }"><br/>
		<img src="${pageContext.request.contextPath}/resources/img/play/${playDTO.p_image4 }">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">찾아오시는길(상세보기)</label>
		<input type="text" name="location" class="form-control" value="${playDTO.p_location }" readonly="readonly">
	</div>
</div>

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
		$(".btn-primary").on("click", function(){
			self.location="${pageContext.request.contextPath}/admin/play/aplist";
		});
		$(".btn-pslist").on("click", function(){
			
			self.location="${pageContext.request.contextPath}/admin/play/pslist?p_id=${playDTO.p_id}";
		});
	});
</script>