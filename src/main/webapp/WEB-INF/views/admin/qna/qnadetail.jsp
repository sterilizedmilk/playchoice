<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../../page/header.jsp" />
<jsp:include page="../play/adminheader.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<style type="text/css">


</style>

<script type="text/javascript">
$(document).ready(function(){
	
	/* 답변달기 */
	$("#write").click(function(){
		
		
		
		frm.action="write";
		frm.submit();
		
	});
	
	/* 수정하기 */
	$("#modify").click(function(){
			
		frm.action="modify";
		frm.submit();
		
	});
	
})

</script>
<div class="container">
	<div class="row" style="outline:1px solid black;">
		<div>
			${list[0].q_content }
		</div>
		
		<div>
			<form name="frm" method="POST">
				<textarea rows="" cols="" name="q_content">${list[1].q_content }</textarea>
				<input type="hidden" name="q_target_id" value="${list[0].q_id}" />
				<input type="hidden" name="p_id" value="${list[0].p_id}" />
				<input type="hidden" name="m_code" value="1" />
				<%-- <input type="hidden" name="m_code" value="${login.m_code }" /> --%>
			<c:choose>
				<c:when test="${list[1] == null }">
					<button id="write" type="submit">작성</button>
				</c:when>
				<c:otherwise>
					<button id="modify">수정</button>
				</c:otherwise>
			</c:choose>
			

			</form>
		</div>
		
	
</div>
