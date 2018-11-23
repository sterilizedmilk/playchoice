<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/admin/site/actor/"
	var="actor" />
<!DOCTYPE html >
<jsp:include page="../integratedheader.jsp" />


<script>
	function modifyGo(fff){
		fff.action="${actor }update";
		fff.submit();
		alert("${actor }update");
	}
	function deleteGo(fff){
		fff.action="${actor }delete";
		fff.submit();
	}
</script>

<div class="container">
	<div class="row">
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>배우 관리페이지</h4>
				<table class="table table-striped" border="">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>홈페이지</th>
							<th>사진</th>
							<th>삭제 여부</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					
						<c:forEach items="${actorlist }" var="dd" varStatus="no">
							<form name="frn${no.index }"  method="post">
								<tr>
									<td><input type="text" value="${dd.a_id }" name="a_id"
										readonly="readonly"></td>
									<td><input type="text" value="${dd.a_name }" name="a_name"></td>
									<td><input type="text" value="${dd.a_birthStr }"
										name="a_birthStr"></td>
									<td><input type="text" value="${dd.a_homepage }"
										name="a_homepage"></td>
									<td><input type="text" value="${dd.a_picture }"
										name="a_picture" readonly="readonly"></td>
									<td><input type="text" value="${dd.a_deleted }"
										name="a_deleted" readonly="readonly"></td>
									<td><button type="button"
											onClick="modifyGo(frn${no.index })">수정</button></td>
									<td><button type="button"
											onClick="deleteGo(frn${no.index })">삭제</button></td>
								</tr>
							</form>
						</c:forEach>
					
				</table>

			</div>
		</div>
	</div>
</div>
</body>
</html>