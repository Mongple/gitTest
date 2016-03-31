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
<div>
	<a href="#">활동내역</a>
	<a href="#">나의정보</a>
	<br><br>
</div>
<div>
	<table border="1">
		<tr>
			<td>No.</td>
			<td>유형</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성날짜</td>
			<td>조회수</td>
		</tr>
		<tr>
		</tr>
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