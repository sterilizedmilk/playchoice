<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../page/header.jsp" />
<style>
.dropdown-menu {
	background: white
}
</style>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>결제 내역</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>결제 내역</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
	<div class="container">
		<div class="row">
			<jsp:include page="../member/viewLeftside.jsp" />
			<div class="row">
				<div class="span8">
				<%-- <h3>${sessionScope.login.m_name}님의 결재내역</h3> --%>
					<form id="paymentSearchForm" action="" autocomplete="off">
						<div class="control-group">
							<label class="control-label">연극 제목</label>
							<div class="control">
								<input type="text" name="play" value="${param.play}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">기간</label>
							<div class="control">
				                <input type="text" class="form_datetime" name="from" style="width: 9em;" value="${param.from}">~
								<input type="text" class="form_datetime" name="until" style="width: 9em;" value="${param.until}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="watched">끝남 여부</label>
							<div class="control">
								<input type="checkbox" name="watched" value="true" ${param.watched == true ? 'checked' : ''} >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="row">페이지당 개수</label>
							<div class="control">
								<select name="row">
									<option value="10">-선택-</option>
									<option value="10">10개씩</option>
									<option value="20">20개씩</option>
									<option value="50">50개씩</option>
									<option value="0">제한없이</option>
								</select>
							</div>
						</div>
							<input type="hidden" name="page" id="inputPage" value="${param.page}"><br>

					<div class="control-group button-group pull-right">
						<button type="submit" class="btn btn-success">검색</button>
					</div>
					</form>
				
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>결제 시간</th>
								<th>연극 제목</th>
								<th>금액</th>
								<th>매수</th>
								<th>상영 시간</th>
								<th>비고</th>
								<th>정보 보기</th>
							</tr>
						</thead>
					
						<tbody>
							<c:choose>
								<c:when test="${paymentList != null && paymentList.size() != 0}">
									<c:forEach var="pay" items="${paymentList}">
										<tr>
											<td><fmt:formatDate type="both" value="${pay.p_time}"/></td>
											<td>${pay.p_name}</td>
											<td>${pay.p_price}</td>
											<td>${pay.p_quantity}</td>
											<td><fmt:formatDate type="both" value="${pay.s_time}"/></td>
											<td>${pay.p_canceled == 1 ? '취소됨' : pay.p_cancel_target_id == 0 ? '' : '환불'}</td>
											<td><button onclick="location.href='${pageContext.request.contextPath}/payment/info?p_id=${pay.p_id}'" >상세</button></td>
										</tr>
									</c:forEach> 
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7">결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					<c:if test="${firstPage != null}">
						<div class="pagination pagination-large pagination-centered">
							<ul class="pagination">
			 					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" varStatus="status">
									<li<c:if test="${param.page == i}"> class="disabled"</c:if>>
										<a href="#" class="page-link">${i}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
					
				</div><!-- 탭 종료 -->
			</div><!-- /.row -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section>

<script>
    $('.form_datetime').datetimepicker({
        language: 'ko',
        format: 'yyyy-mm-dd hh:mm',
        todayBtn: 1,
		autoclose: 1,
		todayHighlight: 1,		
        showMeridian: 1
    });
    
    $(function() {
    	$(".page-link").click(function() {
    		$("#inputPage").val($(this).text());
    		$("#paymentSearchForm").submit();
    	});
    });
</script>

<jsp:include page="../page/footer.jsp" />
