<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<jsp:include page="../../../page/header.jsp" />

<jsp:include page="../integratedheader.jsp" />
<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<a href="insertActor"> 배우 등록</a>
				<h4>배우 관리페이지</h4>
				<table class="table table-striped" border="">
					<thead>
						<tr>
							<th>번호</th>
							<td>${actor.a_id}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${actor.a_name}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${actor.a_birthStr}</td>
						</tr>
						<tr>
							<th>홈페이지</th>
							<td>${actor.a_homepage}</td>
						</tr>
						<tr>
							<th>사진</th>
							<td><img alt="${dd.a_name}" src="${pageContext.request.contextPath}/resources/img/actor/${actor.a_picture}"></td>
						</tr>
						<tr>
							<th>삭제 여부</th>
							<td>${actor.a_deleted}</td>
						</tr>
					</thead>
				</table>
				<button class="btn btn-primary btn-small"
					onclick="location.href='${pageContext.request.contextPath}/admin/site/actor/update?a_id=${actor.a_id}'">
					수정
				</button>

			</div>
		</div>
	</div>
</div>