<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배우리스트</title>
<jsp:include page="../page/header.jsp"></jsp:include>
<script>

</script>

</head>
<body>
<div class="container" align="center">
	<div>
	<form action="" id="search">
	<tr>
		<td>
			<select name="type" form="search" style="width:70px">
				<option value="a_name" selected >이름</option>
				<option value="">기타</option>
			</select>
			<input type="text" name="keyword" />
			<button class="btn btn-success">검색</button>
		</td>
	</tr>
	</div>
	</form>
	<table border="">
	<tr>
		<th>사진</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>홈페이지</th>
		<th>찜하기</th>
	</tr>
	<tr>
		<c:forEach items="${actorList }" var="actor">
			<td></td>
			<td>${actor.a_name}</td>
			<td>${actor.a_birth}</td>
			<td><a href="http://${actor.a_homepage}" target="_blank">${actor.a_homepage}</a></td>
			<td><button>찜</button></td>
	</tr>
		</c:forEach>
	</table>
	<button><a href="insertActor">배우등록해버리기</a></button>
	</div>
		<div class="span12" align="center">
			
		</div>

<jsp:include page="../page/footer.jsp"></jsp:include>
</body>
</html>