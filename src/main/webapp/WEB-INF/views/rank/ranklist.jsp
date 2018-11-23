<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<jsp:include page="../page/header.jsp" />
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>주간랭킹</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<!-- Default table -->
			<h4>예매 순위 Best 10</h4>
			<c:forEach items="${list}" var="li" varStatus="status">
				<div style="outline: 1px solid #8C8C8C; float: left; margin: 15px; width: 180px; height: 320px;">
					<div>
						<a href="playdetail?p_id=${li.p_id }">
							<img src="${pageContext.request.contextPath}/resources/img/play/${li.p_image0 }">
						</a>
					</div>
					<div>
						<p>
							<a href="playdetail?p_id=${li.p_id }">${li.p_name }</a>
						</p>
						<p style="float: left; font-style: italic;">최저 가격</p>
						<p align="right">
							<span style="font-size: 20px; color: #FF5E00">${li.lowest_price}</span> 원 ~
						</p>
					</div>
				</div>
			</c:forEach>
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