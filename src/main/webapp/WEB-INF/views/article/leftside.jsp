<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="span2">
	<aside class="left-sidebar">
		<div class="widget">
			<h5 class="widgetheading">고객센터</h5>
			<ul class="cat">
				<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/article/notice/list">공지사항</a></li>
				<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/article/faq/list">FAQ</a></li>
				<!-- 관리자 일 경우에는 모든 1:1 문의가 나와야하므로 -->
				<c:if test="${!empty login}">
					<li><i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/article/contact/list?m_code=${login.m_code }&m_level=${login.m_level }">1:1문의</a></li>
				</c:if>
			</ul>
		</div>
	</aside>
</div>
