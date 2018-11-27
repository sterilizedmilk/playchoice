<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<meta charset="UTF-8">
<title>Payment</title>

<div class="container">
	<div class="row">
		<!-- 좌측 정보 -->
		<div class="col-md-5" style="float: left; position: relative; margin-right: 15px; background: #fff;">
			<h3>${sessionScope.login.m_name}님의 결재내역</h3>
			
			<form action="">
				play id<input type="number" name="play" value="${param.play}"><br>
				schedule id<input type="number" name="schedule" value="${param.schedule}"><br>
				
				from<input type="date" name="from" value="${param.from}"><br>
				until<input type="date" name="until" value="${param.until}"><br>
				
				watched<input type="checkbox" name="watched" value="true" ${param.watched == true ? 'checked' : ''} ><br>
				
				page<input type="number" name="page" value="${param.page}"><br>
				<button>검색</button>
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
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />
