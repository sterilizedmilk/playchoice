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
	<div class="row">
		<div style="margin: 20px; border-bottom:1px solid #8C8C8C;">
		<p style="font-weight: bold;">${list[0].m_id } | ${list[0].q_time}</p>
			<p>${list[0].q_content }</p>
		</div>
		
		<div style="margin:20;padding:20px;">
			<form name="frm" method="POST">
				<textarea style="width: 80%; height:100px;"rows="" cols="" name="q_content" required>${list[1].q_content }</textarea>
				<input type="hidden" name="q_target_id" value="${list[0].q_id}" />
				<input type="hidden" name="p_id" value="${list[0].p_id}" />
				
			<c:choose>
				<c:when test="${list[1] == null }">
					<button class="btn btn-success" id="write" type="submit">작성</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-success" id="modify">수정</button>
				</c:otherwise>
			</c:choose>
				<a class="btn btn-danger" href="qnalist">취 소</a>
			

			</form>
		</div>
		
	
</div>
