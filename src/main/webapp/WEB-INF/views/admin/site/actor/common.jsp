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
				<a class="btn btn-success" href="insertActor"> 배우 등록</a>
				<h4>배우 관리페이지</h4>
				<table class="table table-striped" border="">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>홈페이지</th>
							<th>사진</th>
							<th>삭제 여부</th>
							<th>수정</th>
						</tr>
					</thead>
					
					<c:forEach items="${actorlist}" var="dd" varStatus="no">
						<tr>
							<td>${dd.a_id}</td>
							<td>${dd.a_name}</td>
							<td>${dd.a_birthStr}</td>
							<td>${dd.a_homepage}</td>
							<td><img alt="${dd.a_name}" src="${pageContext.request.contextPath}/resources/img/actor/${dd.a_picture}"></td>
							<td>${dd.a_deleted}</td>
							<td><button class="btn btn-primary btn-small" title="상세보기"
								onclick="location.href='${pageContext.request.contextPath}/admin/site/actor/detail?a_id=${dd.a_id}'">상세
							</button></td>

						</tr>
					</c:forEach>
					
				</table>

			</div>
		</div>
	</div>
</div>