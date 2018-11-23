<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<%-- <link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" /> --%>

<title>Insert title here</title>
<%-- <form name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data">
	<input multiple="multiple" type="file" name="file" />
	<input type="text" name="src" />
	<input type="submit" value="전송" />
</form> --%>

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
		<div class="from-group">
			<label for = "exampleInputPassword1">환불 규정</label>
			<textarea class="from-contorl" name="p_refund_policy" cols="100%" rows="50%">
환불규정 및 안내사항

[환불규정]

※구매시점과 무관하게 관람 당일 환불/취소/변경 불가

※관람 당일 지각/지역착오/연령 미숙지로 인한 환불/취소/변경 불가

1) 구매 당일 요청 시 전액 환불 (단, 당일 관람티켓은 환불 불가)
2) 관람일 7일 전~ : 티켓 금액 전액 환불
3) 관람일 6일 전 ~ 4일 전까지 : 10% 공제 후 환불
4) 관람일 3일 전 ~ 2일 전까지 : 20% 공제 후 환불
5) 관람일 1일 전 : 30% 공제 후 환불
6) 관람일 당일(자정 이후) : 환불/취소/변경 불가

※ 공제금은 신청일 기준으로 산정됩니다.
※ 공제금 입금 또는 공제금 확인 회신이 완료되어야 환불이 가능합니다.
※ 날짜/시간/티켓 변경은 불가하며, 환불 후 재구매해주셔야 합니다.
※ 휴대폰결제는 결제월 이후 환불하는 경우 결제 수수료 5%가 추가 청구됩니다.

[환불방법]

- '마이티켓 > 구매내역'에서 '환불요청' 버튼 클릭 후 요청

- 구매시점과 무관하게 관람 당일은 환불/취소/변경 불가

- 환불 규정에 따라 24시간 내 환불 절차 진행

※ 결제수단별 공제금 발생 시 환불 방법

1) 카드결제: 공제금 제외 금액을 카드결제 부분취소 환불
2) 휴대폰결제: 공제금을 안내계좌로 입금하면 결제내역 전액취소
3) 무통장/실시간계좌이체: 공제금을 제외한 금액을 회원 계좌로 이체
* 휴대폰결제 취소는 '구매월'에만 가능하며, 구매월이 아닌 경우 계좌이체로 환불
</textarea>
		</div>
		<div class="form-group">
			<label for = "exampleInputEmail1">찾아오시는 길(상세 주소)</label>
			<input type="text" name = "p_location" class="form-contorl" placeholder="Enter location">
		</div>
<!-- <script>
	$(function(){
		var i = 0;
		$("#button").click(function(){
			$("#fileDiv").append('<input type="file" name="p_picture[' + ++i + ']" class="form-contorl">');
		});
	});
</script>
		<div class="form-group" id="fileDiv">
		<button type="button" id="button">버튼</button>
			<label for = "exampleInputEmail1">파일 추가</label>
			<input type="file" name="p_picture[0]" class="form-contorl">
		</div> -->
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">대표 포스터 추가</label>
			<input type="file" name="p_image">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">메인 썸네일 포스터 추가</label>
			<input type="file" name="p_image">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 추가 1</label>
			<input type="file" name="p_image">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 추가 2</label>
			<input type="file" name="p_image">
		</div>
		<div class="form-group" id="fileDiv">
			<label for = "exampleInputEmail1">내용 포스터 추가 3</label>
			<input type="file" name="p_image">
		</div>
		<div class="form-group">
			<label>장르</label>
			<select name="g_id">
				<option value="1">로맨틱코미디</option>
				<option value="2">공포/스릴러</option>
				<option value="3">드라마</option>
				<option value="4">코믹</option>
				<option value="5">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label>지역</label>
			<select name="a_id">
				<option value="1">서울/대학로</option>
				<option value="2">서울/기타</option>
				<option value="3">경기</option>
				<option value="4">대전/충청</option>
				<option value="5">부산/대구/경상</option>
				<option value="6">광주/전주/전라</option>
			</select>
		</div>
	</div>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">완료</button>
		<input type="button" onclick="history.go(-1)" value="취소">
	</div>
</form>