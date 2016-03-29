<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<div id="gnb">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#gnb2">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/fleamarket/">FleaMarket</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div id="gnb2" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/fleamarket/info">info</a></li>
						<li><a href="/fleamarket/fleamarket">fleamarket</a></li>
						<li><a href="/fleamarket/notice">notice</a></li>
					</ul>
					<div id="loginbtn" align="right" style="margin-top: 15px">
						<c:choose>
							
							<c:when test="${sessionId == null }">
								<a href="/fleamarket/login">로그인</a>
								<a href="/fleamarket/join">회원가입</a>
							</c:when>
							<c:otherwise>
								<c:if test="${memGrant=='U'}">
									<a>${sessionId }님 환영합니다.   </a>
									<button type="button">로그아웃</button>
									<button type="button">MyPage</button>
								</c:if>
								
								<c:if test="${memGrant=='A'}">
									<a>${sessionId }님 환영합니다.   </a>
									<button type="button">로그아웃</button>
									<button type="button">AdminPage</button>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</div>
	
</body>
</html>