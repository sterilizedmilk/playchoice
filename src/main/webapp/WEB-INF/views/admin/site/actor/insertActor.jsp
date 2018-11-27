<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../../page/header.jsp" />
<title>배우리스트</title>
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
<style>
	.form-horizontal { padding:20px 10px;}
	.form-horizontal .control-label { width: 100px;}
	.form-horizontal .controls { margin-left: 120px;}
	.form-horizontal .controls input { width: 250px; margin-right: 10px;}
	.form-horizontal .button-group { margin-top: 20px;}
	
	select{
		width:80px;
	}
</style>
</head>
<body>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="span6 offset3">
			<form class="form-horizontal" id="insertActor" name="insertActor" method="post" enctype="multipart/form-data">				
			 	<div class="control-group" style="height: 40px;">
					<label for="a_name">이름</label>
					<input type="text" name="a_name" id="a_name" placeholder="이름">
				</div>
					<div class="control-group">
						<label>생년월일</label>
					
						<select name="year" id="year">
						<option value="1900">연도</option>
						</select>
					
						<select name="month" id="month" >
						<option value="1">월</option>
						</select>
						
						<select name="day" id="day" >
						<option value="1">일</option>
						</select>
						
					</div>
			
					<div class="control-group">
						<label for="a_homepage" >홈페이지</label> <input type="text" name="a_homepage" id="a_homepage"
							placeholder="홈페이지">
					</div>
					<div class="control-group">
						<label>프로필사진</label> <input type="file"
							 name="a_picture" id="a_picture">
					</div>
					<div class="button-group pull-right">
						<button type="submit" class="btn btn-success" id="submit">등록</button>
						<a href='common' class="btn btn-danger"> 취소</a>
					</div>
				</form>
				<!-- / 콘텐츠 부분 -->
			</div>
		</div>
	</div>
</section>
	<!-- /container-fluid -->
</body>
</html>