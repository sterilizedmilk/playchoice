<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<jsp:include page="header.jsp"></jsp:include>
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
				<li><a href="customergongi">고객센터</a><i class="icon-angle-right"></i></li>
				<li class="active">공지사항</li>
			</ul>
		</div>
	</div>
</div>
</section>

<section id="content">
<div class="container">
	<div class="row">
		<div class="span2">
			<aside class="left-sidebar">
			<div class="widget">
				<h5 class="widgetheading">고객센터</h5>
				<ul class="cat">
					<li><i class="icon-angle-right"></i><a href="customergongi">공지사항</a></li>
					<li><i class="icon-angle-right"></i><a href="customerfaq">FAQ</a></li>
					<li><i class="icon-angle-right"></i><a href="customerprivate">1:1문의</a></li>
				</ul>
			</div>
			</aside>
		</div>
		<!-- Default table -->
		<div class="row">
			<div class="span8">
				<h4>공지사항</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>글 번호</th>
							<th colspan="2">제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${no.index }</td>
							<td colspan="2"><a href="detail?id=${board.id }">${board.title }</a></td>
							<td>${dd.reg_date }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- divider -->
	<div class="row">
		<div class="span12">
			<div class="solidline"></div>
		</div>
	</div>
</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>