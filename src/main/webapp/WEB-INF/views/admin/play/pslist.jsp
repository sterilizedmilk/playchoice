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
<jsp:include page="adminheader.jsp" />
<style>
	.table select {width:100px;}
	.table thead th {text-align:center;}
	.table input[name='s_price'],
	.table input[name='s_ticket'] {width:100px;}
</style>
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

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span12">	
			<form role="form" name="form" class="form-horizontal">		
				<div class="box-footer" align="center">
					<input type="hidden" name="p_id" value="${param.p_id }">
					<button type="button" class="btn btn-primary">일정 추가 생성</button>&nbsp;&nbsp;
					<button type="submit" class="btn btn-flurry">연극 올리기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger">뒤로 돌아가기</button>
					<span class="help-block"></span>
				</div>	
			</form>	
			<table class="table table-hover" >
				<thead>
					<tr>
						<th style="width:8%;">번호</th>
						<th>시작시간</th>
						<th>연극 가격</th>
						<th>연극 총 매수</th>
						<th style="width:12%;">배우 1</th>
						<th style="width:12%;">배우 2</th>
						<th style="width:12%;">연극 상태</th>
						<th style="width:8%;">상태 버튼</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${key}" var="ke">
					<form action="${pageContext.request.contextPath}/admin/play/psmodify" method="POST">
					<tr>
						<!-- form 안에 있어야 변수로서 사용이 가능하다 -->
						<input type="hidden" name="p_id" value="${param.p_id }"> 
						<td><input type="hidden" name="s_id" value="${ke.s_id }"/>${ke.s_id }</td>
						<td>
						<input type="text" name="s_time" value="${ke.s_time}">
						</td>
						<td>
						<input type="text" name="s_price" value="${ke.s_price}">
						</td>
						<td>
						<input type="text" name="s_ticket" value="${ke.s_ticket}">
						</td>
						<td>${ke.a_id1 }
						<select name="a_id1">
							<c:forEach items="${actorlist }" var="acl">
								<option value="${acl.a_id }">${acl.a_name }</option>
							</c:forEach>
						</select>
						</td>
						<td>${ke.a_id2 }
						<select name="a_id2">
							<c:forEach items="${actorlist }" var="acl">
								<option value="${acl.a_id }">${acl.a_name }</option>
							</c:forEach>
						</select>
						</td>
						<td>${ke.s_canceled }
						<select name="s_canceled" id="">
							<option value="0">개시</option>
							<option value="1">내림</option>
						</select>
						</td>
						<td><button type="submit">변경</button></td>
						
					</tr>
					</form>
					</c:forEach>
				</tbody>			
			</table>
				<div class="pagination pagination-large pagination-centered">
				  	<ul class="pagination">
						<c:if test="${paging.pdto.page != 1}">
							<li><a href="pslist?p_id=${param.p_id }&page=${paging.prevPage}&perPage=${paging.pdto.perPage}">&laquo;</a></li>
					   	</c:if>
						<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
							<c:choose>
								<c:when test="${pageNum == paging.pdto.page}">
									<li class="disabled"><a href="pslist?p_id=${param.p_id }&page=${pageNum}&perPage=${paging.pdto.perPage}">${pageNum}
										</a></li>
									</c:when>
								<c:otherwise>
									<li><a href="pslist?p_id=${param.p_id }&page=${pageNum}&perPage=${paging.pdto.perPage}">${pageNum}</a></li>
								</c:otherwise>
								</c:choose>
						</c:forEach>
						<c:if test="${paging.pdto.page != paging.pageCnt}">
							<li><a href="pslist?p_id=${param.p_id }&page=${paging.nextPage}&perPage=${paging.pdto.perPage}">&raquo;</a></li>
						</c:if>
					</ul>
				</div><!-- /.pagination -->	
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
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
</script>

<jsp:include page="../../page/footer.jsp" />