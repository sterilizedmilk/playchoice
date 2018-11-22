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
							<tr>
								<th colspan="4"><a href="detail?id=${board.id }"> Q.
										티켓은 어떻게 사용하죠?</a></th>
							</tr>
							<tr>
								<th colspan="4"><a href="detail?id=${board.id }"> Q. 환불
										및 취소는 어떻게 하나요?</a></th>
							</tr>
							<tr>
								<th colspan="4"><a href="detail?id=${board.id }"> Q. 구매
										후 영수증은 어떻게 발급받나요?</a></th>
							</tr>
							<tr>
								<th>글 번호</th>
								<th colspan="3">제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${data }" var="dd" varStatus="no">
								<tr>
									<td>${no.index +1}</td>
									<td colspan="2"><a href="detail?id=${dd.a_id }">${dd.a_title }</a></td>
								</tr>
							</c:forEach>
							<tr>
								<%-- <c:when test="${empty login }">
								<c:choose>
									
									</c:when>
									<c:otherwise> --%>
								<!-- 관리자일 경우, -->
								<td colspan="8">
									<button type="button" class="btn btn-square btn-theme"
										style="width: 100%"
										onclick="location.href='${uuu }faq/insert'">글쓰기</button>
								</td>
								<%-- </c:otherwise> 
								</c:choose>
 --%>
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