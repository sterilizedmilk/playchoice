<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<jsp:include page="../page/header.jsp" />
<meta charset="UTF-8">

<h2 align="center">연극 리스트</h2>
<div class="container" align="center">
	<div class="row">
		<table border="" width="100%" height="800px">
			<tbody>
				<tr>
				<!-- <c:if test="${status.index % 5 == 4}">
					</tr>
					<tr>
					</c:if>
				반복문 status.index가 나머지가 4일때마다 줄바꿈을 하겠다는것
				0으로 하면 처음번째가 0이므로 처음에 줄바꿈이 생긴다	
					 -->
			<c:forEach items="${list}" var="li" varStatus="status" >
					<td><a href="playdetail?p_id=${li.p_id }">
					<img src="/playChoice/resources/img/admin/play/thumb_${li.p_image0 }"><br/>
					${li.p_name }</a>
					</td>
					<c:if test="${status.index % 5 == 4}">
					
					</tr>
					<tr>
					</c:if>
			</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="../page/footer.jsp" />