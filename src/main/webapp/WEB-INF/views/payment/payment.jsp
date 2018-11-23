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
			</div>
			
			<div>
				<h4>예매정보</h4>
				<div>일시 : <fmt:formatDate value="${schedule.s_time}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></div>
				<div>가격 : <span style="text-decoration: line-through;">${schedule.s_price}</span> ${discountedPrice}</div>
				<div>매수 : ${quantity}</div>
				<div>총 금액 : ${discountedPrice * quantity}</div>
			</div>			
	
			<div>
				<h4>이용자정보</h4>
				<div>이름 : ${sessionScope.login.m_name}</div>
				<div>전화번호 : ${sessionScope.login.m_phone}</div>
			</div>

			<div>
				<h4>결제</h4>
				<form action="payAction" method="post">
					<input type="hidden" name="s_id" value="${schedule.s_id}">
					<input type="hidden" name="p_quantity" value="${quantity}">
					카드번호<input type="text" name="cardno"><br>
					유효기간<input type="text" name="validityYear" height="1">/<input type="text" name="validityMonth"><br>
					<button>결제</button>
				</form>
			</div>
			
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />
