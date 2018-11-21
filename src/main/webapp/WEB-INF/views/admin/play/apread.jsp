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

<h2 align="center">연극 세부정보</h2>
<form role="form" method="post">
	<input type="hidden" name="p_id" value="${playDTO.p_id }">
</form>
<div class="container" align="center">
	<div class="row">
		<table border="" width="100%" height="800px" align="center">
			<tr height="20%">
				<td>${playDTO.p_id }</td>
				<td colspan="2">${playDTO.p_name }</td>
			</tr>
			<tr>
				<td colspan="3">
				<textarea rows="50%" cols="100%">${playDTO.p_info }</textarea>
				<img src="/playChoice/resources/img/admin/play/${playDTO.p_picture }">
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">글 번호</label>
		<input type="text" name="number" class="form-control" value="${playDTO.p_id }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">글 제목</label>
		<input type="text" name="title" class="form-control" value="${playDTO.p_name }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">글 내용</label>
		<textarea rows="50" cols="50">${playDTO.p_info }</textarea>
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">관련 사진</label>
		<img src="/playChoice/resources/img/admin/play/${playDTO.p_picture }">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">관련 사진 이름</label>
		<input type="text" name="p_picture" class="form-contorl" value="${playDTO.p_picture }" readonly="readonly">
	</div>
</div>
<div class="box-footer">
	<button type="submit" class="btn btn-warning">글 수정</button>
	<button type="submit" class="btn btn-danger">글 삭제</button>
	<button type="submit" class="btn btn-flurry">글 게시</button>
	<button type="submit" class="btn btn-primary">목록으로</button>
</div>


<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "/playChoice/admin/play/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "/playChoice/admin/play/remove");
			formObj.submit();
		});
		$(".btn-flurry").on("click", function(){
			formObj.attr("action", "/playChoice/admin/play/flurry");
			formObj.submit();
		});
		$(".btn-primary").on("click", function(){
			self.location="/playChoice/admin/play/aplist";
		});
	});
</script>