<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%@ page import="java.util.*, java.text.*"%>

<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("MM-dd");
	String strdate = simpleDate.format(date);
	Calendar cal = Calendar.getInstance();
%>

<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span12">
				<h4 style="color: white">연극 일정</h4>
				<table class="table">
					<thead>
						<tr>
							<td>
								<strong>지역</strong>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/play/mainlist?a_id=0&g_id=${ init_g}">전체보기</a>
							</td>
							<c:forEach items="${area}" var="area" varStatus="status">
								<td>
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ area.a_id}&g_id=${ init_g}">${ area.a_name}</a>
								</td>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<strong>장르</strong>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ init_a}&g_id=0">전체보기</a>
							</td>
							<c:forEach items="${genre}" var="genre" varStatus="status">
								<td>
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ init_a}&g_id=${ genre.g_id}">${ genre.g_name } </a>
								</td>
							</c:forEach>
							<td></td>
						</tr>
						<tr>
							<td>
								<strong>일정</strong>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/play/mainlist">전체보기</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/play/todaylist">
									오늘(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE)%>)
								</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/play/tomorrowlist">
									내일(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE) + 1%>)
								</a>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

