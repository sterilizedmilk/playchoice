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

<jsp:include page="../../page/header.jsp" />

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>${param.p_id }번 연극 일정 보기</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<form role="form" method="post">
	<input type="hidden" name="p_id" value="${param.p_id }">
</form>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span6 offset3">				
				<div class="box-footer" align="center">
					<button type="submit" class="btn btn-primary">일정 추가 생성</button>
					<button type="submit" class="btn btn-flurry">연극 올리기</button>
					<button type="submit" class="btn btn-danger">뒤로 돌아가기</button>
					<span class="help-block"></span>
				</div>	
	
			<table class="table table-hover" >
				<tbody>
					<tr>
						<td>연극 시작시간</td>
						<td>연극 가격</td>
						<td>연극 총 매수</td>
						<td>배우 1</td>
						<td>배우 2</td>
					</tr>
					<c:forEach items="${key}" var="ke">
					<tr>
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
	</div>
</section>

<script>
	var result = "${msg}";
	
	if(result == "success"){
		alert("처리 되었습니다.");
	}
	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-primary").on("click", function(){			
			self.location="${pageContext.request.contextPath}/admin/play/psregister?p_id=${param.p_id}";
		});
		$(".btn-danger").on("click", function(){			
			self.location="${pageContext.request.contextPath}/admin/play/apread?p_id=${param.p_id}";
		});
		$(".btn-flurry").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/admin/play/flurry");
			formObj.submit();
		});
	});
</script>

<jsp:include page="../../page/footer.jsp" />