<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>게시글등록</title>
</head>
<body>
	<div align="center">
		<h1>fleamarket board write</h1>

		<form name="form1" method="post" action="fleamarket_board_edit_action">
			<input type="hidden" name="action" value="insert">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="baTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="baContent"></td>
				</tr>
				<tr>
				<th>타입</th>
					<td><input type="text" name="batype"></td>
					<%-- <td><input type="date" name="baDate" value="${vo.baDate}"></td> --%>
				</tr>
				<th>memNo</th>
					<td><input type="text" name="memNo"></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type=submit value="저장">
						<input type=reset value="취소"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>