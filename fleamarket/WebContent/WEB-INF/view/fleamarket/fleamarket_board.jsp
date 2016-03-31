<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>플리보드</title>
</head>
<body>
	<div align="center">
		<h1>fleamarket board Contents</h1>

		<form name=form1 method=post action="/fleamarket_board">
			<input type=hidden id="baNo" name="baNo" value="${vo.baNo}">


			<table border="1">
				<tr>
					<th>제목</th>
<%-- 					<td><input type="text" name="baTitle" 
					     value="${vo.baTitle}"></td> --%>
					<td>${vo.baTitle}</td>					     
				</tr>
				<tr>
					<th>내용</th>
					<td>${vo.baContent}</td>
				</tr>
				<tr>
					<td><input type="hidden" name="batype" value="${vo.baType}"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>