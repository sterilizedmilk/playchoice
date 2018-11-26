<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

<jsp:include page="../../page/header.jsp" />

<meta charset="UTF-8">
<title>Insert title here</title>

<h2 align="center">글 수정</h2>
<div class="container" align="center">
	<div class="row">
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
			<textarea class="form-control" name="p_info" style="width: 50%; height: 300px">${playDTO.p_info }</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">환불 규정</label>
			<textarea class="form-control" name="p_refund_policy" style="width: 50%; height: 300px">${playDTO.p_refund_policy }</textarea>
		</div>
		
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">대문 포스터 변경</label>
			<input type="file" name="p_image" value="${playDTO.p_image0 }">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 변경 1</label>
			<input type="file" name="p_image" value="${playDTO.p_image1 }">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 변경 2</label>
			<input type="file" name="p_image" value="${playDTO.p_image2 }">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 변경 3</label>
			<input type="file" name="p_image" value="${playDTO.p_image3 }">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 변경 4</label>
			<input type="file" name="p_image" value="${playDTO.p_image4 }">
		</div>
		<div class="form-group">
			<label>장르</label>
			<select name="g_id">
				<option value="1">로맨틱코미디</option>
				<option value="2">공포/스릴러</option>
				<option value="3">드라마</option>
				<option value="4">코믹</option>
				<option value="5">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label>지역</label>
			<select name="a_id">
				<option value="1">서울/대학로</option>
				<option value="2">서울/기타</option>
				<option value="3">경기</option>
				<option value="4">대전/충청</option>
				<option value="5">부산/대구/경상</option>
				<option value="6">광주/전주/전라</option>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">찾아오시는길(상세 주소)</label>
			<input type="text" name="p_location" class="form-control" value="${playDTO.p_location }">
		</div>
	</div>
</form>

<div class="box-footer">
	<button type="submit" class="btn btn-primary">변경</button>
	<input type="button" onclick="history.go(-1)" value="취소">
</div>
		
	</div>
</div>


<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
				
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
	});
</script>
