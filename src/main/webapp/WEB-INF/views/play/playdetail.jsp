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
	
	var quantity = parseInt($("#quantity").val());  //구매할 티켓수
	var price; // 티켓 가격
	var total; // 티켓 총합
	var scheId; // 스케쥴 아이디
	
	//달력출력
	$('#viewSchedule').click(function(){
		$.ajax({
			type  : "POST"
			,url  : "../show/checkSchedule"
			,data : {"p_id" : ${playDTO.p_id}}
			,dataType : "json"
			,success : function(ppp){
				var list = ppp.list;
				/* var list = new Array();
				for(var i in ppp.list){
					list = ppp.list
				} */
				console.log(list[0]);
				console.log("달력부르기 성공");
				$('#viewSchedule').remove();
	
				console.log(ppp);
				console.log(ppp.msg);
				console.log(ppp.p_id);
				console.log(ppp.list);
				
				frm.s_id.value=ppp.p_id;
				
			}
			,error :function(){
				console.log("에러");
			}
			
		});
		
	});
	
	//스케쥴 선택
	$(".scheduleCho").click(function(){
		price = parseInt($(this).attr("price"))
		total = parseInt($(this).attr("price")) * parseInt($("#quantity").val());
		scheId = $(this).val();
		
		$("#scheText").text(scheId);
		$("#schePrice").text($(this).attr("price")+" 원");
		$("#totalCost").text(total);
		
	});
	
	//매표 수 증가처리
	$('#minus').click(function(){
		//최저 매표 1
		if($('#quantity').val() > 1){
			quantity -=1;
			total = price * quantity;
			$('#quantity').val(quantity);
			$('#ticket').text(quantity);
			$("#totalCost").text(total);
		}else{
			quantity = 1;
			$('#quantity').val(quantity);
		}
		
	})
	$('#plus').click(function(){
		quantity +=1;
		total = price * quantity;
		$('#quantity').val(quantity);
		$('#ticket').text(quantity);
		$("#totalCost").text(total);
	})
	
	//장바구니
	$('#cart').click(function(){
		$("#frmId").val(scheId);
		$("#frmPrice").val(total);
		$("#frmQuantity").val(quantity);
		
		frm.action="bastket";
		frm.submit();
	});
	
	//결제
	$('#charge').click(function(){
		$("#frmId").val(scheId);
		$("#frmPrice").val(total);
		$("#frmQuantity").val(quantity);
		
		frm.action="payment";
		frm.submit();
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
	<div class="row">
	<!-- 좌측 정보 -->
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
			</div>
			<!-- 할인 가격 -->
			<div class="row" style="margin:0 10px; font-size: 18px; color: #ed1c24; font-weight: 400;">
				<div style="float: left;">
					<span id="scheText"></span>
				</div>
				<div style="float: right;">
					<span id="schePrice"></span>
				</div>
				<!-- ${showDTO.s_price} -->
			</div>
			
			<!-- 매수 선택 -->
			<div class="row" style="margin:0 10px; padding:10px 0px;">
				<div style="float:left">
					<button id="minus">
						<i class=" icon-minus"></i>
					</button>
					<input type="text" id="quantity" name="quantity" value="1" style="width:30px;" min="1"/>매
					<button id="plus">
						<i class=" icon-plus"></i>
					</button>
				</div>
				<div style="float:right;">
					<p>총 <span id="ticket"></span>매
					</p>
				</div>
			</div>
			<!-- 총 가격 -->
			<div style="margin:0 10px; padding:15px 0px; text-align:right; border-top:1px solid #eee; font-size: 24px; color:#ed1c24;" >
				<span id="totalCost"></span>
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
            <c:forEach items="${schedule }" var="list" varStatus="status">
            	${list.s_id } <button class="scheduleCho" value="${list.s_id }" price="${list.s_price }">선택</button><br>
            </c:forEach>
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
		<form name="frm" method="post">	
		<input type="hidden" id="frmId" name="s_id" value="" />
		 <%-- value="${showDTO.s_id}" /> --%>
		<input type="hidden" id="" name="m_code" value="${login.m_code }" />
		<%-- value="${login.m_code }" /> --%>
		<input type="hidden" id="frmPrice" name="p_price" value="" />
		<%-- value="${showDTO.s_price} x quantity" --%>
		<input type="hidden" id="frmQuantity" name="p_quantity" value="12000" />
		<%-- value="${showDTO.s_price} x quantity" --%>
		<button id="cart" type="submit" class="btn btn-success btn-lg">장바구니</button>
	</form>
	</div>
	<div style="float:rigth;">
			<button id="charge" class="btn btn-primary btn-lg">구매하기</button>
			</div>
	</div>
	<!-- 버튼 끝 -->
	
	<!-- 리뷰 정보 시작 -->
	<div class="row">
		<div>
			<p style="font-size: 1.5em;">
				예매자 평점 4.5 / 5.0 (3명)
			</p>
		</div>
		<div style="background-color: #FAF4C0; outline:1px solid #eee;">
			<div style="padding:10px 10px; margin:15px 25px; border-bottom: 1px solid #BDBDBD;">
				<p><b>사용자 아이디</b>(입력날짜)</p>
				<p>리뷰 내용</p>
			</div>
			
			<div style="padding:10px 10px; margin:15px 25px; border-bottom: 1px solid #BDBDBD;">
				<p><b>사용자 아이디</b>(입력날짜)</p>
				<p>리뷰 내용</p>
			</div>
			
		</div>
	</div>
	<!-- 리뷰 정보 끝 -->
	
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