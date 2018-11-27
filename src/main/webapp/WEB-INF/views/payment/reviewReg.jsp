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
<style>
textarea::placeholder{

	font-weight : bold;
}
select{
	width:80px;
}
</style>
<title>후기작성</title>

<div class="container">
	<div class="row">
	<h2>리뷰작성</h2>
		<div class="span12">
		<form class="form-group" action="reviewReg" method="post">
			<div style="height:100px; border-bottom: 1px solid #8C8C8C; text-align:center; line-height:100px; align-items: center;">
				<p style="font-size:1.5em;">${p_name} &nbsp;&nbsp;&nbsp; <select name="r_play_score"></select></p>
			</div>
			<div style="margin:20px 0 20px 0; height:200px;">
				<div style="float:left; width:50%; height:100%; padding:10px;">
				<img src="<c:url value="/"/>resources/img/actor/${actorList[0].a_picture }" height="170px" style="padding:10px"/>
				${actorList[0].a_name } &nbsp;&nbsp;&nbsp; <select name="r_actor1_score"></select>
				</div>	
				<div>
				<img src="<c:url value="/"/>resources/img/actor/${actorList[1].a_picture }" height="170px" style="padding:10px"/>
				${actorList[1].a_name } &nbsp;&nbsp;&nbsp; <select name="r_actor2_score"></select>
				</div>
			</div>
			<div style="margin:20px 0; padding: 20px 0; border-top:1px soild #8C8C8C;">
				<textarea name="r_content" style="width:80%" cols="70%" rows="10" placeholder="연극에 대한 후기를 남겨주세요!"></textarea>
			</div>
				<input type="hidden" name="s_id" value="${s_id}" />
				<input type="hidden" name="m_code" value="${login.m_code}" />
			<button class="btn btn-success">등 록</button>
			<a class="btn btn-danger" href="..">취 소</a>
		</form>
		</div>
	</div>
</div>


<jsp:include page="../page/footer.jsp" />
