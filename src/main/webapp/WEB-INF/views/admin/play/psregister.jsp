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

<title>Insert title here</title>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>연극 일정 추가</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="content">
	<div class="container">
		<div class="row">
			<input type="hidden" name = "p_id" value="${param.p_id }">
			<div class="span6 offset3">
				<form role="form" method="post" class="form-horizontal" enctype="multipart/form-data">
					<div class="control-group">
						<label class="control-label" for="s_time">연극 시간</label>
						<div class="controls">
							<input type="text" name = "s_time" id="s_time" placeholder="Enter time">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="s_price">연극 가격</label>
						<div class="controls">
							<input type="text" name = "s_price" id="s_pirce" placeholder="Enter price">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="p_id">최대 티켓 수</label>
						<div class="controls">
							<input type="text" name = "s_ticket" id="s_pirce" placeholder="Enter ticket">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="p_id">배우 1</label>
						<div class="controls">
							<select name="a_id1">
							<c:forEach items="${actorlist }" var="acl">
								<option value="${acl.a_id }">${acl.a_name }</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="p_id">배우 2</label>
						<div class="controls">
							<select name="a_id2">
							<c:forEach items="${actorlist }" var="acl">
								<option value="${acl.a_id }">${acl.a_name }</option>
							</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="control-group" align="center">
						<button type="submit" class="btn btn-primary">일정 추가</button>
						<input type="button" onclick="history.go(-1)" value="취소"/>
					</div>
				
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../../page/footer.jsp" />