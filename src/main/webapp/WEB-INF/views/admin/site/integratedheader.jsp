<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Area Management</title>
</head>
<body>
	<h2>관리자 페이지</h2>
	<table border="">
		<tr>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/member/common'">멤버관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/sitemember/common'">사이트관리자 관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/play/common'">연극관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/actor/common'">배우관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/area">지역관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${pageContext.request.contextPath}/admin/site/genre'">장르관리</button></td>

		</tr>
	</table>
</body>
</html>
