<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="" id="searchActor">
	<tr>
		<td>
			<select name="type" form="searchActor" size="number">
				<option value="a_name" selected>이름</option>
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
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
</div>
	

		<div class="span12" align="center">
		
		</div>

	
<jsp:include page="../page/footer.jsp"></jsp:include>
</body>
</html>