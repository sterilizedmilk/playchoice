<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="container ">
	<div class="row">
		<div class="span6">
			<div class="navbar navbar-static-top">
				<div class="navigation">
					<nav>
						<ul class="nav topnav">
							<li><a href="${pageContext.request.contextPath}/admin/play/aplist">연극 리스트</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/play/apregister">연극 글쓰기</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/qna/qnalist">Q&A관리</a></li>
							<%-- <li><a href="${pageContext.request.contextPath}/#">정산 관리</a></li> --%>
							<li><a
								href="${pageContext.request.contextPath}/admin/play/paymentList?m_code=${login.m_code}">결제
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