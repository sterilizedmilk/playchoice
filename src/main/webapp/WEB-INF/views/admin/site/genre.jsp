<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>Genre Management</title>
<jsp:include page="../../page/header.jsp" />
<script>
	function addGenre() {
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/site/genre/add",
			type: "post",
			async: false,
			data: $("#addGenre").serialize(),
			success: function(data) {
				alert("성공적으로 추가되었습니다.");
			},
			error: function(data) {
				alert("error : " + data);
			}
		})
		window.location.reload();
		return false;
	}
	
	function updateGenre(g_id) {
		var newName = prompt("장르의 새 이름을 입력하세요.");
		if (newName === null)
			return;
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/site/genre/edit",
			type: "post",
			async: false,
			data: {"g_id" : g_id, "g_name" : newName},
			success: function(data) {
				alert("성공적으로 수정되었습니다.");
			},
			error: function(data) {
				alert("error : " + data);
			}
		})
		window.location.reload();
	}

</script>


<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<jsp:include page="integratedheader.jsp" />
				<h2>장르 관리</h2>

				<table class="table table-striped" border="1">
					<thead>
						<tr>
							<th>id</th>
							<th>이름</th>
							<th>수정</th>
						</tr>
					</thead>
					<c:forEach var="genre" items="${genreList}">
						<tr>
							<td>${genre.g_id}</td>
							<td>${genre.g_name}</td>
							<td><button class="btn btn-primary btn-small" onclick="updateGenre(${genre.g_id})">수정</button></td>
						</tr>
					</c:forEach>
				</table>
				새 장르
				<form id="addGenre" onsubmit="return addGenre();">
					<input type="text" name="g_name"> <input class="btn btn-primary btn-small" type="submit">
				</form>
			</div>
		</div>
	</div>
</div>
