<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<jsp:include page="/WEB-INF/views/admin/play/adminheader.jsp" />
<meta charset="UTF-8">
<title>Payment</title>

<div class="container">
	<div class="row">
		<!-- 좌측 정보 -->
		<div class="col-md-5" style="float: left; position: relative; margin-right: 15px; background: #fff;">
			<h3>결재내역</h3>
			

			
			<table class="table">
				<thead>
					<tr>
						<th>결제 시간</th>
						<th>결제 id</th>
						<th>회원</th>
						<th>연극 제목</th>
						<th>일정 id</th>
						<th>금액</th>
						<th>매수</th>
						<th>상영 시간</th>
						<th>비고</th>
						<th>정보 보기</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="sum" value="0"/>
					<c:forEach var="pay" items="${paymentList}">
						<c:set var="sum" value="${sum + pay.p_price}" />
						<tr>
							<td><fmt:formatDate value="${pay.p_time}"/></td>
							<td>${pay.p_id}</td>
							<td><a href="${pageContext.request.contextPath}/admin/site/member/detail?m_code=${pay.m_code}">${pay.m_id}</a></td>
							<td>${pay.p_name}</td>
							<td>${pay.s_id}</td>
							<td>${pay.p_price}</td>
							<td>${pay.p_quantity}</td>
							<td><fmt:formatDate type="both" value="${pay.s_time}"/></td>
							<td>${pay.p_canceled == 1 ? '환불됨' : pay.p_cancel_target_id == 0 ? '' : '환불결제'}</td>
							<td><button onclick="location.href='${pageContext.request.contextPath}/payment/info?p_id=${pay.p_id}'" >정보</button></td>
						</tr>
					</c:forEach>
					<c:if test="${paymentList.size() == 0}">
						<tr>
							<td colspan="10">결제 내역이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div>
				총액 : ${sum}
			</div>
			<br>
			
			<form action="">
				회원 아이디 : <input type="text" name="member" value="${param.member}"><br>
				연극 제목 : <input type="text" name="play" value="${param.play}"><br>
				
                <input type="text" class="form_datetime" name="from" value="${param.from}">부터~
				<input type="text" class="form_datetime" name="until" value="${param.until}">까지<br>
                
				<select name="row">
					<option value="10">-선택-</option>
					<option value="10">10개씩</option>
					<option value="20">20개씩</option>
					<option value="50">50개씩</option>
					<option value="0">제한없이</option>
				</select><br>

				page<input type="number" name="page" value="${param.page}"><br>

				<button>검색</button>
			</form>
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />
