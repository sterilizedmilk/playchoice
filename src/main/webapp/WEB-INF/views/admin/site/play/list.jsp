<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../../../page/header.jsp" />

<div class="container">
	<div class="row">
		<div class="row">
			<div class="span8">

				<jsp:include page="../integratedheader.jsp" />
				<h2>연극 관리</h2>

				<table class="table table-bordered" >
					<tbody>
						<tr>
							<th>연극 번호</th>
							<th>연극 제목</th>
							<th>장르</th>
							<th>지역</th>
							<th>작성자</th>
							<th>글 게시 상태</th>
						</tr>
					<c:forEach items="${playList}" var="play">
						<tr>
								<td>${play.p_id}</td>
								<td><a href="detail?id=${play.p_id}">${play.p_name}</a></td>
							<td>${genreMap[play.g_id]}</td>
							<td>${areaMap[play.a_id]}</td>
							<td></td>
							<td>${play.p_status}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

