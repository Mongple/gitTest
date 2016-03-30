<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>플리 보드입력</title>
</head>
<body>
	<div id="fleamarketlist" align="center">
		<h1>fleamarketlist Contents</h1>

		<form name=form1 method=post action="insertAddrBook.do">
			<input type=hidden name="action" value="insert">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="baTitle" maxlength="50"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="email" name="baContent" maxlength="5000"></td>
				</tr>
				
				<tr>
					<td colspan=2 align=center><input type=submit value="저장"><input
						type=reset value="취소"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>