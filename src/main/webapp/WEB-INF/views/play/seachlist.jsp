<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<jsp:include page="../page/header.jsp" />
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>검색 결과</h2>
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
								</div></li>
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