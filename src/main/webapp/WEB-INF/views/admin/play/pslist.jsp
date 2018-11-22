<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<h2 align="center">연극 일정 보기</h2>
<div class="container" align="center">
	<div class="row">
		<table border="">
			<tbody>
			<tr><td>글 번호</td>
			<td colspan="3">${param.p_id }</td></tr>
			<c:forEach items="${key}" var="ke">
				<tr>
					<td>일정</td>
					<td>${ke.s_time }</td>
					<td>${ke.s_price }</td>
					<td>${ke.s_ticket }</td>
					<td>${ke.a_id1 }</td>
					<td>${ke.a_id2 }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="box-footer" align="center">
	<button type="submit" class="btn btn-primary">일정 추가 생성</button>
	<input type="button" onclick="history.go(-1)" value="뒤로 돌아가기"/>
</div>

<script>
	var result = "${msg}";
	
	if(result == "success"){
		alert("처리 되었습니다.");
	}
	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-primary").on("click", function(){			
			self.location="/playChoice/admin/play/psregister?p_id=${param.p_id}";
		});
	});
</script>