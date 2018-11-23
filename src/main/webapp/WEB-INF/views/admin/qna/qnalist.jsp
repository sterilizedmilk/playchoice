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
<script>
$(document).ready(function(){
	$(".btn-reply").click(function(){
		console.log("dfdf")
		alert("ahk");
		
	})
		
})
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
	<div class="row" style="outline:1px solid black;">
		<div align="left" style="padding:50px; border-bottom: 1px solid #eee;">
			<select name="" id="">
				<option value>전체보기</option>
				<option value>코딩지옥</option>
				<option value>혼돈의 프로그래머</option>
			</select>
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
					<c:if test="${list.replychk==1} ">
						(new)
						<i class="icon-lightbulb"></i>
					</c:if>
					${list.replychk}
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
