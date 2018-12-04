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
					<h2>상세 내역</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>결제 내역<i class="icon-angle-right"></i></li>
					<li>상세 내역</li>
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
					<div class="control-group">
						<c:choose>
							<c:when test="${payment.p_cancel_target_id == 0}">
								<h4>티켓정보</h4>
							</c:when>
							<c:otherwise>
								<h4>환불정보</h4>
							</c:otherwise>
						</c:choose>
						<div class="controls">연극 : <a href="${pageContext.request.contextPath}play/playdetail?p_id=${play.p_id}">
											${play.p_name}
									</a>
						</div>
						<div>연극 장소 : ${play.p_location}</div>
						<div>연극 일시 : <fmt:formatDate value="${schedule.s_time}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></div>
					</div>
				
				<div class="control-group">
					<h4>결제정보</h4>
					<div>일시 : <fmt:formatDate value="${payment.p_time}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></div>
					<div>금액 : ${payment.p_price}</div>
					<div>매수 : ${payment.p_quantity}</div>
				</div>
					
				<div class="control-group">
					<h4>이용자정보</h4>
					<div>이름 : ${sessionScope.login.m_name}</div>
					<div>전화번호 : ${sessionScope.login.m_phone}</div>
				</div>
				<br>
	
				<c:if test="${payment.p_cancel_target_id == 0}">
					<div class="control-group">
						<h4>리뷰</h4>
						<c:choose>
							<c:when test="${canReview}">
								<h5>리뷰 작성하러 가기</h5>
								<form action="${pageContext.request.contextPath}/play/review/write" method="POST">
									<input type="hidden" name="s_id" value="${payment.s_id}">
									<input type="hidden" name="p_id" value="${payment.p_id}">
									<input type="hidden" name="m_code" value="${sessionScope.login.m_code}">
									<button>리뷰작성</button>
								</form>
							</c:when>
							<c:when test="${isReviewExist}">
								<h5>리뷰 작성함</h5>
							</c:when>
							<c:otherwise>
								<h5>리뷰 불가</h5>
							</c:otherwise>
						</c:choose>
					</div>
	
					<br>
	
					<div class="control-group">
						<h4>환불</h4>
						<c:choose>
							<c:when test="${refund > 0 && payment.p_canceled == 0}">
								<h4>환불하기</h4>
								<div>
									관람 당일 지각/지역착오/연령 미숙지로 인한 환불/취소/변경 불가<br>
									1) 구매 당일 요청 시 전액 환불 (단, 당일 관람티켓은 환불 불가)<br>
									2) 관람일 7일 전~ : 티켓 금액 전액 환불<br>
									3) 관람일 6일 전 ~ 4일 전까지 : 10% 공제 후 환불<br>
									4) 관람일 3일 전 ~ 2일 전까지 : 20% 공제 후 환불<br>
									5) 관람일 1일 전 : 30% 공제 후 환불<br>
									6) 관람일 당일(자정 이후) : 환불/취소/변경 불가<br>
								</div>
								<div>환불 금액 : ${refund}</div>
								<form action="${pageContext.request.contextPath}/payment/cancel" method="post">
									<input type="hidden" name="p_id" value="${payment.p_id}">
									<button>결제</button>
								</form>
							</c:when>
							<c:when test="${payment.p_canceled == 1}">
								<h4>환불함</h4>
							</c:when>
							<c:otherwise>
								<h4>환불 기간 만료</h4>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
				
			</div><!-- 탭 종료 -->
			</div>
		</div><!-- 중앙정보 종료 -->
	</div><!-- 끝 -->
</section>

<jsp:include page="../page/footer.jsp" />
