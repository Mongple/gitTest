<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	/* 	$(document).ready(init);

	 function init() {
	 $("#editbtn").click(edit);
	 } */
	function cancel() {
		var baType = $("#baType").val();
		result = confirm("정말로 취소하시겠습니까 ?");

		if (result == true) {
			if (baType == "WEAR") {
				$(location).attr('href', 'fleamarket');
			} else {
				$(location).attr('href', 'fleamarket_prod');
			}
		} else
			return;
	}
</script>


<title>게시글등록</title>
</head>
<body>
	<div align="center">
		<h1>fleamarket board write${vo.baType }</h1>
		<form name="forminsertboard" method="post" action="fleamarket_board_write_action">
			<input type="hidden" name="baType" id="baType" value="${vo.baType }">
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
					<td colspan=2 align=center>
						<input type=submit value="저장">
						<input type="button" value="뒤로" onclick="cancel()">
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>