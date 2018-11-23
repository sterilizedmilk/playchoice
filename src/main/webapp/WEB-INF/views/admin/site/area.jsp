<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Area Management</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script>
	function addArea() {
		console.log($("#addArea").serialize());
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/site/area/add",
			type: "post",
			data: $("#addArea").serialize(),
			success: function(data) {
				alert("success : " + data);
			},
			error: function(data) {
				alert("error : " + data);
			}
		})
		return false;
	}
	
	function deleteArea(a_id) {
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/site/area/delete",
			type: "post",
			data: {"a_id" : a_id},
			success: function(data) {
				alert("success : " + data);
			},
			error: function(data) {
				alert("error : " + data);
			}
		})
	}
</script>

</head>

<jsp:include page="integratedheader.jsp" />
	<h2>Area Management</h2>


	<table border="1">
		<thead>
			<tr>
				<th>area id</th>
				<th>name</th>
				<th>delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="area" items="${areaList}">
				<tr>
					<td>${area.a_id}</td>
					<td>${area.a_name}</td>
					<td><button onclick="deleteArea(${area.a_id})">X</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	새 지역
	<form id="addArea" onsubmit="return addArea();">
		<input type="text" name="a_name">
		<input type="submit">
	</form>


</body>
</html>