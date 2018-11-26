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
<script>
$(document).ready(function(){
	
	for(var i = 1 ; i<6 ; i++){
		var res = "<option value="+i+">"+i+"</option>";
	
		$("select").append(res);
	}
	
})
</script>
<title>Review</title>

<div class="container">
	<div class="row">
		p_name, payment_id, 	
		
		<form action="">
			연극평점<select name="" id="">
			</select>
			주연배우 1 <select></select>
			주연배우 2 <select></select>

			<textarea name="" id="" cols="30" rows="10">
			
			</textarea>
			<button>등록</button>
		</form>
	</div>
</div>


<jsp:include page="../page/footer.jsp" />
