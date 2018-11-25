<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../../page/header.jsp" />
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
	
	function updateArea(a_id) {
		var newName = prompt("change to what?");
		if (newName === null)
			return;
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/site/area/edit",
			type: "post",
			data: {"a_id" : a_id, "a_name" : newName},
			success: function(data) {
				alert("success : " + data);
			},
			error: function(data) {
				alert("error : " + data);
			}
		})
	}
</script>



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
					<td><button onclick="updateArea(${area.a_id})">수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p> 새 지역</p>
	
	<form id="addArea" onsubmit="return addArea();">
		<input type="text" name="a_name">
		<input type="submit">
	</form>

