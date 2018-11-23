<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="http://localhost:8080/playChoice/article/" var="uuu" />

<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>고객센터</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><a href="#">
							<i class="icon-home"></i>
						</a><i class="icon-angle-right"></i></li>
					<li><a href="customergongi">고객센터</a><i class="icon-angle-right"></i></li>
					<li class="active">1:1문의</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<div class="row">
			<jsp:include page="leftside.jsp" />
			<!-- Default table -->
			<div class="row">
				<div class="span8">
					<h4>1:1문의</h4>
					<form action="${uuu }contact/insertReg" method="post">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="4">
										· 티켓 환불은 마이티켓 > 예매내역에서 환불신청 버튼을 이용해주세요.<br> · 1:1문의 답변은 업무일(평일10:00~18:00) 기준 24시간 내로 완료되며, 주말/공휴일은 답변이 지연될 수 있습니다.
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>제목</td>
									<td colspan="3">
										<input type="text" name="a_title" style="width: 95%">
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="hidden" name="target" value="contact">
										<input type="hidden" name="m_code" value="${login.m_code }" />
										<input type="text" name="re_comment" style="width: 98%; height: 300px">
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<button type="submit" class="btn btn-square btn-theme" style="width: 100%">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../page/footer.jsp" />