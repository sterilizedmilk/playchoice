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
			
			<div>
				<h4>티켓정보</h4>
				<div>연극 제목 : ${play.p_name}</div>
				<div>연극 장소 : ${play.p_location}</div>
				<div>연극 일시 : <fmt:formatDate value="${schedule.s_time}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></div>
			</div>
			
			<br>
			<c:if test="${payment.p_cancel_target_id != 0}">
				<h5>환불함</h5>
			</c:if>
			
			<div>
				<h4>결제정보</h4>
				<div>일시 : <fmt:formatDate value="${payment.p_time}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></div>
				<div>금액 : ${payment.p_price}</div>
				<div>매수 : ${payment.p_quantity}</div>
			</div>
				
			<div>
				<h4>이용자정보</h4>
				<div>이름 : ${buyer.m_name}</div>
				<div>전화번호 : ${buyer.m_phone}</div>
			</div>
			<br>
		
			<c:if test="${payment.p_canceled == 1}">
				<div>
					<h4>취소됨</h4>
				</div>
			</c:if>
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />
