<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<link href="${pageContext.request.contextPath}/resources/fullcal/fullcalendar.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/fullcal/fullcalendar.print.css" rel="stylesheet" media="print" />

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcal/lib/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcal/lib/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcal/fullcalendar.js"></script>


<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
	jQuery(document).ready(
			function() {
				var list = new Array();
				var event ="";
				
				
				
				
				<c:forEach items="${schedule }" var="item">
					<c:set var="date">
						<fmt:formatDate value="${item.s_time }" pattern="yyyy-MM-dd"/>
					</c:set>
					list.push("{title:" + "${item.s_id }" + ", start:" + "${date}"+ "}");
				</c:forEach>

				for (var i = 0; i < list.length; i++)
				{
					alert(list[i]);
				  	/* event = fn:join(list[i],','); */
				 }
				
				var ToDay = new Date()
				var y = new Date(ToDay.getFullYear(), ToDay.getMonth(), ToDay
						.getDate() - 34)
				y.getFullYear()
						+ "-"
						+ (y.getMonth() + 1 < 10 ? "0" + (y.getMonth() + 1) : y
								.getMonth() + 1) + "-"
						+ (y.getDate() < 10 ? "0" + y.getDate() : y.getDate())

				jQuery("#calendar").fullCalendar({
					defaultDate : ToDay,
					editable : true,
					eventLimit : true,

					events : [ 
						for (var i = 0; i < list.length; i++) {
							document.write(list[i]);
						}
					/*  {
									title : "All Day Event",
									start : "2018-12-03"
									}, {
									title : "Long Event",
									start : "2018-12-03",
									end : "2018-12-05"
									}, {
									title : "Repeating Event",
									start : "2018-12-03",
									end : "2018-12-04"
									}, {
									title : "Repeating Event",
									start : "2018-12-03",
									end : "2018-12-05"
									}  */ ]
				});
			});
</script>
<body>
	<div id="calendar" style="width: 650px;"></div>
</body> --%>