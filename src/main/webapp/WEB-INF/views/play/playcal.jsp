<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	} else {
	}

	//년도/월 셋팅
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>
<form name="calendarFrm" id="calendarFrm" action="" method="post">
	<!--날짜 네비게이션  -->
	<table width = "650px" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">
		<thead>
			<tr >
				<td colspan="7" align="center">
					<%
						if (month > 0) {
					%>
					<a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month - 1%>" target="_self">
						<b>&lt;</b>
						<!-- 이전달 -->
					</a>
					<%
						} else {
					%>
					<b>&lt;</b>
					<%
						}
					%>
					&nbsp;&nbsp;
					<%=year%>년
					<%=month + 1%>월 &nbsp;&nbsp;
					<%
						if (month < 11) {
					%>
					<a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month + 1%>" target="_self">
						<!-- 다음달 -->
						<b>&gt;</b>
					</a>
					<%
						} else {
					%>
					<b>&gt;</b>
					<%
						}
					%>
				</td>
			</tr>
			<tr bgcolor="#CECECE">
				<td>
					<div align="center">
						<font color="red">일</font>
					</div>
				</td>
				<td>
					<div align="center">월</div>
				</td>
				<td>
					<div align="center">화</div>
				</td>
				<td>
					<div align="center">수</div>
				</td>
				<td>
					<div align="center">목</div>
				</td>
				<td>
					<div align="center">금</div>
				</td>
				<td>
					<div align="center">
						<font color="#529dbc">토</font>
					</div>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
					//처음 빈공란 표시
					for (int index = 1; index < start; index++) {
						out.println("<TD >&nbsp;</TD>");
						newLine++;
					}
					for (int index = 1; index <= endDay; index++) {
						String color = "";
						if (newLine == 0) {
							color = "RED";
						} else if (newLine == 6) {
							color = "#529dbc";
						} else {
							color = "BLACK";
						}
						;
						String sUseDate = Integer.toString(year);
						sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
								: Integer.toString(month + 1);
						sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
								: Integer.toString(index);
						int iUseDate = Integer.parseInt(sUseDate);
						String backColor = "#EFEFEF";
						if (iUseDate == intToday) {
							backColor = "#c9c9c9";
						}
						out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
				%>
				<font color='<%=color%>'> <%=index%>
				</font>
				<%
					out.println("<BR>");
						out.println("zzzzzzz");
						// 여기가 날짜 나오는
						out.println("<BR>");
						//기능 제거 
						out.println("</TD>");
						newLine++;
						if (newLine == 7) {
							out.println("</TR>");
							if (index <= endDay) {
								out.println("<TR>");
							}
							newLine = 0;
						}
					}
					//마지막 공란 LOOP
					while (newLine > 0 && newLine < 7) {
						out.println("<TD>&nbsp;</TD>");
						newLine++;
					}
				%>
			</tr>
		</tbody>
	</table>
</form>