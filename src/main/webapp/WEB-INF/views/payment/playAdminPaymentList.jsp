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
			<h3>결재내역</h3>
			
			<form action="">
				member id<input type="number" name="member" value="${param.member}"><br>
				play id<input type="number" name="play" value="${param.play}"><br>
				schedule id<input type="number" name="schedule" value="${param.schedule}"><br>
				
				from<input type="date" name="from" value="${param.from}"><br>
				until<input type="date" name="until" value="${param.until}"><br>
				
				page<input type="number" name="page" value="${param.page}"><br>
				<button>검색</button>
			</form>
			
			<table border="1">
				<thead>
					<tr>
						<th>payment_id</th>
						<th>m_code</th>
						<th>s_id</th>
						<th>p_price</th>
						<th>p_quantity</th>
						<th>p_cancel_target_id</th>
						<th>p_time</th>
						<th>p_canceled</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="sum" value="0"/>
					<c:forEach var="pay" items="${paymentList}">
						<c:set var="sum" value="${sum + pay.p_price}" />
						<tr>
							<td>${pay.p_id}</td>
							<td>${pay.m_code}</td>
							<td>${pay.s_id}</td>
							<td>${pay.p_price}</td>
							<td>${pay.p_quantity}</td>
							<td>${pay.p_cancel_target_id}</td>
							<td><fmt:formatDate value="${pay.p_time}"/></td>
							<td>${pay.p_canceled}</td>
							<td><button onclick="location.href='${pageContext.request.contextPath}/payment/info?p_id=${pay.p_id}'" >정보</button></td>
						</tr>
					</c:forEach>
					<c:if test="${paymentList.size() == 0}">
						<tr>
							<td colspan="8">결제 내역이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div>
				총액 : ${sum}
			</div>
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />
