<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<div class="container">
	<h3>${actorDTO.a_name}</h3>
	<table class="table table-striped rable-hover">
		<thead>
			<tr>
				<th>사진</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>홈페이지</th>
				<!-- <th>찜하기</th> -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img src="<c:url value="/"/>resources/img/actor/${actorDTO.a_picture }" width="170px" height="170px" style="padding:10px"/></td>
				<td>${actorDTO.a_name}</td>
				<td>${actorDTO.sdf}</td>
				<td><a href="http://${actorDTO.a_homepage}" target="_blank">${actorDTO.a_homepage}</a></td>
				<%-- <td><button id="basketBtn" class="btn btn-info basketBtn" data-actor="${actor.a_id }">찜</button></td> --%>
			</tr>
			</tbody>
	</table>
	<br />
	<h5>출연작품</h5>
	<c:choose>
		<c:when test="${fn:length(appearDTO) == 0 }">
			<span>출연 작품이 없습니다.</span>
		</c:when>
		<c:otherwise>
			<c:forEach items="${appearDTO}" var="appear" varStatus="status">
			<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 180px; height: 320px;">
				<div>
					<a href="playdetail?p_id=${appear.p_id }">
						<%-- <img src="${pageContext.request.contextPath}/resources/img/play/${appear.p_image0 }"> --%>
					</a>
				</div>
				<div>
					<p><a href="playdetail?p_id=${appear.p_id }">${appear.p_id }</a></p>
					<p style="float: left; font-style: italic;">최저 가격</p>
				</div>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
</div>
<!-- /.container -->

<jsp:include page="../page/footer.jsp" />
