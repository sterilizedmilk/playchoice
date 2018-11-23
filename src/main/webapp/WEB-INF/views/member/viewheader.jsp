<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="container ">
	<div class="row">
		<div class="span6">
			<div class="navbar navbar-static-top">
				<div class="navigation" style="background-color:  black">
					<nav>
						<ul class="nav topnav">
							<li><a href="${pageContext.request.contextPath}/member/view">정보
									수정</a></li>
							<li><a href="${pageContext.request.contextPath}/basket/list">찜한
									연극</a></li>
							<li><a href="${pageContext.request.contextPath}/prefer/list">찜한
									배우</a></li>
							<li><a href="${pageContext.request.contextPath}/member/paymentList?m_code=${login.m_code}">결제 내역</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
