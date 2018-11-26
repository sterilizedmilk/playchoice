<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/article/" var="uuu" />

<div class="span2">
	<aside class="left-sidebar">
		<div class="widget">
			<h5 class="widgetheading">MY PAGE</h5>
			<ul class="cat">
				<c:if test="${!empty login}">
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/member/view?m_id=${login.m_id}">내 정보</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/member/update?m_id=${login.m_id}">정보 수정</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/member/updatePw?m_id=${login.m_id}">비밀번호 변경</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/basket/list">찜한 연극</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/prefer/list">찜한 배우</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/member/paymentList?m_code=${login.m_code}">결제 내역</a></li>
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/member/delete?m_id=${login.m_id}">회원 탈퇴</a></li>
				</c:if>
			</ul>
		</div>
	</aside>
</div>
