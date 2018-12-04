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

	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     
	     return false;
	});
	
	$("#playScore a").click(function(){
		var playScore = $(this).attr("score");
		$("#r_play_score").val(playScore);
	})
	$("#actorScore1 a").click(function(){
		var actorScore = $(this).attr("score");
		$("#r_actor1_score").val(actorScore);
	})
	$("#actorScore2 a").click(function(){
		var actorScore = $(this).attr("score");
		$("#r_actor2_score").val(actorScore);
	})
	
	// 유효성 검사
	$("#r_content").keyup(function(){
		var length = $("#r_content").val().length;
		$("#r_content").next().text(length)
	})
	
	$("#submit").click(function(){
		if($("#r_content").val() == "" || $("#r_content").val() == null){
			alert("내용을 입력해주세요");
		}
		if($("#r_content").val().length < 5){
			alert("5자 이상 입력해주세요");
			$("#r_content").focus();
			return false;
		}
		if($("#r_content").val().length > 300){
			alert("300자 이하로 입력해주세요");
			$("#r_content").focus();
			return false;
		}		
		
	})
})
</script>
<style>
textarea::placeholder{

	font-weight : bold;
}

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#FFBB00;}

h5{
	padding:15px;
	color:#5D5D5D;
}
</style>
<title>후기작성</title>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="inner-heading">
					<h2>후기</h2>
				</div>
			</div>
			<div class="span8">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i><i class="icon-angle-right"></i></li>
					<li>MY PAGE<i class="icon-angle-right"></i></li>
					<li>결제 내역<i class="icon-angle-right"></i></li>
					<li>상세 내역<i class="icon-angle-right"></i></li>
					<li>후기</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<section id="content">
<div class="container">
	<div class="row">
	<jsp:include page="../member/viewLeftside.jsp" />
		<div class="span10">
			<!-- 연극 평점 -->
			<form action="reviewReg" method="post">
			<div>
				<h5>연극 평점</h5>
			</div>
			<div>
				<p align="center" style="font-size:1.1em;">관람작 : <span style="color:#ED4C00; font-size:1.5em;">${actorList[0].p_name}</span></p>
				<p id="playScore" class="star_rating" align="center">
					<a href="#" class="on" score="1">★</a>
					<a href="#" class="on" score="2">★</a>
					<a href="#" class="on" score="3">★</a>
					<a href="#" score="4">★</a>
					<a href="#" score="5">★</a>
				</p>
			</div>
			<!-- 배우 평점 -->
			<div style="padding:10px; border-top:1px solid #eee; border-bottom:1px solid #eee;">
				<div>
					<h5>배우 평점</h5>
				</div>
				<table style=" width:100% ">
					<tr>
						<td align="center" style="width:20%">
							<img src="<c:url value="/"/>resources/img/actor/${actorList[0].a_picture }" height="170px" style="padding:10px"/>
						</td>
						<td rowspan="2">
							<p id="actorScore1" class="star_rating" align="left">
								<a href="#" class="on" score="1">★</a>
								<a href="#" class="on" score="2">★</a>
								<a href="#" class="on" score="3">★</a>
								<a href="#" score="4">★</a>
								<a href="#" score="5">★</a>
							</p>
						</td>
						<td align="center" style="width:20%">
							<img src="<c:url value="/"/>resources/img/actor/${actorList[1].a_picture }" height="170px" style="padding:10px"/>
						</td>
						<td rowspan="2">
							<p id="actorScore2" class="star_rating" align="left">
								<a href="#" class="on" score="1">★</a>
								<a href="#" class="on" score="2">★</a>
								<a href="#" class="on" score="3">★</a>
								<a href="#" score="4">★</a>
								<a href="#" score="5">★</a>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p align="center">${actorList[0].a_name }</p>
						</td>
						<td>
							<p align="center">${actorList[1].a_name }</p>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- textarea -->
			<div style="margin:20px 0; padding: 20px;">
				<textarea id="r_content"name="r_content" style="width:90%" cols="70%" rows="10" maxlength="300" required placeholder="연극에 대한 후기를 남겨주세요(5 ~ 300자)"></textarea>
			 	<span>0</span>/300
				<div align="right">
					<button id="submit" class="btn btn-success">등 록</button>
					<a class="btn btn-danger" href="${pageContext.request.contextPath}/payment/info?p_id=${p_id}">취 소</a>
				</div>
			</div>
				<input type="hidden" id="r_play_score" name="r_play_score" value="3" />
				<input type="hidden" id="r_actor1_score" name="r_actor1_score" value="3" />
				<input type="hidden" id="r_actor2_score" name="r_actor2_score" value="3" />
				<input type="hidden" name="p_id" value="${p_id}" />
				<input type="hidden" name="s_id" value="${actorList[0].s_id }" />
				<input type="hidden" name="m_code" value="${login.m_code}" />
			</form>
		</div>
	</div>		
</div>
</section>


<jsp:include page="../page/footer.jsp" />
