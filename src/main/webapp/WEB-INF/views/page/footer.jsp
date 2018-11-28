<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%@ page import="java.util.*, java.text.*"%>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("MM-dd");
	String strdate = simpleDate.format(date);
	Calendar cal = Calendar.getInstance();
%>

<c:set var="date" value="<%=date%>" scope="session" />

<footer>
	<div class="container">
		<div class="row">
			<div class="span4">
				<div class="widget">
					<h5 class="widgetheading">Browse pages</h5>
					<ul class="link-list">
						<li><a href="${pageContext.request.contextPath}">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/play/mainlist?a_id=0&g_id=0&s_tab=todaylist">
								오늘(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE)%>)
							</a></li>
						<li><a href="${pageContext.request.contextPath}/play/mainlist?a_id=0&g_id=0&s_tab=tomorrowlist">
								내일(<%=cal.get(Calendar.MONTH) + 1%>/<%=cal.get(Calendar.DATE) + 1%>)
							</a></li>
						<li><a href="${pageContext.request.contextPath}/play/mainlist">전체 일정</a></li>
						<li><a href="${pageContext.request.contextPath}/actor/list">배우</a></li>
						<li><a href="${pageContext.request.contextPath}/rank">주간랭킹</a></li>
					</ul>
				</div>
			</div>
			<div class="span4">
				<div class="widget">
					<h5 class="widgetheading">Important stuff</h5>
					<ul class="link-list">
						<li>김정대</li>
						<li>추윤지</li>
						<li>양병길</li>
						<li>이승휘</li>
						<li>최태식</li>
					</ul>
				</div>
			</div>
			<!-- <div class="span3">
				<div class="widget">
					<h5 class="widgetheading">Flickr photostream</h5>
					<div class="flickr_badge">
						<script type="text/javascript"
							src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
					</div>
					<div class="clear"></div>
				</div>
			</div> -->
			<div class="span4">
				<div class="widget">
					<h5 class="widgetheading">Get in touch with us</h5>
					<address>
						<strong>더 조은 아카데미</strong><br> 서울특별시 종로구 삼일대로17길 51 <br> 스타골드빌딩 3,4,5층
					</address>
					<p>
						<i class="icon-phone"></i> (02) 738-5001 - (010) 9230-2653 <br> <i class="icon-envelope-alt"></i> www.thoeun.co.kr
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="sub-footer">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="copyright">
						<p>
							<span>&copy; Flattern - All right reserved.</span>
						</p>
						<div class="credits">
							<!--
                    All the links in the footer should remain intact.
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Flattern
                  -->
							Designed by
							<a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- javascript
    ================================================== -->
</body>
</html>