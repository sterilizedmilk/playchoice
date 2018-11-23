<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menu.jsp"></jsp:include>
<section id="inner-headline">
<div class="container">
	<div class="row">
		<div class="span12">
			<h4 style="color: white">전체 일정</h4>
			<table class="table">
				<thead>
					<tr>
						<td><strong>장르</strong></td>
						<td>전체보기</td>
						<td>연극</td>
						<td>뮤지컬</td>
						<td>콘서트</td>
						<td>가족 및 아동</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><strong>지역</strong></td>
						<td>전체보기</td>
						<td>대학로</td>
						<td>서울</td>
						<td>경기</td>
						<td>대전/충청</td>
						<td>부산/대구/경상</td>
						<td>광주/전라</td>
						<td>제주</td>
					</tr>
					<tr>
						<td><strong>일정</strong></td>
						<td>전체보기</td>
						<td>오늘(11/11)</td>
						<td>내일(11/12)</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<section id="content">
<div class="container">
	<div class="row">
		<div class="span12">
			<div class="clearfix"></div>
			<div class="row">
				<section id="projects">
				<ul id="thumbs" class="portfolio">
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-01-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-01.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 design" data-id="id-1"
						data-type="icon">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-02-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-02.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 photography" data-id="id-2"
						data-type="graphic">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-03-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-03.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-04-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-04.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 photography" data-id="id-4"
						data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-05-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-05.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 photography" data-id="id-5"
						data-type="icon">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-06-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-06.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<li class="item-thumbs span3 design" data-id="id-0" data-type="web">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-07-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-07.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
					<!-- Item Project and Filter Name -->
					<li class="item-thumbs span3 design" data-id="id-0"
						data-type="graphic">
						<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
						class="hover-wrap fancybox" data-fancybox-group="gallery"
						title="Portfolio name"
						href="${pageContext.request.contextPath}/resources/img/works/full/image-08-full.jpg">
							<span class="overlay-img"></span> <span
							class="overlay-img-thumb font-icon-plus"></span>
					</a> <!-- Thumb Image and Description --> <img
						src="${pageContext.request.contextPath}/resources/img/works/thumbs/image-08.jpg"
						alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
					</li>
					<!-- End Item Project -->
				</ul>
				</section>
			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>