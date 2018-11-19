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
	//달력출력
	$('#viewSchedule').click(function(){
		$.ajax({
			type  : "POST"
			,url  : "../show/checkSchedule"
			,data : {"p_id" : ${playDTO.p_id}}
			,dataType : "json"
			,success : function(param){
				var list = new Array();
				for(var i in param.list){
					list = param.list
				}
				console.log(list[0]);
				console.log("달력부르기 성공");
				$('#viewSchedule').remove();
	
				console.log(param);
				console.log(param.msg);
				console.log(param.p_id);
				console.log(param.list);
				
			}
			,error :function(){
				console.log("에러");
			}
			
		});
		
	});
	
	//매표 수 증가처리
	$('#minus').click(function(){
		console.log("gh");
		$('#cnt').val();
		
	})
	$('#plus').click(function(){
		console.log("plus");
		$('#cnt').val();
	})
	
	//장바구니
	$('#cart').click(function(){
		console.log("cart");
	});
	
	//결제
	$('#charge').click(function(){
		
	});
});
</script>
<!-- <script>
    function calendar(date) {
        $.ajax({
            url : "${pageContext.request.contextPath}/show/updateCalendar?year=" + date.getYear() + "&month=" + (date.getMonth() + 1),
            type : "get",
            success : function(data) {
            	var cal = $("#calendar");
            	cal.empty();
                var day = (new Date(date.getFullYear(), date.getMonth(), 1)).getDay();
                var lastDate = (new Date(date.getFullYear(), date.getMonth() + 1 , 0)).getDate();
        		var str = "";
                str += "<tr>";
                for (i = 1 - day, day = 0; ; ++i) {
                	if (i > 0) {
        	        	str += "<td class=''>";
        	        	str += i;
						if (data[i]) {
	        	        	for (j = 0; j < Object.keys(data[i]).length; ++j)
		        	        	str += " " + data[i][j]["a_name1"] + "<br>" + data[i][j].a_name2;
						}
                	}
                	else {
        	        	str += "<td style='background-color: gray;'>";
                	}
                	str += "</td>";
                	if (i == lastDate)
                		break;
                    if (++day == 7) {
                    	day = 0;
                    	str += "</tr><tr>";
                    }
                }
        		str += "</tr>";
        		cal.append(str);
        	}
        });
   	}
    

    $(function() {
    	calendar(new Date());
    });
</script> -->
<title>Insert title here</title>

<form role="form" method="post">
	<input type="hidden" name="p_id" value="${playDTO.p_id }">
</form>
<div class="container">
	<!-- 좌측 정보 -->
	<div class="row">
	<div class="col-md-5"style="float: left; position: relative;  margin-right: 15px; background: #fff;">
		<!-- 이미지 -->
		<img src="/playChoice/resources/img/play/oktap.jpg"
			style="width: 480px; padding: 10px 10px 7px 10px; outline:1px solid #eee;" >
		<!--  이미지 끝 -->
		
		<!-- 연극 제목 및 가격정보 -->
		<div>
			<!-- 제목 -->
			<div style="text-align:center; padding: 15px 10px">
				<span style="margin-left: 2px; font-size: 20px; font-weight: 500; 
				 color: #000;">${playDTO.p_name }</span>
			</div>
			<!-- 제목 끝 -->
		
			<!-- 정가 가격  -->
			<div style="margin:0 10px; padding: 15px 0 0px 0; font-size: 12px; font-weight: 300; color: #8b8b8b;
				border-top:1px solid #eee;">
				<p>
					{showDTO.s_id}
				</p>
			</div>
			<!-- 할인 가격 -->
			<div class="row" style="margin:0 10px; font-size: 18px; color: #ed1c24; font-weight: 400;">
				<div style="float: left;">
					최대 60<span style="font-size: 14px;">%</span> 할인
				</div>
				<div style="float: right;">12,000원~</div>
			</div>
			
			<!-- 매수 선택 -->
			<div class="row" style="margin:0 10px; padding:10px 0px;">
				<div style="float:left">
					<button id="minus">
						<i class=" icon-minus"></i>
					</button>
					<input type="text" name="cnt" value="1" style="width:30px;" />매
					<button id="plus">
						<i class=" icon-plus"></i>
					</button>
				</div>
				<div style="float:right;">
					<span>총 1매</span>
				</div>
			</div>
			<!-- 총 가격 -->
			<div style="margin:0 10px; padding:15px 0px; text-align:right; border-top:1px solid #eee; font-size: 24px; color:#ed1c24;" >
				합 : 10000원
			</div>
			<!-- 총 가격 끝 -->
		</div>
		<!-- 연극 제목 및 가격 정보 끝 -->
	</div>
	<!--  좌측정보 끝 -->
	
	<!-- 우측 상단 정보영역 시작 -->
	<div class="col-md-7" style="margin:0px 10px; float:left; border:1px solid blue">
		<button id="viewSchedule">달력보기</button>
		<div>
          <!--   <table id="calendar" border="1">
            </table> -->
        </div>
	</div>
	</div>
	<!-------- 우측 정보영역 끝 -------->
	<!-- divider -->
	<div class="row">
			<div class="solidline"></div>
	</div>
	<!-- end divider -->

	<!-- 중앙 정보 시작 -->
	<!-- 장바구니/결제 버튼 -->
	<div class="row" align="right" style="outline:1px solid blue;">
		<div style="float:rigth;">
		<form action="">	
		<input type="hidden" name="" />
		<input type="hidden" name="" />
		<button id="cart" type="submit" class="btn btn-success btn-lg">장바구니</button>
	</form>
	</div>
	<div style="float:rigth;">
			<a href=""><button id="charge" class="btn btn-primary btn-lg">구매하기</button></a>
			</div>
	</div>
	<!-- 버튼 끝 -->
	<!-- 탭정보 출력 -->
	<div class="row" style="align-content: center;">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#one" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;"><span style="font-size: 2em">안 내</span></a></li>
			<li><a href="#two" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">후 기</a></li>
			<li><a href="#three" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">Q & A</a></li>
			<li><a href="#four" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">환불규정</a></li>
		</ul>	
		<div class="tab-content">
			<div class="tab-pane active" id="one">
				<p>연극 안내 페이지</p>
			</div>
			<div class="tab-pane" id="two">
				<p>후기 페이지</p>
			</div>
			<div class="tab-pane" id="three">
				<p>Q & A 페이지</p>
			</div>
			<div class="tab-pane" id="four">
				<p>환불 규정 페이지</p>
			</div>
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />