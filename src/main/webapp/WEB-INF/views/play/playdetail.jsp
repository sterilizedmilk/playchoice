<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>

<h2 align="center">연극 세부정보</h2>
<form role="form" method="post">
	<input type="hidden" name="p_id" value="${playDTO.p_id }">
</form>
<div class="container" align="center">
	<div class="row">
		<table border="" width="100%" height="800px">
			<tr height="20%">
				<td>${playDTO.p_id }</td>
				<td>${playDTO.p_name }</td>
			</tr>
			<tr>
				<td colspan="2">${playDTO.p_info }</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="../page/footer.jsp" />