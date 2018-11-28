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
								<c:if test="${ menudto.a_id ne 0}">
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=0&g_id=${ menudto.g_id}&s_tab=${ menudto.s_tab}">전체보기</a>
								</c:if>
								<c:if test="${ menudto.a_id eq 0}">
									전체보기
								</c:if>
							</td>
							<c:forEach items="${area}" var="area" varStatus="status">
								<td>
									<c:choose>
										<c:when test="${ menudto.a_id eq status.count}">
											${ area.a_name}
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ area.a_id}&g_id=${ menudto.g_id}&s_tab=${ menudto.s_tab}">${ area.a_name}</a>
										</c:otherwise>
									</c:choose>
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
								<c:if test="${ menudto.g_id ne 0}">
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ menudto.a_id}&g_id=0&s_tab=${ menudto.s_tab}">전체보기</a>
								</c:if>
								<c:if test="${ menudto.g_id eq 0}">
									전체보기
								</c:if>
							</td>
							<c:forEach items="${genre}" var="genre" varStatus="status">
								<td>
									<c:choose>
										<c:when test="${ menudto.g_id eq status.count}">
										${ genre.g_name } 
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ menudto.a_id}&g_id=${ genre.g_id}&s_tab=${ menudto.s_tab}">${ genre.g_name } </a>
										</c:otherwise>
									</c:choose>
								</td>
							</c:forEach>
							<td></td>
						</tr>
						<tr>
							<td>
								<strong>일정</strong>
							</td>
							<td>
								<c:if test="${menudto.s_tab ne 'mainlist' }">
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ menudto.a_id}&g_id=${ menudto.g_id}&s_tab=mainlist">전체보기</a>
								</c:if>
								<c:if test="${menudto.s_tab eq 'mainlist' }">
									전체보기
								</c:if>
							</td>
							<td>
								<c:if test="${menudto.s_tab ne 'todaylist'}">
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ menudto.a_id}&g_id=${ menudto.g_id}&s_tab=todaylist">
										오늘(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE)%>)
									</a>
								</c:if>
								<c:if test="${menudto.s_tab eq 'todaylist'}">
									오늘(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE)%>)
								</c:if>
							</td>
							<td>
								<c:if test="${menudto.s_tab ne 'tomorrowlist' }">
									<a href="${pageContext.request.contextPath}/play/mainlist?a_id=${ menudto.a_id}&g_id=${ menudto.g_id}&s_tab=tomorrowlist">
										내일(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE) + 1%>)
									</a>
								</c:if>
								<c:if test="${menudto.s_tab eq 'tomorrowlist' }">
									내일(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE) + 1%>)
								</c:if>
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

