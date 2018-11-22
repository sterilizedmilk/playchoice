<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h2>장바구니 목록</h2>
	<form id="basketListForm" name="basketListForm" action="post">
		<table class="table table-striped rable-hover">
			<thead>
				<tr>
					<th>연극명</th>
					<th>장르</th>
					<th>연극정보</th>
					<th>극장명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${list }" varStatus="status">
					<tr>
						<td>${result.p_name }</td>
						<td><c:out value="${result.g_id }"></c:out></td>
						<td>${result.p_info }</td>
						<td>${result.p_location }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="button-group">
			<button type="button">삭제</button>
		</div>
	</form>
</div>

<jsp:include page="../page/footer.jsp" />