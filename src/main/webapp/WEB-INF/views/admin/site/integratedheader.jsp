<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/admin/site/"
	var="sitemanager" />
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
					onclick="location.href='${sitemanager }member/common'">멤버관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${sitemanager }sitemember/common'">사이트
					관리자 관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${sitemanager }play/common'">연극관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${sitemanager }actor/common'">배우관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${sitemanager }area">지역관리</button></td>
			<td><button name="member" value=""
					onclick="location.href='${sitemanager }genre'">장르관리</button></td>

		</tr>
	</table>