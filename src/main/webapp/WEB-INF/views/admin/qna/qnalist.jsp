<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<jsp:include page="../../page/header.jsp" />
<jsp:include page="../play/adminheader.jsp" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script>

	var msg = "${msg}";
	
	console.log(msg);
	if(msg != ""){
		/* alert(msg); */
		location.href="../../";
	}
</script>
<style type="text/css">
table{
	width: 90%;
}
th{
	margin: 10px;
	width: 100%;
	background-color: #eee;
	border-top : 1px solid black;
	text-indent: 2em;
}
td{
	height : 70px;

}
</style>
<div class="container">
	<div class="row">
		<div align="left" style="padding:50px; border-bottom: 1px solid #eee;">
			<form action="qnalist_asplay" method="get">
			<select name="p_id" id="myplay">
				<option value=0>전체보기</option>
				<c:forEach items="${myPlayList }" var="list"> 
					<option ${param.p_id == list.p_id ? 'selected' : ''} value="${list.p_id }">${list.p_name }</option>
				</c:forEach>
			</select>
			<button class="btn btn-success" id="btn-sel">검색</button>
			</form>
		</div>
		<div align="center" style="padding: 10px 0px">
		<table>
		<c:forEach items="${qnaList }" var="list" varStatus="status">		
			<tr>
				<th align="left" colspan='3'>  ${list.p_name }</th>
			</tr>
			<tr>
				<td align="center">${list.m_id}</td>
				<td>
					<c:if test="${list.replychk==1}">
						<i class="icon-lightbulb"></i>
						<span style="font-size: 0.5em; font-style: oblique; color: #BD24A9;">NEW</span>
					</c:if>
					<c:if test="${list.replychk==2}">
						<span style="font-size: 0.5em; font-style: oblique; color: #BD24A9;">답변완료</span>
					</c:if>
					<a href="qnadetail?q_id=${list.q_id }">${list.q_content }</a>
				</td>
				<td width="30%">
			
				${list.q_time }</td>
			</tr>
		
		</c:forEach>
		</table>
		</div>
	</div>
</div>
