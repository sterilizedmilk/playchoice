<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<jsp:include page="../page/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
    function calendar(date) {
        $.ajax({
            url : "updateCalendar?year=" + date.getYear() + "&month=" + (date.getMonth() + 1),
            type : "get",
            success : function(data) {
            	var cal = $("#calendar");
            	cal.empty();
                var day = (new Date(date.getFullYear(), date.getMonth(), 1)).getDay();
                var lastDate = (new Date(date.getFullYear(), date.getMonth() + 1 , 0)).getDate();
        		var str = "";
                str += "<tr>";
                for (i = 1 - day, day = 0; ; ++i) {
                	if (i > 0) {
        	        	str += "<td class=''>";
        	        	str += i;
						if (data[i]) {
	        	        	for (j = 0; j < Object.keys(data[i]).length; ++j)
		        	        	str += " " + data[i][j]["a_name1"] + "<br>" + data[i][j].a_name2;
						}
                	}
                	else {
        	        	str += "<td style='background-color: gray;'>";
                	}
                	str += "</td>";
                	if (i == lastDate)
                		break;
                    if (++day == 7) {
                    	day = 0;
                    	str += "</tr><tr>";
                    }
                }
        		str += "</tr>";
        		cal.append(str);
        	}
        });
   	}
    

    $(function() {
    	calendar(new Date());
    });
</script>


<h2 align="center">연극 세부정보</h2>

<h3>달력</h3>
<div>
	<table id="calendar" border="1">
	</table>
</div>

<form role="form" method="post">
	<input type="hidden" name="p_id" value="${playDTO.p_id }">
</form>
<div class="container" align="center">
	<div class="row">
		<table border="" width="100%" height="800px">
			<tr height="20%">
				<td>${playDTO.p_id }</td>
				<td>${playDTO.p_name }</td>
			</tr>
			<tr>
				<td colspan="2">${playDTO.p_info }</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="../page/footer.jsp" />