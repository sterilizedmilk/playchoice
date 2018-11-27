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
					<h2>찜한 연극</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>찜한 연극</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<jsp:include page="../member/viewLeftside.jsp" />
			<div class="row">
				<div class="span8">
					<c:choose>
						<c:when test="${fn:length(list) == 0 }">
							<span>찜한 연극이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<form id="basketListForm" name="basketListForm" action="post">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>사진</th>
											<th>연극명</th>
											<th>장르</th>
											<th>연극정보</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${list }" varStatus="status">
											<tr>
												<td><img src="${pageContext.request.contextPath}/resources/img/play/thumb_${result.p_image0}" width="200px"></td>
												<td style="line-height: 250px;"><a
													href="${pageContext.request.contextPath}/play/playdetail?p_id=${result.p_id}">${result.p_name }</a></td>
												<td style="line-height: 250px;">${genreMap.get(result.g_id) }</td><!-- map.get()대신에 ${genreMap[result.g_id]}으로도 가능 -->
												<td style="line-height: 250px;">${result.p_info }</td>
												<td style="line-height: 250px;"><a
													href="${pageContext.request.contextPath}/basket/delete?p_id=${result.p_id}"
													class="btn btn-danger" title="찜한 연극 삭제">삭제</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</c:otherwise>
					</c:choose>
				</div><!-- /.span8 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<jsp:include page="../page/footer.jsp" />