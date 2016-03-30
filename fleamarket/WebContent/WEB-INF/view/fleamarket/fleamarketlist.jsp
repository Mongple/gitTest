<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>플리 리스트1</title>
</head>
<body>
	<div id="fleamarketlist" align="center">
		<h1>fleamarketlist Contents</h1>
 
		<form>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>

				</tr>
				<!-- jstl -->
				<c:forEach items="${list}" var="vo">
					<tr>
						<td><a>${vo.baNo}</a></td>
						<td>${vo.baTitle}</td>
					</tr>
				</c:forEach>
				<!-- jstl -->
			</table>
		</form> 
	</div>


</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>