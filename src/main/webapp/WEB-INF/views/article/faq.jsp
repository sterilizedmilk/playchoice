<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>고객센터</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>고객센터<i class="icon-angle-right"></i></li>
					<li class="active">FAQ</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<jsp:include page="leftside.jsp" />
			<!-- Default table -->
			<div class="row">
				<div class="span8">
					<h4>자주 묻는 질문</h4>
					<table class="table table-striped">
						<thead>
							<c:forEach items="${data }" var="dd" varStatus="no">

								<tr>
									<th colspan="4">
										<a href="detail?a_id=${dd.a_id }">Q. ${dd.a_title }</a>
									</th>
								</tr>
							</c:forEach>
							<c:if test="${login.m_level eq 2}">
								<tr>
									<td colspan="8">
										<button type="button" class="btn btn-square btn-theme" style="width: 100%" onclick="location.href='${pageContext.request.contextPath}/article/faq/insert'">글쓰기</button>
									</td>
								</tr>
							</c:if>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<!-- divider -->
		<div class="row">
			<div class="span12">
				<div class="solidline"></div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../page/footer.jsp" />