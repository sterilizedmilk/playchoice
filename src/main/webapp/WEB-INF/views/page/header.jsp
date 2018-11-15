<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/flexslider.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" />

<!-- Theme skin -->
<link
	href="${pageContext.request.contextPath}/resources/skins/default.css"
	rel="stylesheet" />

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/resources/ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="ico/favicon.png" />

<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jcarousel/jquery.jcarousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fancybox-media.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/google-code-prettify/prettify.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/portfolio/jquery.quicksand.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/portfolio/setting.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.flexslider.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.nivo.slider.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ba-cond.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.slitslider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/animate.js"></script>

<!-- Template Custom JavaScript File -->
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</head>
<body>
	<header>
		<div class="container ">
			<div class="row nomargin">
				<div class="span12">
					<div class="headnav">
						<ul>
							<c:choose>
								<c:when test="${empty login }">
									<li><a href="${pageContext.request.contextPath}/member/insert" data-toggle="modal"><i
											class="icon-user"></i> 회원가입</a></li>
									<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li><i class="icon-user"></i> ${login.m_id } 님</li>
									<li><a href="#">마이페이지</a></li>
									<li><a href="member/logout">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
							<li class="dropdown"><a href="page/customergongi">고객센터 </a>
								<ul class="dropdown-menu">
									<li class="dropdown"><a href="#">공지사항<i
											class="icon-angle-right"></i></a></li>
									<li class="dropdown"><a href="#">FAQ<i
											class="icon-angle-right"></i></a></li>
									<li class="dropdown"><a href="#">1:1문의<i
											class="icon-angle-right"></i></a></li>

								</ul></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="span3">
					<div class="logo">
						<a href="main">
							<h1>
								<a href="main"><img
									src="${pageContext.request.contextPath}/resources/img/logo.png"
									alt="" class="logo" /></a>
							</h1>
						</a><br>
						<h1>연극을 좀 더 저렴하게 많은 사람들이</h1>
					</div>
				</div>
				<div class="span3">
					<form class="form-search">
						<input placeholder="Type something" type="text"
							class="input-medium search-query" />
						<button type="submit" class="btn btn-square btn-theme">Search</button>
					</form>
				</div>
				<div class="span6">
					<div class="navbar navbar-static-top">
						<div class="navigation">
							<nav>
								<ul class="nav topnav">
									<li><a href="main">Home</a></li>
									<li class="dropdown"><a href="#">카테고리 <i
											class="icon-angle-down"></i></a>
										<ul class="dropdown-menu">
											<li class="dropdown"><a href="#">타임커머스<i
													class="icon-angle-right"></i></a>
												<ul class="dropdown-menu sub-menu-level1">
													<li><a href="index.html">오늘티켓</a></li>
													<li><a href="index-alt2.html">내일티켓</a></li>
													<li><a href="index-alt3.html">타임세일</a></li>
												</ul></li>
											<li class="dropdown"><a href="#">분류별 공연<i
													class="icon-angle-right"></i></a>
												<ul class="dropdown-menu sub-menu-level1">
													<li><a href="index.html">연극</a></li>
													<li><a href="index-alt2.html">뮤지컬</a></li>
													<li><a href="index-alt3.html">콘서트</a></li>
													<li><a href="index-alt3.html">아동극</a></li>
												</ul></li>
											<li class="dropdown"><a href="#">지역별 공연<i
													class="icon-angle-right"></i></a>
												<ul class="dropdown-menu sub-menu-level1">
													<li><a href="index.html">서울</a></li>
													<li><a href="index-alt2.html">서울 &gt; 대학로</a></li>
													<li><a href="index-alt3.html">서울 &gt; 기타</a></li>
													<li><a href="index-alt3.html">경기</a></li>
													<li><a href="index-alt3.html">대전/충청</a></li>
													<li><a href="index-alt3.html">부산/대구/경상</a></li>
													<li><a href="index-alt3.html">광주/전주/전라</a></li>
													<li><a href="index-alt3.html">기타지역</a></li>
												</ul></li>
											<li class="dropdown"><a href="#">문화정보<i
													class="icon-angle-right"></i></a>
												<ul class="dropdown-menu sub-menu-level1">
													<li><a href="index.html">예매순위</a></li>
													<li><a href="index-alt2.html">티켓리뷰</a></li>
													<li><a href="index-alt3.html">이벤트</a></li>
												</ul></li>
										</ul></li>
									<li><a href="#">오늘(11/11)</a></li>
									<li><a href="#">내일(11/12)</a></li>
									<li><a href="mainlist">전체 일정</a></li>
									<li><a href="#">이벤트</a></li>
									<li><a href="#">주간랭킹</a></li>
								</ul>
							</nav>
						</div>
						<!-- end navigation -->
					</div>
				</div>
			</div>
		</div>
	</header>