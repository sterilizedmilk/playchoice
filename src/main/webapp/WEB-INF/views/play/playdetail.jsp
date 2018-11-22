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
<style type="text/css">
.qna_question{
	outline: 1px solid #eee;
	padding : 10px;
	margin: 30px 0 0 0;

}

.qna_answer{
	outline: 1px solid #eee;
	padding: 10px;
	background-color:#FAF4C0;
	margin : 0px 0px 30px 0px;

}

</style>
<script>
$(document).ready(function(){
	
	var quantity = parseInt($("#quantity").val());  //구매할 티켓수
	var price; // 티켓 가격
	var total; // 티켓 총합
	var scheId; // 스케쥴 아이디
	
	$('#ticket').text(quantity); // 티켓 수 출력
	
	
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
	
	//매표 수 마이너스
	$('#minus').click(function(){
		//최저 매표 1
		if($('#quantity').val() > 1){
			quantity -=1;
			total = price * quantity;
			$('#quantity').val(quantity);
			$('#ticket').text(quantity); // 티켓 수 출력
			$("#totalCost").text(total); // 총가격 출력
			
		}else{
			quantity = 1;
			$('#quantity').val(quantity);
		}
		
	})
	//매표 수 플러스
	$('#plus').click(function(){
		quantity +=1;
		total = price * quantity;
		$('#quantity').val(quantity);
		$('#ticket').text(quantity); // 티켓 수 출력
		$("#totalCost").text(total); // 총가격 출력
	})
	
	//장바구니
	$('#cart').click(function(){
		$("#frmId").val(scheId);
		$("#frmPrice").val(total);
		$("#frmQuantity").val(quantity);
		
		frm.action="${pageContext.request.contextPath}/basket/insert";
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
	
	// Q & A 등록
	$("#qsubmit").click(function(){
		qfrm.action="../qna/insertQues";
		qfrm.submit();
		
	})
	
	// Q & A 삭제
	$(".deleteQna").click(function(){
		var m_code = $(this).attr("m_code");
		var p_id = $(this).attr("p_id");
		var q_id = $(this).attr("q_id");
		
		var q_info = {
				"m_code" : m_code
				,"p_id" : p_id
				,"q_id" : q_id				
		}
		
		$.ajax({
			type : "post"
			,url  : "../qna/delete"
			,data : q_info
			,success : function(data){
				console.log("아작스 들어오기 성공")
			}
			,error : function(){
				console.log("아작스 에러");
			}
		})
		console.log(m_code);
		console.log(p_id);
	});
	
	
	
/* 	
	<c:forEach items="${res.reviews }" var="list" varStatus="status">
	<div style="border-bottom: 1px solid #eee;">
		<p>
			${list.r_play_score}
		</p>
		<p>
			${list.r_content }
		</p>
		<p>
			${list.m_id } <span style="font-size: 0.5ex">(${list.r_register_time })</span>
		</p>
	</div>
</c:forEach> */


	//리뷰 전체보기
/* 	$("#review").click(function(){
		$.ajax({
			type  : "POST"
			,url  : "../review/playtotalreview"
			,data : {"p_id" : ${playDTO.p_id}}
			,dataType : "json" 
			,success : function(res){
				console.log(res.reviews);
				
				for(var rr in res.reviews){
					var new_item = $("<div style='border-bottom: 1px solid #eee;' />");
					new_item.html('<p>'+res.reviews[rr]["r_play_score"]+' 점</p>');
					new_item.html('<p>'+res.review[rr]["r_content"]+'</p>');
					
					var p_sec = $("<p>");
					
				
					$("#reviews").append(new_item);
				}
			}
			
		});
	}); */
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
				<span id="totalCost"> </span><span> 원</span>
				
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
		<input type="hidden" id="frmPid" name="p_id" value="${playDTO.p_id }" />
		<input type="hidden" id="" name="m_code" value="${login.m_code }" />
		
		<input type="hidden" id="frmPrice" name="p_price" value="" />
		
		<input type="hidden" id="frmQuantity" name="p_quantity" value="12000" />
		
		<button id="cart" type="submit" class="btn btn-success btn-lg">장바구니</button>
	</form>
	</div>
	<div style="float:rigth;">
			<button id="charge" class="btn btn-primary btn-lg">구매하기</button>
			</div>
	</div>
	<!-- 버튼 끝 -->
	
	<!-- 최근 리뷰 정보 시작 -->
	<div class="row">
		<div>
			<p style="font-size: 1.5em;">
				예매자 평점 ${reviewScore.avgscore } / 5.0 (${reviewScore.cnt }명)
			</p>
		</div>
		<div style="background-color: #FAF4C0; outline:1px solid #eee;">
			<c:forEach items="${reviewSmall }" var="reviewList" begin="0" end="1">
			<div style="padding:10px 10px; margin:15px 25px; border-bottom: 1px solid #BDBDBD;">
				<p><b>${reviewList.m_id }</b>(${reviewList.r_register_time })</p>
				<p>${reviewList.r_content }</p>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 최근 리뷰 정보 끝 -->
	
	<!-- 탭정보 출력 -->
	<div class="row" style="align-content: center;">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#one" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;"><span style="font-size: 2em">안 내</span></a></li>
			<li><a href="#two" id="review" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">후 기</a></li>
			<li><a href="#three" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">Q & A</a></li>
			<li><a href="#four" data-toggle="tab" style="padding-left: 100px; padding-right: 100px;">환불규정</a></li>
		</ul>	
		<div class="tab-content">
			<div class="tab-pane active" id="one">
				<p>연극 안내 페이지</p>
			</div>
			<!-- 리뷰 탭 -->
			<div class="tab-pane" id="two">
				<div align="center" style="padding:20px; margin:10px 30px; outline:1px solid #eee; align-content: center;">
					<p >평균 <span style="font-size: 1.5em">${reviewScore.avgscore }</span>  점</p>
					<p>별 그림</p>
					<p>실제 관람객들 후기입니다.</p>
				</div>
				<div id="reviews" style="margin:10px 30px;">
					<c:forEach items="${reviewSmall}" var="list" varStatus="status">
						<div style="border-bottom: 1px solid #eee;">
							<p>
								${list.r_play_score} 점 / 5 점
							</p>
							<p>
								${list.r_content }
							</p>
							<p>
								${list.m_id } <span style="font-size: 0.5ex">(${list.r_register_time })</span>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 리뷰 탭 종료 -->
			<!-- Q & A 탭 -->
			<div class="tab-pane" id="three">
				<div style="margin:20px;">
					<!-- 질문 작성 -->
					<p>연극에 대한 궁금증을 남겨주세요!</p>				
					<div style="background-color:#FAF4C0; ">
						<form id="qfrm" method="post">
						<textarea id="q_content" name="q_content" style="margin:10px 30px 10px 10px; height:100px; width:80%;"></textarea>
						<input type="hidden" name="p_id"  value="${playDTO.p_id }"/>
						<input type="hidden" name="m_code" value="${login.m_code }"/>
						<button id="qsubmit">등 록</button>
						</form>
					</div>
					<!-- 다른 질문 보기 -->
					<div style="margin:70px 0 0 0;">
						<c:forEach items="${qnaAll}" var="list">
						<c:set var="className" value="qna_question" />
							<c:if test="${list.q_id != list.q_target_id }">
								<c:set var="className" value="qna_answer" />
							</c:if>
							<div class="${className }">
								<p style="font-weight: bold;">${list.m_id } | ${list.q_time}
									<a class="deleteQna" value="${list.q_id }" m_code="${list.m_code}" p_id="${list.p_id}"><i class="icon-remove-circle"></i></a>
								</p>
								<p>${list.q_content }</p>
							</div>
						</c:forEach>
					
					
					
					
						<!-- <div style="padding: 10px; border-bottom: 1px solid #eee;">
							<p>질문</p>
						</div>
						<div style="padding: 10px; background-color:#FAF4C0;">
							<p>답변</p>
						</div> -->
					</div>
				</div>
			</div>
			<!-- Q & A 탭 종료 -->
			<!--  환불정책 탭 -->
			<div class="tab-pane" id="four">
				<p>${playDTO.p_refund_policy }</p>
			</div>
			<!--  환불정책 종료 -->
		</div>
		<!-- 탭 종료 -->
	</div>
	<!-- 중앙정보 종료 -->
</div>
<!-- 끝 -->

<jsp:include page="../page/footer.jsp" />