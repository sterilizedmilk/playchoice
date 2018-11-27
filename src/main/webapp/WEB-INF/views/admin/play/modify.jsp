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
<jsp:include page="adminheader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>글 수정</h2>
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
	
				<div class="control-group">
					<label class="control-label" for="p_id">연극 번호</label>
					<div class="controls">
						<input type="text" name="p_id" id="p_id" value="${playDTO.p_id }" readonly="readonly">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="p_name">연극 제목</label>
					<div class="controls">
						<input type="text" name="p_name" id="p_name" value="${playDTO.p_name }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="p_info">연극 내용</label>
					<div class="controls">
						<textarea name="p_info" id="p_info" style="width:100%; height: 300px">${playDTO.p_info }</textarea>
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="p_refund_policy">환불 규정</label>
					<div class="controls">
						<textarea name="p_refund_policy" id="p_refund_plicy" style="width:100%; height: 300px">${playDTO.p_refund_policy }</textarea>
						<span class="help-block"></span>
					</div>
				</div>
				
				<div class="control-group" id="fileDiv">
					<label class="control-label" for="p_image0">대문 포스터 변경 및<br/> 썸네일 생성</label>
					<div class="controls">
						<input type="file" name="p_image" value="${playDTO.p_image0 }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group" id="fileDiv">
					<label class="control-label" for="p_image1">메인 썸네일 포스터 변경</label>
					<div class="controls">
						<input type="file" name="p_image" value="${playDTO.p_image1 }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group" id="fileDiv">
					<label class="control-label" for="p_image2">내용 포스터 변경 1</label>
					<div class="controls">
						<input type="file" name="p_image" value="${playDTO.p_image2 }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="contorl-group" id="fileDiv">
					<label class="control-label" for="p_image3">내용 포스터 변경 2</label>
					<div class="controls">
						<input type="file" name="p_image" value="${playDTO.p_image3 }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group" id="fileDiv">
					<label class="control-label" for="p_image4">내용 포스터 변경 43/label>
					<div class="controls">
						<input type="file" name="p_image" value="${playDTO.p_image4 }">
						<span class="help-block"></span>
					</div>
				</div>
				<div class="contorl-group">
					<label class="control-label" for="g_id">장르</label>
					<div class="controls">
						<select name="g_id">
							<option value="1">로맨틱코미디</option>
							<option value="2">공포/스릴러</option>
							<option value="3">드라마</option>
							<option value="4">코믹</option>
							<option value="5">기타</option>
						</select>
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="a_id">지역</label>
					<div class="controls">
						<select name="a_id">
							<option value="1">서울/대학로</option>
							<option value="2">서울/기타</option>
							<option value="3">경기</option>
							<option value="4">대전/충청</option>
							<option value="5">부산/대구/경상</option>
							<option value="6">광주/전주/전라</option>
						</select>
						<span class="help-block"></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="p_location">찾아오시는길(상세 주소)</label>
					<div class="controls">
						<input type="text" name="p_location" id="p_location" value="${playDTO.p_location }">
						<span class="help-block"></span>
					</div>
				</div>	
			</form>
						
			<div class="control-group" align="center">
				<button type="submit" class="btn btn-primary">변경</button>
				<input type="button" onclick="history.go(-1)" value="취소">
			</div>
		</div>	
	</div>
</div>
</section>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
				
		$(".btn-primary").on("click", function(){
			//formObj.attr("action", "${pageContext.request.contextPath}/admin/play/apread?p_id=${palyDTO.p_id}");
			formObj.submit();
		});
	});
</script>
<jsp:include page="../../page/footer.jsp" />