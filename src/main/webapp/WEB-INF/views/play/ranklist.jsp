<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../page/header.jsp" />
<style>
	.medal {display: block; position: absolute; top: 0px; left: 0px; width: 36px; height: 36px;}
	.medal.gold {top: -18px;left:-18px; width:90px; height:90px; background: url(${pageContext.request.contextPath}/resources/img/medal_gold.png) 0 0 no-repeat; background-size: cover;}
	.medal.silver { background: url(${pageContext.request.contextPath}/resources/img/medal_silver.png) 0 0 no-repeat; background-size: cover;}
	.medal.bronze { background: url(${pageContext.request.contextPath}/resources/img/medal_bronze.png) 0 0 no-repeat; background-size: cover;}
</style>
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
			<div class="span12">
				<h4>예매 순위 Best 10</h4>
				<section id="projects">
					<ul id="thumbs" class="portfolio">
						<c:forEach items="${list}" var="li" varStatus="status">
							<li style="width: 200px;" class="item-thumbs span3 design" data-id="id-0" data-type="graphic"><a class="hover-wrap fancybox" data-fancybox-group="gallery" href="${pageContext.request.contextPath}/play/playdetail?p_id=${li.p_id }">
									<span class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
								</a> <img src="${pageContext.request.contextPath}/resources/img/play/thumb_${li.p_image0 }">
								<div>
									<p>
										<a href="playdetail?p_id=${li.p_id }">${li.p_name }</a>
									</p>
									<p style="float: left; font-style: italic;">최저 가격</p>
									<p align="right">
										<span style="font-size: 20px; color: #FF5E00">${li.lowest_price}</span> 원 ~
									</p>
								</div>
								<c:choose>
									<c:when test="${status.index == 0}">
										<span class="medal gold"></span>
									</c:when>
									<c:when test="${status.index == 1}">
										<span class="medal silver"></span>
									</c:when>
									<c:when test="${status.index == 2}">
										<span class="medal bronze"></span>
									</c:when>
								</c:choose>		
							</li>
						</c:forEach>
					</ul>
				</section>
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