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
<h2 align="center">연극 리스트</h2>
<div class="container" align="center">
	<div class="row">
		<table border="" >
			<tbody>
				<tr>
					<td>연극 번호</td>
					<td>연극 제목</td>
					<td>장르</td>
					<td>지역</td>
					<td>글 게시 상태</td>
				</tr>
				<tr>
			<c:forEach items="${list}" var="li">
					<td>${li.p_id }</td>
					<td> <a href="apread?p_id=${li.p_id }">${li.p_name }</a>
					</td>
					<td>${li.g_id }</td>
					<td>${li.a_id }</td>
					<td>${li.p_status }</td>
					</tr>
			</c:forEach>
				<tr>
				</tr>				
			</tbody>
		</table>
		<div>
			<a href="apregister"><button type="submit">글쓰기</button></a>
			<a href="/playChoice"><button type="submit">메인으로</button></a>
			<a href="qnalist"><button>QnA 관리하러가기</button></a>
		</div>
	</div>
</div>

<script>
	var result = "${msg}";
	
	if(result == "success"){
		alert("처리 되었습니다.");
	}
	
	if(p_status == false){
		p_status = "글 내림";
	}else{
		p_status = "글 올림";
	}
</script>