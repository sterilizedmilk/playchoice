<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>찜한 배우 목록</h2>
	<c:choose>
		<c:when test="${fn:length(list) == 0 }">
			<span>찜한 배우 목록이 비어있습니다.</span>
		</c:when>
		<c:otherwise>
			<form id="preferListForm" name="preferListForm" action="post">
				<table class="table table-striped rable-hover">
					<thead>
						<tr>
							<th>사진</th>
							<th>성명</th>
							<th>생년월일</th>
							<th>사이트</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list }" varStatus="status">
							<tr>
								<td>${result.a_picture }</td>
								<td><a href="${pageContext.request.contextPath}/actor/detail?a_id=${result.a_id}">${result.a_name }</a></td>
								<td><fmt:formatDate value="${result.a_birth }" pattern="yyyy-MM-dd"/></td>
								<td>${result.a_homepage }</td>
								<td><a href="${pageContext.request.contextPath}/prefer/delete?a_id=${result.a_id}">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</div>

<jsp:include page="../page/footer.jsp" />