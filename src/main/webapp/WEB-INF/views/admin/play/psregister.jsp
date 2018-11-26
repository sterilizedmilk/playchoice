<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<jsp:include page="../../page/header.jsp" />

<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<%-- <link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" /> --%>

<title>Insert title here</title>

<h2 align="center">연극 일정 추가</h2>
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name = "p_id" value="${param.p_id }">
	<div class="box-body">
		<div class="form-group">
			<label for = "exampleInputEmail1">연극 시간</label>
			<input type="text" name = "s_time" class="form-contorl" placeholder="Enter time">
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">연극 가격</label>
			<input type="text" name = "s_price" class="form-contorl" placeholder="Enter price">
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">최대 티켓 수</label>
			<input type="text" name = "s_ticket" class="form-contorl" placeholder="Enter ticket">
		</div>
		<!-- <div class="form-group">
			<label for = "exampleInputEmail1">배우1</label>
			<input type="text" name = "a_id1" class="form-contorl" placeholder="Enter acter number1">
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">배우2</label>
			<input type="text" name = "a_id2" class="form-contorl" placeholder="Enter acter number2">
		</div> -->
		
		<div>
		<label>배우 1</label>
		<select name="a_id1">
		<c:forEach items="${actorlist }" var="acl">
			<option value="${acl.a_id }">${acl.a_name }</option>
		</c:forEach>
		</select>
		</div>
		<div>
		<label>배우 2</label>
		<select name="a_id2">
		<c:forEach items="${actorlist }" var="acl">
			<option value="${acl.a_id }">${acl.a_name }</option>
		</c:forEach>
		</select>
		</div>
		<div>
		
	</div>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">일정 추가</button>
		<input type="button" onclick="history.go(-1)" value="취소"/>
	</div>
</form>