<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배우리스트</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<jsp:include page="../integratedheader.jsp" />
<script>
$(document).ready(function(){
	// select - 연도추가
	for(var i = 1930 ; i<2019 ; i++){
		var res = "<option value="+i+">"+i+"</option>";
	
		$("#year").append(res);
	}
	
	// select - 월추가
	for(var i = 1 ; i<13 ; i++){
		var res = "<option value="+i+">"+i+"</option>";
	
		$("#month").append(res);
	}
	
	// select - 일 추가
	for(var i = 1 ; i<32 ; i++){
		var res = "<option value="+i+">"+i+"</option>";
	
		$("#day").append(res);
	}
})
</script>
<script>
	var msg = "${msg}";
	console.log(msg);
	if(msg != ""){
		console.log(msg);
		alert(msg);
	}
</script>
</head>
<body>
	<div class="container">
		<h2>배우 등록</h2>
			<form id="insertActor" name="insertActor" method="post" enctype="multipart/form-data">				
			 	<div class="form-group">
					<label for="a_name">이름</label>
					<input type="text" class="form-control" name="a_name" id="a_name" placeholder="이름 입력">
				</div>
					<div class="form-group">
						생년월일
						<select name="year" id="year">
						<option value="1900">연도</option>
						</select>
						<select name="month" id="month" >
						<option value="1">월</option>
						</select>
						<select name="day" id="day" >
						<option value="1">일</option>
						</select>
					
						
						<!-- <input type="date"nclass="form-control" name="a_birth" id="a_birth" > -->
					</div>
					<div class="form-group">
						<label for="a_homepage">홈페이지</label> <input type="text"
							class="form-control" name="a_homepage" id="a_homepage"
							placeholder="홈페이지 입력">
					</div>
					<div class="form-group">
						<label>프로필사진</label> <input type="file"
							class="form-control" name="a_picture" id="a_picture">
					</div>
					<div class="button-group pull-right">
						<button type="submit" class="btn btn-primary" id="submit">
							<i class="fa fa-pencil"></i> 등록
						</button>
						&nbsp; <a href='list' class="btn btn-default"><i
							class="fa fa-list"></i> 취소</a>
					</div>
				</form>
				<!-- / 콘텐츠 부분 -->
	</div>
	<!-- /container-fluid -->
</body>
</html>