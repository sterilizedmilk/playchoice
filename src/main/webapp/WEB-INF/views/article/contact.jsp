<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="http://localhost:8080/playChoice/article/" var="uuu" />

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
					<li><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
					<li>고객센터<i class="icon-angle-right"></i></li>
					<li class="active">1:1문의</li>
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
					<h4>1:1문의</h4>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>글 번호</th>
								<th colspan="6">제목</th>
								<th>아이디</th>
								<th>작성일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반복문 작성  -->
							<c:forEach items="${data }" var="dd" varStatus="no">
								<tr>
									<td>${no.index +1 }</td>
									<td colspan="6"><a href="detail?a_id=${dd.a_id }">${dd.a_title }</a></td>
									<td>${login.m_id }</td>
									<td>${dd.a_time }</td>
									<td>${dd.a_solved }</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="10">
									<button type="button" class="btn btn-square btn-theme"
										style="width: 100%"
										onclick="location.href='${uuu }contact/userinsert'">글쓰기</button>
								</td>
							</tr>
						</tbody>
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