<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>장바구니 목록</h2>
	<c:choose>
		<c:when test="${fn:length(list) == 0 }">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
			<form id="basketListForm" name="basketListForm" action="post">
				<table class="table table-striped rable-hover">
					<thead>
						<tr>
							<th>연극명</th>
							<th>장르</th>
							<th>연극정보</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list }" varStatus="status">
							<tr>
								<td>${result.p_name }</td>
								<td><c:out value="${result.g_id }"></c:out></td>
								<td>${result.p_info }</td>
								<td><a href="${pageContext.request.contextPath}/basket/delete?p_id=${result.p_id}">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="button-group">
					<button type="button">button</button>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
	
</div>

<jsp:include page="../page/footer.jsp" />