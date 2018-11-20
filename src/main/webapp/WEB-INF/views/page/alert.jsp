<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
	<script>
		alert('${status.msg}');
		location.href = '${status.url}';
	</script>
<jsp:include page="footer.jsp"></jsp:include>