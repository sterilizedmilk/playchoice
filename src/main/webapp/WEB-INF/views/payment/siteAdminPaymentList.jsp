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
<title>Payment</title>

<jsp:include page="/WEB-INF/views/admin/site/integratedheader.jsp" />
<style>
.dropdown-menu {
	background: white
}
</style>

<div class="container">
	<div class="row">
		<!-- 좌측 정보 -->
		<div class="col-md-5" style="float: left; position: relative; margin-right: 15px; background: #fff;">
			<h3>결재내역</h3>
			<div class="span8">
				<form id="paymentSearchForm" autocomplete="off" action="">
					<div class="control-group">
						<label class="control-label">연극 제목</label>
						<div class="control">
							<input type="text" name="play" value="${param.play}">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">회원 아이디</label>
						<div class="control">
							<input type="text" name="member" value="${param.member}">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">연극 관리자 아이디</label>
						<div class="control">
							<input type="text" name="playAdmin" value="${param.playAdmin}">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">기간</label>
						<div class="control">
			                <input type="text" class="form_datetime" name="from" style="width: 8em;" value="${param.from}">~
							<input type="text" class="form_datetime" name="until" style="width: 8em;" value="${param.until}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="row">페이지당 개수</label>
						<div class="control">
							<select name="row" style="width: 6em;">
								<option value="10">-선택-</option>
								<option value="10" ${param.row == 10 ? 'selected' : ''}>10개씩</option>
								<option value="20" ${param.row == 20 ? 'selected' : ''}>20개씩</option>
								<option value="50" ${param.row == 50 ? 'selected' : ''}>50개씩</option>
								<option value="0" ${param.row == 0 ? 'selected' : ''}>제한없이</option>
							</select><br>
						</div>
					</div>
					
					<div class="control-group button-group pull-right">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
					
					<input type="hidden" name="page" id="inputPage" value="${param.page}"><br>
				</form>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>결제 시간</th>
						<th>결제 id</th>
						<th>회원</th>
						<th>연극 제목</th>
						<th>일정 id</th>
						<th>금액</th>
						<th>매수</th>
						<th>상영 시간</th>
						<th>비고</th>
						<th>정보 보기</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="sum" value="0"/>
					<c:choose>
						<c:when test="${paymentList != null && paymentList.size() != 0}">
							<c:forEach var="pay" items="${paymentList}">
								<c:set var="sum" value="${sum + pay.p_price}" />
								<tr>
									<td><fmt:formatDate type="both" value="${pay.p_time}"/></td>
									<td>${pay.p_id}</td>
									<td><a href="${pageContext.request.contextPath}/admin/site/member/detail?m_code=${pay.m_code}">${pay.m_id}</a></td>
									<td>${pay.p_name}</td>
									<td>${pay.s_id}</td>
									<td>${pay.p_price}</td>
									<td>${pay.p_quantity}</td>
									<td><fmt:formatDate type="both" value="${pay.s_time}"/></td>
									<td>${pay.p_canceled == 1 ? '환불됨' : pay.p_cancel_target_id == 0 ? '' : '환불결제'}</td>
									<td><button class="btn btn-success btn-lg" onclick="location.href='${pageContext.request.contextPath}/payment/info?p_id=${pay.p_id}'" >정보</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10">결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<div>
				총액 : ${sum}
			</div>
			
			<div class="pagination pagination-large pagination-centered">
				<ul class="pagination">
 					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" varStatus="status">
						<li<c:if test="${param.page == i}"> class="disabled"</c:if>>
							<a href="#" class="page-link">${i}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

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
