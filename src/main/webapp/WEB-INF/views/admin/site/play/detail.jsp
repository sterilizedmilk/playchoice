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
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>연극 번호</th>
							<td>${play.p_id}</td>
						</tr>
						<tr>
							<th>연극 제목</th>
							<td>${play.p_name}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><a href="${pageContext.request.contextPath}/admin/site/member/detail?m_code=${playAdmin.m_code}">${playAdmin.m_id}</a></td>
						</tr>
						<tr>
							<th>장르</th>
							
							<td>${genreMap[play.g_id]}</td>
						</tr>
						<tr>
							<th>지역</th>
							<td>${areaMap[play.a_id]}</td>
						</tr>
						<tr>
							<th>글 게시 상태</th>
							<td>${play.p_status}</td>
						</tr>
						<tr>
							<th>소개</th>
							<td>${play.p_info}</td>
						</tr>
						<tr>
							<th>위치</th>
							<td>${play.p_location}</td>
						</tr>
						<tr>
							<th>환불정책</th>
							<td>${play.p_refund_policy}</td>
						</tr>
						<tr>
							<th>포스터</th>
							<td><img src="${pageContext.request.contextPath}/resources/img/play/${play.p_image0}"></td>
						</tr>
						<c:if test="${play.p_image1 != null}">
							<tr>
								<th>이미지1</th>
								<td><img src="${pageContext.request.contextPath}/resources/img/play/${play.p_image1}"></td>
							</tr>
						</c:if>
						<c:if test="${play.p_image2 != null}">
							<tr>
								<th>이미지2</th>
								<td><img src="${pageContext.request.contextPath}/resources/img/play/${play.p_image2}"></td>
							</tr>
						</c:if>
						<c:if test="${play.p_image3 != null}">
							<tr>
								<th>이미지3</th>
								<td><img src="${pageContext.request.contextPath}/resources/img/play/${play.p_image3}"></td>
							</tr>
						</c:if>
						<c:if test="${play.p_image4 != null}">
							<tr>
								<th>이미지4</th>
								<td><img src="${pageContext.request.contextPath}/resources/img/play/${play.p_image4}"></td>
							</tr>
						</c:if>
						
					</tbody>
				</table>
				
				<form action="status" method="post">
					<input type="hidden" name="id" value="${play.p_id}">
					<c:choose>
						<c:when test="${play.p_status == true}">
							<input type="hidden" name="p_status" value="0">
							<button class="btn btn-primary btn-small">내리기</button>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="p_status" value="1">
							<button class="btn btn-primary btn-small">올리기</button>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
		</div>
	</div>
</div>

