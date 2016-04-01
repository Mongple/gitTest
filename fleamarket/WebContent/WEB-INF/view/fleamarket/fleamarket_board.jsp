<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$("#editbtn").click(edit);
	}
	function edit() {
		var baNo = $("#baNo").val();
		$(location).attr('href', 'fleamarket_board_edit?baNo=' + baNo);
	}
	
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		var baNo = $("#baNo").val();
			
		if(result == true){
			$(location).attr('href','deleteBoard?baNo='+baNo);
		}
		else
			return;
	}
	
</script>

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
					<td>${vo.baTitle}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${vo.baContent}</td>
				</tr>
				<tr>
					<td><input type="hidden" name="batype" value="${vo.baType}"></td>
				</tr>
				<tr>
					<c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">					
						<td colspan=2 align=center>
							<input type="button" value="수정" id="editbtn" onclick="edit">
							<input type="button" value="삭제" onclick="delcheck()" >
						</td>
					</c:if>
					<td><input type=reset value="취소"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>