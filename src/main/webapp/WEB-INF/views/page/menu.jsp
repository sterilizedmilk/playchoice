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
				<h4 style="color: white">전체 일정</h4>
				<table class="table">
					<thead>
						<tr>
							<td>
								<strong>장르</strong>
							</td>
							<td>전체보기</td>
							<td>연극</td>
							<td>뮤지컬</td>
							<td>콘서트</td>
							<td>가족 및 아동</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<strong>지역</strong>
							</td>
							<td>전체보기</td>
							<td>대학로</td>
							<td>서울</td>
							<td>경기</td>
							<td>대전/충청</td>
							<td>부산/대구/경상</td>
							<td>광주/전라</td>
							<td>제주</td>
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
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>