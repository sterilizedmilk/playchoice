<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="container ">
	<div class="row">
		<div class="span6">
			<div class="navbar navbar-static-top">
				<div class="navigation">
					<nav>
						<ul class="nav topnav">
							<li><a href="${pageContext.request.contextPath}/member/view">연극 관리</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/play/qnalist">Q&A관리</a></li>
							<li><a href="${pageContext.request.contextPath}/prefer/list">정산 관리</a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/paymentList?m_code=${login.m_code}">결제
									내역</a></li>
						</ul>
					</nav>
					<div class="span12">
						<div class="solidline"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
