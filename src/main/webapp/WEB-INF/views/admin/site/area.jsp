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

<div class="container">
	<div class="row">
		<div class="row">
			<div class="span8">

				<jsp:include page="integratedheader.jsp" />
				<h2>지역 관리</h2>

				<table class="table table-striped" border="1">
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
								<td><button class="btn btn-primary btn-small" onclick="updateArea(${area.a_id})">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p>새 지역</p>

				<form id="addArea" onsubmit="return addArea();">
					<input type="text" name="a_name"> <input class="btn btn-primary btn-small" type="submit">
				</form>
			</div>
		</div>
	</div>
</div>

