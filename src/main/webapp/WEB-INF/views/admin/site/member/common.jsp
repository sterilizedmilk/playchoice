<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/admin/site/member/"
	var="member" />
<!DOCTYPE html >
<jsp:include page="../integratedheader.jsp" />

<script>
	function modifyGo(fff){
		fff.action="${member }modify";
		fff.submit();
	}
	function deleteGo(fff){
		fff.action="${member }delete";
		fff.submit();
	}
	function blackGo(fff){
		fff.action="${member }black";
		fff.submit();
}


</script>

<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>멤버관리페이지</h4>

				<table class="table table-striped" border="">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>레벨</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>상태</th>
							<th>수정</th>
							<th>삭제</th>
							<th>블랙리스트</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberlist }" var="dd" varStatus="no">
							<form name="frn${no.index }" action="" method="post">
								<tr>
									<td><input type="text" value="${dd.m_code }" name="m_code"
										readonly="readonly"></td>
									<td><input type="text" value="${dd.m_id }" name="m_id"></td>
									<td><input type="text" value="${dd.m_pw }" name="m_pw"></td>
									<td><input type="text" value="${dd.m_name }" name="m_name"></td>
									<td><input type="text" value="${dd.m_level }"
										name="m_level"></td>
									<td><input type="text" value="${dd.m_mail }" name="m_mail"></td>
									<td><input type="text" value="${dd.m_phone }"
										name="m_phone"></td>
									<td><input type="text" value="${dd.m_status }"
										name="m_status" readonly="readonly"></td>
									<td><button type="button"
											onClick="modifyGo(frn${no.index })">수정</button></td>
									<td><button type="button"
											onClick="deleteGo(frn${no.index })">삭제</button></td>
									<td><button type="button"
											onClick="blackGo(frn${no.index })">
											<c:choose>
												<c:when test="${0 eq dd.m_status }">
										블랙설정
										</c:when>
												<c:otherwise>
										블랙해제</c:otherwise>
											</c:choose>
										</button></td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
</body>
</html>