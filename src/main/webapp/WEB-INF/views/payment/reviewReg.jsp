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
	color : blue;
	font-weight : bold;
}
</style>
<title>후기작성</title>

<div class="container">
	<div class="row">
	<h2>리뷰작성</h2>
		<div class="span12">
		<form action="reviewReg" method="post">
			<div style="height:100px; outline:1px solid black; text-align:center; line-height:100px; align-items: center;">
				<p>${p_name}<select name="r_play_score"></select></p>
			</div>
			<div style="margin:20px 0 20px 0; background-color: lime; height:200px; outline:1px solid green;">
				<div style="float:left; width:50%; height:100%; padding:10px; outline:1px solid blue; background-color:olive;">
				<img src="<c:url value="/"/>resources/img/actor/${actorList[0].a_picture }" width="170px" height="170px" style="padding:10px"/>
				${actorList[0].a_name }<select name="r_actor1_score"></select>
				</div>	
				<div style="background-color:aqua;">
				<img src="<c:url value="/"/>resources/img/actor/${actorList[1].a_picture }" width="170px" height="170px" style="padding:10px"/>
				${actorList[1].a_name } <select name="r_actor2_score"></select>
				</div>
			</div>
			<div style="margin:20px 0; padding: 20px 0; border-top:1px soild #8C8C8C; background-color: yellow;">
				<textarea name="r_content" style="width:80%" cols="70%" rows="10" placeholder="ghghghgh">
					
				</textarea>
			</div>
				<input type="hidden" name="s_id" value="${s_id}" />
				<input type="hidden" name="m_code" value="${login.m_code}" />
			<button>등록</button>
		</form>
		</div>
	</div>
</div>


<jsp:include page="../page/footer.jsp" />
