<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	jQuery(document).ready(function() {
		jQuery("#calendar").fullCalendar({
			defaultDate : "2018-12-03",
			editable : true,
			eventLimit : true,
			events : [ {
				title : "All Day Event",
				start : "2018-12-03"
			}, {
				title : "Long Event",
				start : "2018-12-03",
				end : "2018-12-04"
			}, {
				id : 999,
				title : "Repeating Event",
				start : "2018-12-03"
			}, {
				id : 999,
				title : "Repeating Event",
				start : "2018-12-03"
			} ]
		});
	});
</script>
<body>
	<div id="calendar" style="width: 650px;"></div>
</body>