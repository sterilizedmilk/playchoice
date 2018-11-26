<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />
<%-- <jsp:include page="../member/viewheader.jsp" /> --%>

<div class="container">
	<div class="row-fluid">
		<div class="span2">
			<jsp:include page="../member/viewheader2.jsp" />
		</div>
		<!-- /.span2 -->
		<div class="span10">
			<ul class="breadcrumb">
			 	<li><a href="#"><i class="icon-home"></i></a> <span class="divider">/</span></li>
			  	<li><a href="#">마이페이지</a> <span class="divider">/</span></li>
			  	<li class="active">찜한 연극</li>
			</ul>
			<c:choose>
				<c:when test="${fn:length(list) == 0 }">
					<span>찜한 연극 목록이 비어있습니다.</span>
				</c:when>
				<c:otherwise>
					<form id="basketListForm" name="basketListForm" action="post">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>연극명</th>
									<th>장르</th>
									<th>연극정보</th>
									<!-- <th>삭제</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${list }" varStatus="status">
									<tr>
										<td><a href="${pageContext.request.contextPath}/play/playdetail?p_id=${result.p_id}">${result.p_name }</a></td>
										<td>${genreMap.get(result.g_id) }</td><!-- map.get()대신에 ${genreMap[result.g_id]}으로도 가능 -->
										<td>${result.p_info }</td>
										<td><a href="${pageContext.request.contextPath}/basket/delete?p_id=${result.p_id}"
											class="btn btn-danger" title="찜한 연극 삭제">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- /.span10 -->
	</div>
	<!-- /.row-fluid -->
</div>
<!-- /.container -->

<jsp:include page="../page/footer.jsp" />