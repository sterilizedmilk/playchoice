<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 main"
				style="padding-left: 50px">
				<!-- 콘텐츠 부분 -->
				<h2>
					<i class="fa fa-pencil-square-o text-info" aria-hidden="true"></i>
					배우 등록
				</h2>
				<form id="insertActor" name="insertActor" method="post">
					<div class="form-group">
						<label for="a_name">이름</label> <input type="text"
							class="form-control" name="a_name" id="a_name" placeholder="이름 입력">
					</div>
					<div class="form-group">
						<label for="a_birth">생년월일</label> <input type="password"
							class="form-control" name="a_birth" id="a_birth" placeholder="생년월일 입력">
					</div>
		
					<div class="form-group">
						<label for="a_homepage">홈페이지</label> <input type="text"
							class="form-control" name="a_homepage" id="a_homepage"
							placeholder="홈페이지 입력">
					</div>
					<div class="form-group">
						<label for="a_picture">프로필사진</label> <input type="email"
							class="form-control" name="a_picture" id="a_picture"
							placeholder="프로필사진 입력">
					</div>
					<div class="button-group pull-right">
						<button type="submit" class="btn btn-primary" id="submit">
							<i class="fa fa-pencil"></i> 등록
						</button>
						&nbsp; <a href='list' class="btn btn-default"><i
							class="fa fa-list"></i> 취소</a>
				</form>
				<!-- / 콘텐츠 부분 -->
			</div>
			<!-- /.main -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /container-fluid -->

	



	<jsp:include page="../page/footer.jsp"></jsp:include>
</body>
</html>