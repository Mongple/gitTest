<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<script type="text/javascript" src="/fleamarket/js/jquery-1.12.1.min.js"></script>
<script src="/fleamarket/js/bootstrap.min.js"></script>
<head>
<link href="/fleamarket/css/main.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="/fleamarket/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/fleamarket/css/shop-homepage.css" rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span>
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
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
						<c:if test="${sessionId == null }">
							<a href="/fleamarket/member/login" style="text-decoration: none;cursor: pointer;color: white;">login</a>
							<a href="/fleamarket/member/join" style="text-decoration: none;cursor: pointer;color: white;">join</a>
						</c:if>
						<c:if test="${sessionId != null }">
							<c:if test="${sessionGrant == 'A' }">
								<a style="text-decoration: none; color: white;">${sessionId}님 환영합니다.</a>&nbsp&nbsp
								<a href="/fleamarket/member/logout" style="text-decoration: none;cursor: pointer;color: white;">logout</a>&nbsp&nbsp
								<a href="#" style="text-decoration: none;cursor: pointer;color: white;">AdminPage</a>
							</c:if>
							<c:if test="${sessionGrant == 'U' }">
								<a style="text-decoration: none;color: white;">${sessionId}님 환영합니다.</a>&nbsp&nbsp
								<a href="/fleamarket/member/logout" style="text-decoration: none;cursor: pointer;color: white;">logout</a>&nbsp&nbsp
								<a href="/fleamarket/member/mypage" style="text-decoration: none;cursor: pointer;color: white;">MyPage</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</div>
	
</body>
</html>