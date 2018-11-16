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
	$(document).ready(function(){
		$('.mypick').click(function(){
			a_id = $(this).attr('value');
			alert($(this).attr('value'));
			$.ajax({
				 type : "POST"
				,url  : "mypick"
				,data : {"a_id" : a_id}
				,success : function(data){
					alert("성공")
				}
				,error : function(){
					alert("에러")
				}
			})
		});
	});
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
			<td><img src="<c:url value="/"/>resources/img/actor/${actor.a_picture }" width="170px" height="170px"
			style="padding:10px"/></td>
			<td>${actor.a_name}</td>
			<td>${actor.sdf}</td>
			<td><a href="http://${actor.a_homepage}" target="_blank">${actor.a_homepage}</a></td>
			<td><button id="mypick_${actor.a_id }" class="btn btn-info mypick" value="${actor.a_id }">찜</button></td>
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