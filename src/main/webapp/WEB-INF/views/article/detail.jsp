<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="#"><i class="icon-home"></i></a><i
						class="icon-angle-right"></i></li>
					<li><a href="customergongi">고객센터</a><i
						class="icon-angle-right"></i></li>
					<li class="active">1:1문의</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<section id="content">
	<div class="container">
		<jsp:include page="leftside.jsp" />
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>1:1문의</h4>
				<form>
					<table class="table table-bordered">
						<tr>
							<th>제목</th>
							<th colspan="4">${data.a_title }</th>
						</tr>
						<tr>
							<th>작성일</th>
							<th>${data.a_title }</th>
							<th>작성자</th>
							<th>${data.a_title }</th>
						</tr>
						<tr>
							<th colspan="5">${data.a_content }</th>
						</tr>
						<tr>
							<td colspan="5">
								<button type="submit" class="btn btn-square btn-theme">수정</button>
								<button type="submit" class="btn btn-square btn-theme">삭제</button>
								<button type="submit" class="btn btn-square btn-theme">목록
									전체보기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../page/footer.jsp" />