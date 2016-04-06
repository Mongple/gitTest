<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/notice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>


<title>:: Notice Board ::</title>
</head>
<body>
	<div id="noticeBoard">
		<div id="title">
			<span id="title_name">NOTICE BOARD WRITE</span>
		</div>
		<br />

		<div id="inner">
			<div id="content">
				<form name="forminsertboard" method="post" action="/fleamarket/market/writeboard/action">
					<input type="hidden" name="baType" id="baType" value="${vo.baType }">
					<table id="noticeWrite" class="noticeWrite">
						<tr class="noticeWriteTR">
							<th>제목</th>
							<td><input type="text" name="baTitle"></td>
						</tr>
						<tr class="noticeWriteTR">
							<th>내용</th>
							<td><textarea></textarea></td>
						</tr>

						<tr>
							<td colspan=2 align=center>
								<input type="submit" class="btn" value="저장">
								<input type="reset" class="btn" value="다시작성">
								<input type="button" class="btn" value="뒤로" onclick="cancel()">
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>