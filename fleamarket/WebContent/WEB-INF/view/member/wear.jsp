<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

<div align="center">
	<!-- <ul>
		<li>
			<a href="#">가전제품 게시판 활동내역</a>
		</li>
		<li>
			<a href="#">의류 게시판 활동내역</a>
		</li>
		<li>
			<a href="#">나의정보</a>
		</li>
	</ul> -->
	<a href="/fleamarket/member/mypage/product">가전제품 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
	<a href="/fleamarket/member/mypage/wear">의류 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
	<a href="/fleamarket/member/mypage/memberinfo">나의정보</a>
	<br><br>
	<table border="1">
		<tr>			
			<td>게시물번호</td>
			<td>활동유형</td>
			<td>게시글작성자</td>
			<td>게시글제목</td>
			<td>게시글작성날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>${vo.baNo }</td>	
				<c:if test="${sessionId == vo.memId}">
					<td>게시글작성</td>
				</c:if>
				<c:if test="${sessionId != vo.memId}">
					<td>댓글작성</td>
				</c:if>
				<td>${vo.memId}</td>	
				<td>${vo.baTitle}</td>
				<td>${vo.baDate}</td>
				<td>${vo.baCount}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<!-- 	<div id="mypage" align="center"style="width: 500px">
		<ul class="nav nav-pills">
		  <li class="active"><a href="#">Home</a></li>
		  <li><a href="#">Menu 1</a></li>
		  <li><a href="#">Menu 2</a></li>
		  <li><a href="#">Menu 3</a></li>
		</ul>
	</div> -->
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>