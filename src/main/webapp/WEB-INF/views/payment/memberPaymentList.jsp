<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>결제 내역</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>결제 내역</li>
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
				<%-- <h3>${sessionScope.login.m_name}님의 결재내역</h3> --%>
					<form action="">
						<div class="control-group">
							<label class="control-label" for="p_id">p_id</label>
							<div class="control">
								<input type="number" name="play" value="${param.play}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="s_id">s_id</label>
							<div class="control">
								<input type="number" name="schedule" value="${param.schedule}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="from">from</label>
							<div class="control">
								<input type="date" name="from" value="${param.from}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="until">until</label>
							<div class="control">
								<input type="date" name="until" value="${param.until}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="watched">watched</label>
							<div class="control">
								<input type="checkbox" name="watched" value="true" ${param.watched == true ? 'checked' : ''} >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="page">page</label>
							<div class="control">
								<input type="number" name="page" value="${param.page}">
							</div>
						</div>
					<%-- play id<input type="number" name="play" value="${param.play}"><br> --%>
					<%-- schedule id<input type="number" name="schedule" value="${param.schedule}"><br> --%>
					<%-- from<input type="date" name="from" value="${param.from}"><br> --%>
					<%-- until<input type="date" name="until" value="${param.until}"><br> --%>
					<%-- watched<input type="checkbox" name="watched" value="true" ${param.watched == true ? 'checked' : ''} ><br> --%>
					<%-- page<input type="number" name="page" value="${param.page}"><br> --%>
					<div class="control-group button-group pull-right">
						<button type="button" class="btn btn-success">검색</button>
					</div>
					</form>
				
					<table class="table" border="1">
						<thead>
							<tr>
								<th>결제 시간</th>
								<th>연극 제목</th>
								<th>금액</th>
								<th>매수</th>
								<th>상영 시간</th>
								<th>비고</th>
								<th>정보 보기</th>
							</tr>
						</thead>
					
						<tbody>
							<c:forEach var="pay" items="${paymentList}">
								<tr>
									<td><fmt:formatDate type="both" value="${pay.p_time}"/></td>
									<td>${pay.p_name}</td>
									<td>${pay.p_price}</td>
									<td>${pay.p_quantity}</td>
									<td><fmt:formatDate type="both" value="${pay.s_time}"/></td>
									<td>${pay.p_canceled == 1 ? '취소됨' : pay.p_cancel_target_id == 0 ? '' : '환불'}</td>
									<td><button onclick="location.href='${pageContext.request.contextPath}/payment/info?p_id=${pay.p_id}'" >상세</button></td>
								</tr>
							</c:forEach> 
						</tbody>
					</table>
				</div><!-- 탭 종료 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<jsp:include page="../page/footer.jsp" />
