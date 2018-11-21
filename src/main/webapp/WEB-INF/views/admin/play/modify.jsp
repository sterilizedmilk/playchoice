<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<form role="form" method="post" enctype="multipart/form-data">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">연극 번호</label>
			<input type="text" name="p_id" class="form-contorl" value="${playDTO.p_id }" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">연극 제목</label>
			<input type="text" name="p_name" class="form-contorl" value="${playDTO.p_name }">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">연극 내용</label>
			<textarea class="form-control" name="p_info" rows="50" cols="50">${playDTO.p_info }</textarea>
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">파일 변경</label>
			<input type="file" name="p_picture" class="form-contorl">
		</div>
	</div>
</form>

<div class="box-footer">
	<button type="submit" class="btn btn-primary">변경</button>
	<button type="submit" class="btn btn-warning">취소</button>
</div>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location="/playChoice/admin/play/aplist";
		});
		
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
	});
</script>
