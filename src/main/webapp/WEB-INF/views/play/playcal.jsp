<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	var toDay = new Date();
	var target = new Date();
	
	function createCal(playId, year, month) {
		var event;

		$.ajax({
			type: "POST",
			url: "playcal",
			data: {"p_id" : playId,
					"year" : year,
					"month" : month},
			dataType: "json",
			async: false,
			success: function(dat) {
				event = dat;
			}
		});

		$("#calendar").fullCalendar({
			defaultDate : toDay,
			editable : false,
			eventLimit : true,
			events : event
		});
	}
	
	function updateCal(playId, year, month) {
		var event;
		
		$.ajax({
			type: "POST",
			url: "playcal",
			data: {"p_id" : playId,
					"year" : year,
					"month" : month},
			dataType: "json",
			async: false,
			success: function(dat) {
				event = dat;
				console.log(dat);
			}
		});
		
//		$("#calendar").fullCalendar('removeEvents');	
//		$("#calendar").fullCalendar('updateEvents', event); // Uncaught TypeError: Cannot read property 'clone' of undefined 오류
	}
	
	$(function(){
		createCal(new URLSearchParams(window.location.search).get("p_id"), toDay.getFullYear(), toDay.getMonth() + 1);
		
		$(".fc-today-button").click(function() {
			target = new Date();
			updateCal(new URLSearchParams(window.location.search).get("p_id"), target.getFullYear(), target.getMonth() + 1);
		});
		
		$(".fc-prev-button").click(function() {
			target.setMonth(target.getMonth() - 1);
			updateCal(new URLSearchParams(window.location.search).get("p_id"), target.getFullYear(), target.getMonth() + 1);
		});
		
		$(".fc-next-button").click(function() {
			target.setMonth(target.getMonth() + 1);
			updateCal(new URLSearchParams(window.location.search).get("p_id"), target.getFullYear(), target.getMonth() + 1);
		});
	
	
	});
</script>
<body>
	<div id="calendar" style="width: 650px;"></div>
</body>