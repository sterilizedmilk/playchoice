<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/admin/site/member/" var="member" />
<!DOCTYPE html >
<jsp:include page="../../../page/header.jsp" />
<jsp:include page="../integratedheader.jsp" />


<script>
function updateMember(action) {
	var form = $("#mem");

	switch (action) {
	case "playAdmin":
		$("#m_level").val(1);
		break;
	case "common":
		$("#m_level").val(0);
		break;
	case "black":
		$("#m_status").val(1);
		break;
	case "unBlack":
		$("#m_status").val(0);
		break;
	}
	
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/site/member/modify",
		type: "post",
		data: form.serialize(),
		dataType : 'json',
		success: function(data) {}
	})
}
</script>

<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>회원 상세</h4>
				
				<form id="mem" method="post">
					<input type="hidden" name="m_code" id="m_code" value="${mem.m_code}">
					<input type="hidden" name="m_level" id="m_level" value="${mem.m_level}">
					<input type="hidden" name="m_status" id="m_status" value="${mem.m_status}">
				</form>
				<table class="table table-striped">
						<tr>
							<th>번호</th>
							<td>${mem.m_code}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${mem.m_id}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${mem.m_name}</td>
						</tr>
						<tr>
							<th>레벨</th>
							<td>${mem.m_level}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${mem.m_mail}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${mem.m_phone}</td>
						</tr>
						<tr>
							<th>상태</th>
							<td>${mem.m_status}</td>
						</tr>


						<tr>
							<c:choose>
								<c:when test="${mem.m_level == 0}">
									<td><button onclick="updateMember('playAdmin');">연극 관리자로 변경</button></td>
								</c:when>
								<c:when test="${mem.m_level == 1}">
									<td><button onclick="updateMember('common');">일반 회원으로 변경</button></td>
								</c:when>
								<%-- 
								<c:when test="${mem.m_level == 2}">
									사이트 관리자
								</c:when>
								 --%>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							
							
							<c:choose>
								<c:when test="${mem.m_status == 0}">
									<td><button onclick="updateMember('black');">블랙리스트에 추가</button></td>
								</c:when>
								<c:when test="${mem.m_status == 1}">
									<td><button onclick="updateMember('unBlack');">블랙리스트에서 삭제</button></td>
								</c:when>
								<%-- 
								<c:when test="${mem.m_status == 2}">
									탈퇴 회원
								</c:when>
								 --%>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tr>
				</table>

			</div>
		</div>
	</div>
</div>