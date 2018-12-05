<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<jsp:include page="../../../page/header.jsp" />
<jsp:include page="../integratedheader.jsp" />
<script>
$(document).ready(function(){
	if
})
</script>
<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>배우 관리페이지</h4>
				<form action="" method="POST" enctype="multipart/form-data">
					<table class="table table-striped" border="">
						<thead>
							<tr>
								<th>번호</th>
								<td>${actor.a_id}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="a_name" value="${actor.a_name}"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="a_birthStr" value="${actor.a_birthStr}"></td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td><input type="text" name="a_homepage" value="${actor.a_homepage}"></td>
							</tr>
							<tr>
								<th>사진</th>
								<td><input type="file" name="a_file" value="${actor.a_picture}"></td>
							</tr>
							<tr>
								<th>삭제 여부</th>
								<td>
									<select name="a_deleted">
										<option value="0" <c:if test="${actor.a_deleted} == 0"> selected</c:if>>활동중</option>
										<option value="1" <c:if test="${actor.a_deleted} == 1"> selected</c:if>>활동중지</option>
									</select>
									<input type="hidden" name="a_deleted" value="${actor.a_deleted}">
								</td>
							</tr>
						</thead>
					</table>
					<button class="btn btn-primary">제출</button>
				</form>

			</div>
		</div>
	</div>
</div>