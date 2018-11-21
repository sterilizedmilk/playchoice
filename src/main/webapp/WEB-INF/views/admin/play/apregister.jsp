<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />

<title>Insert title here</title>

<h2 align="center">연극 정보 입력</h2>
<form role="form" method="post" enctype="multipart/form-data">
	<div class="box-body">
		<div class="form-group">
			<label for = "exampleInputEmail1">글 제목</label>
			<input type="text" name = "p_name" class="form-contorl" placeholder="Enter Title">
		</div>
		
		<div class="from-group">
			<label for = "exampleInputPassword1">글 내용</label>
			<textarea class="from-contorl" name="p_info" cols="100%" rows="50%">
예매정보

공연기간: 년 월 일 - 월 일

예매가능시간: 공연 분 전 까지

 

관람정보

관람등급: 만 세 이상(신분증/학생증 지참)

공연시간: 약 분

티켓배부: 현장수령(공연 분 전부터 공연장 앞 매표소 배부)

티켓교환: 문자/마이티켓 제시 및 본인확인 후 발권

좌석배정: 공연장 입장 순서대로 자유석 배정

입장시간: 공연 시작 분 전 부터 입장 가능

※좌석은 현장에서 배정되며, 따로 예매하더라도 함께 발권하면 연석 배정 가능합니다.

 

주의사항

※타임티켓은 비지정석 예매입니다. 상단 좌석배정 방식을 확인하세요!

※당일 관람티켓 취소/환불/변경 불가 - 신중히 구매해주세요.

공연 시작 후 입장 불가, 공연 중 퇴장 시 재입장 불가

지각으로 관람하지 못할 시 취소/환불/변경 불가

관람 연령 미숙지로 인한 취소/환불/변경 불가

음식물 반입 금지, 공연 중 사진/동영상 촬영 금지

공연 취소/변경 발생시, 개별 연락을 드릴 수 있습니다.

지도에서 미리 확인하세요

장소:  / 총 석
주소: 
문의전화: 
주차여부: 불가(인근 유료주차장 이용)
</textarea>
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">파일 추가</label>
			<input type="file" name="p_picture" class="form-contorl">
		</div>
		
	</div>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">완료</button>
	</div>
</form>