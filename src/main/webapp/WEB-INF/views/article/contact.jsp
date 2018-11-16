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
					<li><a href="#"><i class="icon-home"></i></a><i
						class="icon-angle-right"></i></li>
					<li><a href="customergongi">고객센터</a><i
						class="icon-angle-right"></i></li>
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
								<th colspan="2">제목</th>
								<th>아이디</th>
								<th>작성일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반복문 작성  -->
							<tr>
								<td>${no.index }</td>
								<td colspan="2"><a href="detail?id=${board.id }">${board.title }</a></td>
								<td>${dd.name }</td>
								<td>${dd.reg_date }</td>
								<td>${dd.confirm }</td>
							</tr>
							<!-- 반복문 작성  -->
							<tr>
								<td colspan="8">
									<button type="button" class="btn btn-square btn-theme"
										style="width: 100%"
										onclick="location.href='customerprivatewrite'">글쓰기</button>
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