<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>배우조회</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>배우목록<i class="icon-angle-right"></i></li>
					<li class="active">배우조회</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span8 offset2">
				<form action="">
				<fieldset>
				<legend>${actorDTO.a_name}</legend>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>사진</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>홈페이지</th>
							<th>평점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="<c:url value="/"/>resources/img/actor/${actorDTO.a_picture }" width="170px" height="170px" style="padding:10px"/></td>
							<td style="line-height: 210px;">${actorDTO.a_name}</td>
							<td style="line-height: 210px;">${actorDTO.sdf}</td>
							<td style="line-height: 210px;"><a href="http://${actorDTO.a_homepage}" target="_blank">${actorDTO.a_homepage}</a></td>
							<td style="line-height: 210px;">${reviewScore}</td>
						</tr>
						</tbody>
				</table>
				
				<legend>출연작품</legend>
				<c:choose>
					<c:when test="${fn:length(appearDTO) == 0 }">
						<span>출연 작품이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${appearDTO}" var="appear" varStatus="status">
						<c:choose>
							<c:when test="${appear.p_status }">
									<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 200px; height: 360px;">
								<div>
									<a href="${pageContext.request.contextPath}/play/playdetail?p_id=${appear.p_id }">
										<img src="${pageContext.request.contextPath}/resources/img/play/thumb_${appear.p_image0 }"  width="200px">
									</a>
								</div>
								<div>
									<p><a href="${pageContext.request.contextPath}/play/playdetail?p_id=${appear.p_id }">${appear.p_name }</a></p>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 200px; height: 360px;">
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/play/thumb_${appear.p_image0 }"  width="200px">
								</div>
								<div>
									<p>${appear.p_name }(상영종료)</p>
								</div>
							</div>
							</c:otherwise>
						</c:choose>
						<%-- <c:if test="${appear.p_status }">
							<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 200px; height: 360px;">
								<div>
									<a href="${pageContext.request.contextPath}/play/playdetail?p_id=${appear.p_id }">
										<img src="${pageContext.request.contextPath}/resources/img/play/thumb_${appear.p_image0 }"  width="200px">
									</a>
								</div>
								<div>
									<p><a href="${pageContext.request.contextPath}/play/playdetail?p_id=${appear.p_id }">${appear.p_name }</a></p>
								</div>
							</div>
						</c:if>
							<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 200px; height: 360px;">
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/play/thumb_${appear.p_image0 }"  width="200px">
								</div>
								<div>
									<p>${appear.p_name }</p>
								</div>
							</div> --%>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</fieldset>
				</form>
			</div><!-- /.span8 offset2 -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<jsp:include page="../page/footer.jsp" />
