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
	.table tbody {text-align:center;}
	.table th, .table td { text-align:center;}
	.table .img-polaroid {width: 120px; height: 150px; margin: 0;}
	.table td {line-height:150px;}
</style>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div>
				<div class="inner-heading">
					<h2>${param.p_id }번 연극 배우 추가</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="span10 offset1">	
			<form role="form" name="form" class="form-horizontal">		
				<div class="box-footer" align="center">
					<input type="hidden" name="p_id" value="${param.p_id }">
					<select name="a_id">
							<c:forEach items="${actorlist }" var="acl">
								<option value="${acl.a_id }">${acl.a_name }</option>
							</c:forEach>
					</select>
					<button type="submit" class="btn btn-success">배우 추가 생성</button>&nbsp;&nbsp;
					<button type="submit" class="btn btn-backand1">뒤로 돌아가기</button>
					<span class="help-block"></span>
				</div>	
			</form>	
			<fildset><legend>출연 배우진</legend>
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="10%">배우 번호</th>
						<th>배우 사진</th>
						<th>배우 이름</th>
						<th>제거 버튼</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${palistPaging}" var="pal">
				<form role="form"> 
					<tr>
						<input type="hidden" name="p_id" value="${param.p_id }">
						<td>${pal.a_id }</td>
						<td><img src="${pageContext.request.contextPath}/resources/img/actor/${pal.a_picture }" class="img-polaroid"></td>
						<td>${pal.a_name }</td>
						<td><a href="${pageContext.request.contextPath}/admin/play/padelete?a_id=${pal.a_id}&p_id=${param.p_id }"
													class="btn btn-danger">삭제</a></td>
					</tr>
				</form>
				</c:forEach>
				</tbody>
			</table>
			</fildset>
			
				<div class="pagination pagination-large pagination-centered">
				  	<ul class="pagination">
						<c:if test="${paging.pdto.page != 1}">
							<li><a href="palist?p_id=${param.p_id }&page=${paging.prevPage}&perPage=${paging.pdto.perPage}">&laquo;</a></li>
					   	</c:if>
						<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
							<c:choose>
								<c:when test="${pageNum == paging.pdto.page}">
									<li class="disabled"><a href="palist?p_id=${param.p_id }&page=${pageNum}&perPage=${paging.pdto.perPage}">${pageNum}
										</a></li>
									</c:when>
								<c:otherwise>
									<li><a href="palist?p_id=${param.p_id }&page=${pageNum}&perPage=${paging.pdto.perPage}">${pageNum}</a></li>
								</c:otherwise>
								</c:choose>
						</c:forEach>
						<c:if test="${paging.pdto.page != paging.pageCnt}">
							<li><a href="palist?p_id=${param.p_id }&page=${paging.nextPage}&perPage=${paging.pdto.perPage}">&raquo;</a></li>
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
		
		$(".btn-success").on("click", function(){			
			formObj.attr("action","${pageContext.request.contextPath}/admin/play/actoradd");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".btn-backand1").on("click", function(){			
			formObj.attr("action","${pageContext.request.contextPath}/admin/play/apread?p_id=${param.p_id}");
			//self.location="${pageContext.request.contextPath}/admin/play/apread?p_id=${param.p_id}";
		});
		$(".btn-cancel1").on("click", function(){			
			formObj.attr("action","${pageContext.request.contextPath}/admin/play/palist?p_id==${param.p_id}");
			formObj.reset();
		});
		
	});
</script>

<jsp:include page="../../page/footer.jsp" />