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
			<c:forEach items="${list}" var="li" varStatus="status">
				<div style="outline:1px solid #8C8C8C; float:left; margin:15px; width: 180px; height: 320px;">
					<div>
						<a href="playdetail?p_id=${li.p_id }">
						<img src="${pageContext.request.contextPath}/resources/img/play/${li.p_image0 }"></a>
					</div>
					<div>
						<p> <a href="playdetail?p_id=${li.p_id }">${li.p_name }</a> </p>
						<p style="float:left; font-style: italic;">
							최저 가격
						</p>
						<p align="right"> <span style="font-size: 20px;  color: #FF5E00">${li.lowest_price}</span> 원 ~ </p>
					</div>
				</div>
			</c:forEach>
		
	
	
	
		<%-- <table width="100%" height="800px">
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
					<td width="20%" height="300px" style="border:1px solid #eee;">
						<p style="background-color: blue;">
						<a href="playdetail?p_id=${li.p_id }">
					<img src="/playChoice/resources/img/admin/play/thumb_${li.p_image0 }" align="top"></a><br/>
					<img src="/playChoice/resources/img/play/${li.p_image0 }"></a>
					</p>
					${li.p_name }
					</td>
					<c:if test="${status.index % 5 == 4}">
					
					</tr>
					<tr>
					</c:if>
			</c:forEach>
				</tr>
			</tbody>
		</table> --%>
	</div>
</div>

<jsp:include page="../page/footer.jsp" />