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
		<h1>fleamarket board edit</h1>

		<form name="editform" method="post" action="updateBoard">
		<input type=hidden id="baNo" name="baNo" value="${vo.baNo}">
		<input type=hidden id="memNo" name="memNo" value="${vo.memNo}">
		<input type=hidden id="baType" name="baType" value="${vo.baType}">
			<table >

<%-- 				<tr>
					<th>게시판종류</th>
					<td><input type="text" name="baType" value="${vo.baType}"></td>
				</tr> --%>
				<tr>
					<th>제목</th>
					<td><input type="text" name="baTitle" value="${vo.baTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="baContent" value="${vo.baContent}">
					<%-- <td><textarea name=baContent rows ="10" cols="100" value="${vo.baContent}"></textarea></td> --%>
				</tr>

				<tr>
					<td colspan=2 align=center>
						<input type=submit value="저장">
						<input type=reset value="취소"> 

					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>