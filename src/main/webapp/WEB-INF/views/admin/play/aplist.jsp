<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../../page/header.jsp" />
<jsp:include page="adminheader.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<input type="hidden" name="m_code" value="${login.m_code }" />

<style>
	.table th, .table td { text-align:center;}
</style>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>연극 리스트</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="content">
<div class="container" align="center">
	<div class="row">
		<div class="span6 offset3">
			<table class="table table-hover" >
				<tbody>
					<tr>
						<td>연극 번호</td>
						<td>연극 제목</td>
						<td>장르</td>
						<td>지역</td>
						<td>글 게시 상태</td>
					</tr>					
				<c:forEach items="${list}" var="li">
					<tr>
						<td align="center">${li.p_id }</td>
						<td> <a href="apread?p_id=${li.p_id }">${li.p_name }</a></td>
						<td>
							<c:forEach items="${glist}" var="gl">
								<c:if test="${gl.g_id == li.g_id}">${gl.g_name}</c:if>
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${alist}" var="al">
								<c:if test="${al.a_id == li.a_id}">${al.a_name}</c:if>
							</c:forEach>
						</td>
						<td>${li.p_status == 'true' ? '게시' : '내림' }</td>
					</tr>
				</c:forEach>			
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<script>
	var result = "${msg}";
	
	if(result != ""){
		alert("${msg}")
	}
	
	/* if(result == "success"){
		alert("처리 되었습니다.");
	} else if(result == "NotAuth") {
		alert("잘못된 접근입니다.");
		//location.href = '<c:url value="/"/>';
	} else if(result == "Login") {
		alert("로그인이 필요한 페이지입니다.");
		//location.href = '<c:url value="/member/login"/>';
	}	 */
</script>

<jsp:include page="../../page/footer.jsp" />