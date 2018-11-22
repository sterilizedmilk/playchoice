<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/admin/site/member/"
	var="member" />
<!DOCTYPE html >
<jsp:include page="../integratedheader.jsp" />
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
							<tr>
								<td>${dd.m_code }</td>
								<td><input type="text" value="${dd.m_id }"></td>
								<td><input type="text" value="${dd.m_pw }"></td>
								<td><input type="text" value="${dd.m_name }"></td>
								<td><input type="text" value="${dd.m_level }"></td>
								<td><input type="text" value="${dd.m_mail }"></td>
								<td><input type="text" value="${dd.m_phone }"></td>
								<td><input type="text" value="${dd.m_status }"></td>
								<td><button type="button"
										onclick="location.href='${member }modify?a_id=${data.m_code }'">수정</button></td>
								<td><button type="button"
										onclick="location.href='${member }deleteReg?a_id=${data.m_code }'">삭제</button></td>
								<td><button type="button"
										onclick="location.href='${member }deleteReg?a_id=${data.m_code }'">블랙고</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>